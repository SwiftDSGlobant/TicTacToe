//
//  GameOverTests.swift
//  TicTacToeTests
//
//  Created by Aldo Antonio Martinez Avalos on 7/18/18.
//  Copyright © 2018 Aldo Avalos. All rights reserved.
//


import XCTest
@testable import TicTacToe

class GameOverTests: XCTestCase {
    
    var board: Board?
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        board = nil
    }
    
    func testXWinLine0() {
        board = Board(dimension: 3, depth: 5, moves: BoardStatesMock.winXLine0())
        let isGameOver = board!.isGameOver()
        XCTAssertTrue(isGameOver.result == .victory && isGameOver.player == .X )
    }
    
    func testXWinLine1() {
        board = Board(dimension: 3, depth: 5, moves: BoardStatesMock.winXLine1())
        let isGameOver = board!.isGameOver()
        XCTAssertTrue(isGameOver.result == .victory && isGameOver.player == .X )
    }
    
    func testXWinLine2() {
        board = Board(dimension: 3, depth: 5, moves: BoardStatesMock.winXLine2())
        let isGameOver = board!.isGameOver()
        XCTAssertTrue(isGameOver.result == .victory && isGameOver.player == .X )
    }
    
    func testXWinRow0() {
        board = Board(dimension: 3, depth: 5, moves: BoardStatesMock.winXRow0())
        let isGameOver = board!.isGameOver()
        XCTAssertTrue(isGameOver.result == .victory && isGameOver.player == .X )
    }
    
    func testXWinRow1() {
        board = Board(dimension: 3, depth: 5, moves: BoardStatesMock.winXRow1())
        let isGameOver = board!.isGameOver()
        XCTAssertTrue(isGameOver.result == .victory && isGameOver.player == .X )
    }
    
    func testXWinRow2() {
        board = Board(dimension: 3, depth: 5, moves: BoardStatesMock.winXRow2())
        let isGameOver = board!.isGameOver()
        XCTAssertTrue(isGameOver.result == .victory && isGameOver.player == .X )
    }
    
    func testXWinCross0() {
        board = Board(dimension: 3, depth: 5, moves: BoardStatesMock.winXCross0())
        let isGameOver = board!.isGameOver()
        XCTAssertTrue(isGameOver.result == .victory && isGameOver.player == .X )
    }
    
    func testXWinCross1() {
        board = Board(dimension: 3, depth: 5, moves: BoardStatesMock.winXCross1())
        let isGameOver = board!.isGameOver()
        XCTAssertTrue(isGameOver.result == .victory && isGameOver.player == .X )
    }
}
