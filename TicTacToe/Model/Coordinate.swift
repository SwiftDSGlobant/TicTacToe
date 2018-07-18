//
//  Coordinate.swift
//  TicTacToe
//
//  Created by Aldo Antonio Martinez Avalos on 04/07/18.
//  Copyright © 2018 Aldo Avalos. All rights reserved.
//

import Foundation

struct Coordinate: Hashable {
    
    struct Constants {
        static let minRow: Int = 0
        static let maxRow: Int = 3
        static let minColumn: Int = 0
        static let maxColumn: Int = 3
    }
    
    var row: Int
    var column: Int
    
    var hashValue: Int {
        return (row << Constants.maxRow) | column
    }
    
    var valid: Bool {
        return (row >= Constants.minRow && row < Constants.maxRow) && (column >= Constants.minColumn && column < Constants.maxColumn)
    }
    
    static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        return (lhs.row == rhs.row) && (lhs.column == rhs.column)
    }
    
}
