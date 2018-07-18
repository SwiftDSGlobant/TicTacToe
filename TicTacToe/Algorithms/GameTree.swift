//
//  GameTree.swift
//  TicTacToe
//
//  Created by Aldo Antonio Martinez Avalos on 04/07/18.
//  Copyright © 2018 Aldo Avalos. All rights reserved.
//

import Foundation

class GameTree {
    
    var moves: [Coordinate: Move]
    var player: Player
    var children: [GameTree] = []
    
    init(moves: [Coordinate: Move], player: Player) {
        self.moves = moves
        self.player = player
    }
    
    func printTree() {
        print(moves[Coordinate(row: 0, column: 0)] ?? "", " | ", moves[Coordinate(row: 0, column: 1)] ?? "", " | ", moves[Coordinate(row: 0, column: 2)] ?? "")
        print("---------")
        print(moves[Coordinate(row: 1, column: 0)] ?? "", " | ", moves[Coordinate(row: 1, column: 1)] ?? "", " | ", moves[Coordinate(row: 1, column: 2)] ?? "")
        print("---------")
        print(moves[Coordinate(row: 2, column: 0)] ?? "", " | ", moves[Coordinate(row: 2, column: 1)] ?? "", " | ", moves[Coordinate(row: 2, column: 2)] ?? "")
    }
    
    func generateChildren() {
        if didPlayerWin(player: .O) || didPlayerWin(player: .X) {
            return
        }
        let availableCoordinates = moves.keys.filter({ moves[$0] == nil })
        for coordinate in availableCoordinates {
            
        }
        
    }
    
}

extension GameTree {
    
    private func didPlayerWin(player: Player) -> Bool {
        return hasWin(player: player)
    }
    
    private func hasWin(player: Player) -> Bool {
        for i in 0..<3 {
            let rows = moves.keys.filter({ $0.column == i }).map { moves[$0] }
            let columns = moves.keys.filter({ $0.row == i }).map { moves[$0] }
            let cross = moves.keys.filter({ $0.row == i && $0.column == i }).map { moves[$0] }
            if isLine(moves: rows, player: player) || isLine(moves: columns, player: player) || isLine(moves: cross, player: player) {
                return true
            }
        }
        let range = Array(0...2)
        let inversedRange = range.reversed()
        let inversedCross = zip(range, inversedRange).map({ moves[Coordinate(row: $0, column: $1)] })
        if isLine(moves: inversedCross, player: player) {
            return true
        }
        return false
    }
    
    private func isLine(moves: [Move?], player: Player) -> Bool {
        guard moves.count == 3 else { return false }
        let allSame = moves.reduce(true, { $1?.player == player })
        if allSame {
            return true
        }
        return false
    }
    
}
