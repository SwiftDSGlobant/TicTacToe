//
//  Minimax.swift
//  TicTacToe
//
//  Created by Aldo Antonio Martinez Avalos on 04/07/18.
//  Copyright © 2018 Aldo Avalos. All rights reserved.
//

import Foundation

class MiniMax {
    
    func execute(board: Board, player: Player) -> Move {
        let board = board.simulatedBoard()
        var bestMove = Move(player: board.turn, coordinate: Coordinate(row: 0, column: 0))
        bestMove.score = Int.min

        for spot in board.spots {
            let newMove = Move(player: board.turn, coordinate: spot)
            board[spot] = newMove
            board.turn = !board.turn
            
            let result = mini(board: board)
            var move = Move(player: board.turn, coordinate: spot)
            move.score = result
            
            if (move.score > bestMove.score) {
                bestMove.score = move.score
                bestMove.coordinate = move.coordinate
            }
        }
        return bestMove

    }
    
    private func mini(board: Board) -> Int {
        let board = board.simulatedBoard()
        let gameOver = board.isGameOver()
        guard gameOver == .unfinished else {
            return gameOver.rawValue
        }
        
        var bestScore = Int.max
        for spot in board.spots {
            let newMove = Move(player: board.turn, coordinate: spot)
            board[spot] = newMove
            board.turn = !board.turn
            let result = maxi(board: board)
            bestScore = min(bestScore, result)
        }
        return bestScore
    }
    
    private func maxi(board: Board) -> Int {
        let board = board.simulatedBoard()
        let gameOver = board.isGameOver()
        guard gameOver == .unfinished else {
            return gameOver.rawValue
        }
        
        var bestScore = Int.min
        for spot in board.spots {
            let newMove = Move(player: board.turn, coordinate: spot)
            board[spot] = newMove
            board.turn = !board.turn
            let result = mini(board: board)
            bestScore = max(bestScore, result)
        }
        return bestScore
    }

}
