//
//  Move.swift
//  TicTacToe
//
//  Created by Aldo Antonio Martinez Avalos on 04/07/18.
//  Copyright © 2018 Aldo Avalos. All rights reserved.
//

import UIKit

enum Player: String {
    case X
    case O
    
    var color: UIColor {
        switch self {
        case .O:
            return .red
        case .X:
            return .blue
        }
    }
}

prefix func !(player: Player) -> Player {
    if player == .X {
        return .O
    } else {
        return .X
    }
}

struct Move {
    
    var player: Player
    var coordinate: Coordinate
    var score: Int = 0
    
    init(player: Player, coordinate: Coordinate) {
        self.player = player
        self.coordinate = coordinate
    }
    
    static func winnerMove() -> Move {
        var move = Move(player: .O, coordinate: Coordinate(row: 0, column: 0))
        move.score = Result.victory.rawValue
        return move
    }
    
    static func tieMove() -> Move {
        var move = Move(player: .O, coordinate: Coordinate(row: 0, column: 0))
        move.score = Result.tie.rawValue
        return move
    }
    
    static func loserMove() -> Move {
        var move = Move(player: .O, coordinate: Coordinate(row: 0, column: 0))
        move.score = Result.lose.rawValue
        return move
    }
    
}
