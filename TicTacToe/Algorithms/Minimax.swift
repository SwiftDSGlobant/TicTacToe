//
//  Minimax.swift
//  TicTacToe
//
//  Created by Aldo Antonio Martinez Avalos on 04/07/18.
//  Copyright © 2018 Aldo Avalos. All rights reserved.
//

import Foundation

enum Result: Int {
    case victory = 10
    case tie = 0
    case lose = -10
}

class MiniMax {
    
    func execute(board: Board, player: Player) -> Move {
        let emptySpots = BoardStates.allCordinates.filter({ board[$0] == nil })
        if isWinner(board: board, player: .O) {
            return Move.loserMove()
        } else if isWinner(board: board, player: .X) {
            return Move.winnerMove()
        } else if emptySpots.isEmpty {
            return Move.tieMove()
        }
        
        var moves: [Move] = []
        for spot in emptySpots {
            var newMove = Move(player: player, coordinate: spot)
            board[spot] = newMove
            
            let result = execute(board: board, player: !player)
            newMove.score = result.score
            
            board[spot] = nil
            moves.append(newMove)
        }
        
        var bestMove: Move!
        var bestScore: Int = 0
        
        switch player {
        case .O:
            bestScore = Int.min
            for move in moves {
                bestScore = max(bestScore, move.score)
                bestMove = move
            }
        default:
            bestScore = Int.max
            for move in moves {
                bestScore = min(bestScore, move.score)
                bestMove = move
            }
        }
        return bestMove
    }
    
}


extension MiniMax {
    
    private func isWinner(board: Board, player: Player) -> Bool {
        for i in 0..<3 {
            let rows = board.moves.keys.filter({ $0.column == i }).map { board.moves[$0] }
            let columns = board.moves.keys.filter({ $0.row == i }).map { board.moves[$0] }
            if isLine(moves: rows, player: player) || isLine(moves: columns, player: player) {
                return true
            }
        }
        let range = Array(0...2)
        let inversedRange = range.reversed()
        let cross = range.map({ index in
            board.moves[Coordinate(row: index, column: index)]
        }).filter { $0 != nil }
        let inversedCross = zip(range, inversedRange).map({ board.moves[Coordinate(row: $0, column: $1)] }).filter { $0 != nil }
        if isLine(moves: inversedCross, player: player) || isLine(moves: cross, player: player) {
            return true
        }
        return false
    }
    
    private func isLine(moves: [Move?], player: Player) -> Bool {
        guard moves.count == 3 else { return false }
        let allSame = moves.reduce(true, { $0 && $1?.player == player })
        if allSame {
            return true
        }
        return false
    }
    
}
