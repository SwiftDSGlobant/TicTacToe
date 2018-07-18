//
//  Board.swift
//  TicTacToe
//
//  Created by Aldo Antonio Martinez Avalos on 04/07/18.
//  Copyright © 2018 Aldo Avalos. All rights reserved.
//

import Foundation

protocol BoardDelegate: class {
    func didAddMoveToBoard(board: Board, move: Move)
    func didPlayerWin(board: Board, player: Player)
}

class Board {
    
    var turn: Player = .O
    var moves: [Coordinate: Move] = [:]
    var minimax: MiniMax = MiniMax()
    weak var delegate: BoardDelegate?
    
    let dimension: Int
    let depth: Int
    
    var spots: [Coordinate] {
        return BoardStates.allCordinates.filter({ moves[$0] == nil })
    }
    
    func simulatedBoard() -> Board {
        return Board(dimension: dimension, depth: depth, moves: moves)
    }
    
    init(dimension: Int, depth: Int, moves: [Coordinate: Move] = [:]) {
        self.dimension = dimension
        self.moves = moves
        self.depth = depth
        
        if moves.count % 2 == 0 {
            turn = .O
        } else {
            turn = .X
        }
    }
    
    func reset() {
        moves.removeAll()
    }
    
    func nextMove() {
        let nextMove = minimax.execute(board: self, player: turn)
        addMove(move: nextMove)
    }
    
    func addMove(move newMove: Move) {
        guard let coordinate = newMove.coordinate else { return }
        guard moves[coordinate] == nil else { return }
        moves[coordinate] = newMove
        turn = !turn
        delegate?.didAddMoveToBoard(board: self, move: newMove)
        didPlayerWin()
    }
    
    private func didPlayerWin() {
        let gameOver = isGameOver()
        if gameOver == .victory {
            delegate?.didPlayerWin(board: self, player: .X)
        }
    }
    
    func isGameOver() -> Result {
        
        for i in 0..<dimension {
            let rows = moves.keys.filter({ $0.column == i }).map { moves[$0] }
            let columns = moves.keys.filter({ $0.row == i }).map { moves[$0] }
            if isLine(moves: rows) || isLine(moves: columns) {
                return .victory
            }
        }
        
        let range = Array(0..<dimension)
        let inversedRange = range.reversed()
        
        let cross = range.map({ index in
            moves[Coordinate(row: index, column: index)]
        }).filter { $0 != nil }
        let inversedCross = zip(range, inversedRange).map({ moves[Coordinate(row: $0, column: $1)] }).filter { $0 != nil }
        
        if isLine(moves: inversedCross) || isLine(moves: cross) {
            return .victory
        }
        
        if moves.count == dimension.squared {
            return .tie
        }
        return .unfinished
    }
    
    private func isLine(moves: [Move?]) -> Bool {
        guard moves.count == dimension else { return false }
        let player = moves.first!!.player
        let allSame = moves.reduce(true, { $0 && ($1?.player == player) })
        if allSame {
            return true
        }
        return false
    }
    
    subscript(coordinate: Coordinate) -> Move? {
        get {
            return moves[coordinate]
        }
        set {
            moves[coordinate] = newValue
        }
    }
    
    func printBoard() {
        print(moves[Coordinate(row: 0, column: 0)]?.player.rawValue ?? " ", " | ", moves[Coordinate(row: 0, column: 1)]?.player.rawValue ?? " ", " | ", moves[Coordinate(row: 0, column: 2)]?.player.rawValue ?? " ")
        print("---------")
        print(moves[Coordinate(row: 1, column: 0)]?.player.rawValue ?? " ", " | ", moves[Coordinate(row: 1, column: 1)]?.player.rawValue ?? " ", " | ", moves[Coordinate(row: 1, column: 2)]?.player.rawValue ?? " ")
        print("---------")
        print(moves[Coordinate(row: 2, column: 0)]?.player.rawValue ?? " ", " | ", moves[Coordinate(row: 2, column: 1)]?.player.rawValue ?? " ", " | ", moves[Coordinate(row: 2, column: 2)]?.player.rawValue ?? " ")
        print("\n\n")
    }
    
}
