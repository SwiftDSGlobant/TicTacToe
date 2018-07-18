//
//  BoardView.swift
//  TicTacToe
//
//  Created by Aldo Antonio Martinez Avalos on 04/07/18.
//  Copyright © 2018 Aldo Avalos. All rights reserved.
//

import UIKit

protocol BoardViewDelegate: class {
    func didPlayerWin(player: Player)
}

class BoardView: UIView {
    
    weak var delegate: BoardViewDelegate?
    
    private var board = Board()
    private var turn: Player = .O

    private var gridSize: CGFloat {
        return frame.size.width / 3.0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure() {
        board.delegate = self
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapRecognizer(gesture:)))
        addGestureRecognizer(gestureRecognizer)
        createBoardGrid()
        setupMoves()
    }
    
    func resetBoard() {
        subviews.forEach({ $0.removeFromSuperview() })
        board.reset()
        createBoardGrid()
    }
    
    func setupMoves() {
        for move in board.moves.values {
            configureMoveLabel(board: board, move: move)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for subView in subviews {
            let coordinate = coordinateFromPoint(point: subView.center)
            positionViewInGrid(subview: subView, atCoordinate: coordinate)
        }
    }
    
    private func positionViewInGrid(subview: UIView, atCoordinate coordinate: Coordinate) {
        subview.frame = CGRect(
            x: CGFloat(coordinate.column) * gridSize,
            y: CGFloat(coordinate.row) * gridSize,
            width: gridSize,
            height: gridSize
        )
    }
    
    private func createBoardGrid() {
        for row in 0..<3 {
            for column in 0..<3 {
                let coordinate = Coordinate(row: row, column: column)
                let view = UIView()
                
                view.layer.borderColor = UIColor.black.cgColor
                view.layer.borderWidth = 2.0
                
                addSubview(view)
                positionViewInGrid(subview: view, atCoordinate: coordinate)
            }
        }
    }
    
    private func addMove(at coordinate: Coordinate) {
        board.addMove(move: Move(player: turn, coordinate: coordinate))
    }
    
    private func coordinateFromPoint(point: CGPoint) -> Coordinate {
        return Coordinate(row: Int(point.y / gridSize), column: Int(point.x / gridSize))
    }
    
    @objc private func tapRecognizer(gesture: UITapGestureRecognizer) {
        let point = gesture.location(in: self)
        let coordinate = coordinateFromPoint(point: point)
        addMove(at: coordinate)
    }
    
}

extension BoardView: BoardDelegate {

    func didAddMoveToBoard(board: Board, move: Move) {
        configureMoveLabel(board: board, move: move)
        turn = board.turn
        if turn == .X {
            board.nextMove()
        }
    }
    
    func didPlayerWin(board: Board, player: Player) {
        delegate?.didPlayerWin(player: player)
    }
    
    func configureMoveLabel(board: Board, move: Move) {
        let label = UILabel()
        label.text = move.player.rawValue
        label.textAlignment = .center
        label.font = label.font.withSize(40.0)
        label.textColor = move.player.color
        addSubview(label)
        positionViewInGrid(subview: label, atCoordinate: move.coordinate)
    }

}
