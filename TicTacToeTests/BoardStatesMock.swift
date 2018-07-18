//
//  BoardStatesMock.swift
//  TicTacToeTests
//
//  Created by Aldo Antonio Martinez Avalos on 7/18/18.
//  Copyright © 2018 Aldo Avalos. All rights reserved.
//

import Foundation
@testable import TicTacToe

struct BoardStatesMock {
    
    static func winXLine0() -> [Coordinate: Move] {
        return [
            Coordinate(row: 0, column: 0): Move(player: .X, coordinate: Coordinate(row: 0, column: 0)),
            Coordinate(row: 0, column: 1): Move(player: .X, coordinate: Coordinate(row: 0, column: 1)),
            Coordinate(row: 0, column: 2): Move(player: .X, coordinate: Coordinate(row: 0, column: 2)),
            Coordinate(row: 1, column: 2): Move(player: .O, coordinate: Coordinate(row: 1, column: 2)),
            Coordinate(row: 2, column: 2): Move(player: .O, coordinate: Coordinate(row: 2, column: 2))

        ]
    }
    
    static func winXLine1() -> [Coordinate: Move] {
        return [
            Coordinate(row: 1, column: 0): Move(player: .X, coordinate: Coordinate(row: 1, column: 0)),
            Coordinate(row: 1, column: 1): Move(player: .X, coordinate: Coordinate(row: 1, column: 1)),
            Coordinate(row: 1, column: 2): Move(player: .X, coordinate: Coordinate(row: 1, column: 2)),
            Coordinate(row: 0, column: 2): Move(player: .O, coordinate: Coordinate(row: 0, column: 2)),
            Coordinate(row: 2, column: 2): Move(player: .O, coordinate: Coordinate(row: 2, column: 2))
            
        ]
    }
    
    static func winXLine2() -> [Coordinate: Move] {
        return [
            Coordinate(row: 2, column: 0): Move(player: .X, coordinate: Coordinate(row: 2, column: 0)),
            Coordinate(row: 2, column: 1): Move(player: .X, coordinate: Coordinate(row: 2, column: 1)),
            Coordinate(row: 2, column: 2): Move(player: .X, coordinate: Coordinate(row: 2, column: 2)),
            Coordinate(row: 1, column: 2): Move(player: .O, coordinate: Coordinate(row: 1, column: 2)),
            Coordinate(row: 0, column: 2): Move(player: .O, coordinate: Coordinate(row: 0, column: 2))
            
        ]
    }
    
    static func winXRow0() -> [Coordinate: Move] {
        return [
            Coordinate(row: 0, column: 0): Move(player: .X, coordinate: Coordinate(row: 0, column: 0)),
            Coordinate(row: 1, column: 0): Move(player: .X, coordinate: Coordinate(row: 1, column: 0)),
            Coordinate(row: 2, column: 0): Move(player: .X, coordinate: Coordinate(row: 2, column: 0)),
            Coordinate(row: 1, column: 2): Move(player: .O, coordinate: Coordinate(row: 1, column: 2)),
            Coordinate(row: 2, column: 2): Move(player: .O, coordinate: Coordinate(row: 2, column: 2))
            
        ]
    }
    
    static func winXRow1() -> [Coordinate: Move] {
        return [
            Coordinate(row: 0, column: 1): Move(player: .X, coordinate: Coordinate(row: 0, column: 1)),
            Coordinate(row: 1, column: 1): Move(player: .X, coordinate: Coordinate(row: 1, column: 1)),
            Coordinate(row: 2, column: 1): Move(player: .X, coordinate: Coordinate(row: 2, column: 1)),
            Coordinate(row: 0, column: 2): Move(player: .O, coordinate: Coordinate(row: 0, column: 2)),
            Coordinate(row: 2, column: 2): Move(player: .O, coordinate: Coordinate(row: 2, column: 2))
            
        ]
    }
    
    static func winXRow2() -> [Coordinate: Move] {
        return [
            Coordinate(row: 0, column: 2): Move(player: .X, coordinate: Coordinate(row: 0, column: 2)),
            Coordinate(row: 1, column: 2): Move(player: .X, coordinate: Coordinate(row: 1, column: 2)),
            Coordinate(row: 2, column: 2): Move(player: .X, coordinate: Coordinate(row: 2, column: 2)),
            Coordinate(row: 1, column: 1): Move(player: .O, coordinate: Coordinate(row: 1, column: 1)),
            Coordinate(row: 0, column: 1): Move(player: .O, coordinate: Coordinate(row: 0, column: 1))
            
        ]
    }
    
    static func winXCross0() -> [Coordinate: Move] {
        return [
            Coordinate(row: 0, column: 0): Move(player: .X, coordinate: Coordinate(row: 0, column: 0)),
            Coordinate(row: 1, column: 1): Move(player: .X, coordinate: Coordinate(row: 1, column: 1)),
            Coordinate(row: 2, column: 2): Move(player: .X, coordinate: Coordinate(row: 2, column: 2)),
            Coordinate(row: 0, column: 1): Move(player: .O, coordinate: Coordinate(row: 0, column: 1)),
            Coordinate(row: 0, column: 2): Move(player: .O, coordinate: Coordinate(row: 0, column: 2))
            
        ]
    }
    
    static func winXCross1() -> [Coordinate: Move] {
        return [
            Coordinate(row: 0, column: 2): Move(player: .X, coordinate: Coordinate(row: 0, column: 2)),
            Coordinate(row: 1, column: 1): Move(player: .X, coordinate: Coordinate(row: 1, column: 1)),
            Coordinate(row: 2, column: 0): Move(player: .X, coordinate: Coordinate(row: 2, column: 0)),
            Coordinate(row: 0, column: 1): Move(player: .O, coordinate: Coordinate(row: 0, column: 1)),
            Coordinate(row: 0, column: 0): Move(player: .O, coordinate: Coordinate(row: 0, column: 0))
            
        ]
    }
    
}
