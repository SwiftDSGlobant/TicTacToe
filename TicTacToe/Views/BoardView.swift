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
    
    private let kDimension: Int = 3
    private let kDepth: Int = 5
    
    weak var delegate: BoardViewDelegate?
    
    private var board: Board?
    private var turn: Player = .O

    private var gridSize: CGFloat {
        return frame.size.width / CGFloat(kDimension)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure() {
        board = Board(dimension: kDimension, depth: kDepth)
        board?.delegate = self
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapRecognizer(gesture:)))
        addGestureRecognizer(gestureRecognizer)
        createBoardGrid()
        setupMoves()
    }
    
    func resetBoard() {
        subviews.forEach({ $0.removeFromSuperview() })
        turn = .O
        board?.reset()
        createBoardGrid()
    }
    
    func setupMoves() {
        guard let board = board else { return }
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
        for row in 0..<kDimension {
            for column in 0..<kDimension {
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
        board?.addMove(coordinate: coordinate)
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
    }
    
    func didPlayerWin(board: Board, player: Player) {
        delegate?.didPlayerWin(player: player)
    }
    
    func configureMoveLabel(board: Board, move: Move) {
        guard let coordinate = move.coordinate else { return }

        let label = UILabel()
        label.text = move.player.rawValue
        label.textAlignment = .center
        label.font = label.font.withSize(40.0)
        label.textColor = move.player.color
        addSubview(label)
        positionViewInGrid(subview: label, atCoordinate: coordinate)
    }

}
