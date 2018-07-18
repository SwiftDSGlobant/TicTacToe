//
//  Move.swift
//  TicTacToe
//
//  Created by Aldo Antonio Martinez Avalos on 04/07/18.
//  Copyright © 2018 Aldo Avalos. All rights reserved.
//

import UIKit

enum Result: Int {
    case victory = 10
    case tie = 0
    case lose = -10
}

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
    var coordinate: Coordinate?
    var score: Int = 0
    
    init(player: Player, coordinate: Coordinate? = nil) {
        self.player = player
        self.coordinate = coordinate
    }
 
}
