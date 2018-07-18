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
        var bestMove = Move(player: board.turn, coordinate: Coordinate(row: 0, column: 0))
        bestMove.score = Int.min

        for spot in board.spots {
            let board = board.simulatedBoard()

            let newMove = Move(player: board.turn, coordinate: spot)
            board[spot] = newMove
            board.turn = !board.turn
            board.printBoard()

            let result = mini(board: board)
            
            if (result.score > bestMove.score) {
                bestMove.score = result.score
                bestMove.coordinate = result.coordinate
            }
        }
        return bestMove

    }
    
    private func mini(board: Board) -> Move {
        let gameOver = board.isGameOver()
        guard gameOver == .unfinished else {
            var move = Move(player: board.turn, coordinate: board.spots.first)
            move.score = gameOver.rawValue
            return move
        }
        
        var bestMove = Move(player: board.turn, coordinate: board.spots.first)
        bestMove.score = Int.max
        
        for spot in board.spots {
            let board = board.simulatedBoard()
            let newMove = Move(player: board.turn, coordinate: spot)
            board[spot] = newMove
            board.turn = !board.turn
            board.printBoard()
            let result = maxi(board: board)
            if bestMove.score > result.score {
                bestMove.score = result.score
                bestMove.coordinate = spot
            }
        }
        return bestMove
    }
    
    private func maxi(board: Board) -> Move {
        let gameOver = board.isGameOver()
        guard gameOver == .unfinished else {
            var move = Move(player: board.turn, coordinate: board.spots.first)
            move.score = gameOver.rawValue
            return move
        }
        
        var bestMove = Move(player: board.turn, coordinate: board.spots.first)
        bestMove.score = Int.min
        
        for spot in board.spots {
            let board = board.simulatedBoard()
            let newMove = Move(player: board.turn, coordinate: spot)
            board[spot] = newMove
            board.turn = !board.turn
            board.printBoard()
            let result = mini(board: board)
            if bestMove.score < result.score {
                bestMove.score = result.score
                bestMove.coordinate = spot
            }
        }
        return bestMove
    }

}
