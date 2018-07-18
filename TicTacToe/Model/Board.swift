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
    
    init(moves: [Coordinate: Move] = [:]) {
        self.moves = moves
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
        guard moves[newMove.coordinate] == nil else { return }
        moves[newMove.coordinate] = newMove
        turn = !turn
        delegate?.didAddMoveToBoard(board: self, move: newMove)
        didPlayerWin(player: newMove.player)
    }
    
    private func didPlayerWin(player: Player) {
        if hasWin() {
            delegate?.didPlayerWin(board: self, player: player)
        }
    }
    
    private func hasWin() -> Bool {
        for i in 0..<3 {
            let rows = moves.keys.filter({ $0.column == i }).map { moves[$0] }
            let columns = moves.keys.filter({ $0.row == i }).map { moves[$0] }
            if isLine(moves: rows) || isLine(moves: columns) {
                return true
            }
        }
        let range = Array(0...2)
        let inversedRange = range.reversed()
        let cross = range.map({ index in
            moves[Coordinate(row: index, column: index)]
        }).filter { $0 != nil }
        let inversedCross = zip(range, inversedRange).map({ moves[Coordinate(row: $0, column: $1)] }).filter { $0 != nil }
        if isLine(moves: inversedCross) || isLine(moves: cross) {
            return true
        }
        return false
    }
    
    private func isLine(moves: [Move?]) -> Bool {
        guard moves.count == 3 else { return false }
        let player = moves.first!?.player
        let allSame = moves.reduce(true, { $1?.player == player })
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
        print(moves[Coordinate(row: 0, column: 0)]?.player.rawValue ?? "", " | ", moves[Coordinate(row: 0, column: 1)]?.player.rawValue ?? "", " | ", moves[Coordinate(row: 0, column: 2)]?.player.rawValue ?? "")
        print("---------")
        print(moves[Coordinate(row: 1, column: 0)]?.player.rawValue ?? "", " | ", moves[Coordinate(row: 1, column: 1)]?.player.rawValue ?? "", " | ", moves[Coordinate(row: 1, column: 2)]?.player.rawValue ?? "")
        print("---------")
        print(moves[Coordinate(row: 2, column: 0)]?.player.rawValue ?? "", " | ", moves[Coordinate(row: 2, column: 1)]?.player.rawValue ?? "", " | ", moves[Coordinate(row: 2, column: 2)]?.player.rawValue ?? "")
    }
    
}
