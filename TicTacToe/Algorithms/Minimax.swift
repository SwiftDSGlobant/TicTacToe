//
//  Minimax.swift
//  TicTacToe
//
//  Created by Aldo Antonio Martinez Avalos on 04/07/18.
//  Copyright © 2018 Aldo Avalos. All rights reserved.
//

import Foundation

class MiniMax {
    
    func execute(board: Board, depth: Int, maximizing: Bool = false) -> Move {
        var bestMove = Move(player: board.turn)
        
        if maximizing {
            bestMove.score = Int.min
        } else {
            bestMove.score = Int.max
        }
        
        let gameOver = board.isGameOver()
        guard depth > 0 else {
            if gameOver.player == .O {
                bestMove.score = -gameOver.result.rawValue
            } else {
                bestMove.score = gameOver.result.rawValue
            }
            return bestMove
        }
        guard gameOver.result == .tie else {
            if gameOver.player == .O {
                bestMove.score = -gameOver.result.rawValue + depth
            } else {
                bestMove.score = gameOver.result.rawValue + depth
            }
            return bestMove
        }

        for spot in board.spots {
            let board = board.simulatedBoard()
            let newMove = Move(player: board.turn, coordinate: spot)
            board[spot] = newMove
            board.turn = !board.turn
            let result = execute(board: board, depth: depth - 1, maximizing: !maximizing)

            if maximizing {
                if result.score > bestMove.score {
                    bestMove.score = result.score
                    bestMove.coordinate = spot
                }
            } else {
                if result.score < bestMove.score {
                    bestMove.score = result.score
                    bestMove.coordinate = spot
                }
            }
        }
        return bestMove
    }

}
