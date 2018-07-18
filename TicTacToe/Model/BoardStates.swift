//
//  BoardStates.swift
//  TicTacToe
//
//  Created by Aldo Antonio Martinez Avalos on 04/07/18.
//  Copyright © 2018 Aldo Avalos. All rights reserved.
//

import Foundation

struct BoardStates {
    
    static func new() -> [Coordinate: Move] {
        return [:]
    }
    
    static func midGame() -> [Coordinate: Move] {
        return [
            Coordinate(row: 0, column: 0): Move(player: .X, coordinate: Coordinate(row: 0, column: 0)),
            Coordinate(row: 0, column: 2): Move(player: .O, coordinate: Coordinate(row: 0, column: 2)),
            Coordinate(row: 1, column: 1): Move(player: .X, coordinate: Coordinate(row: 1, column: 1)),
            Coordinate(row: 1, column: 2): Move(player: .O, coordinate: Coordinate(row: 1, column: 2))
        
        ]
    }
    
    static var allCordinates: [Coordinate] {
        return [
            Coordinate(row: 0, column: 0),
            Coordinate(row: 0, column: 1),
            Coordinate(row: 0, column: 2),
            Coordinate(row: 1, column: 0),
            Coordinate(row: 1, column: 1),
            Coordinate(row: 1, column: 2),
            Coordinate(row: 2, column: 0),
            Coordinate(row: 2, column: 1),
            Coordinate(row: 2, column: 2)
        ]
    }
    
}
