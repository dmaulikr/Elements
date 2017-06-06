//
//  GameEngineTests.swift
//  Elements
//
//  Created by Jakub Sokołowski on 2/3/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import XCTest
@testable import Elements

class GameEngineTests: XCTestCase {

    var gameEngine: GameEngine!
    
    override func setUp() {
        super.setUp()
        gameEngine = GameEngine()
        gameEngine.drawNextGameElement()
    }
    
    override func tearDown() {
        gameEngine = nil
        super.tearDown()
    }
    
    
    func testThatDrawingWorksAfterLargeAmountOfDraws() {
        for _ in 1...9999 {
            gameEngine.drawNextGameElement()
        }
        
        gameEngine.drawNextGameElement()
        XCTAssertNotNil(gameEngine.query, "Drawn query should not be nil")
        XCTAssertNotNil(gameEngine.answers, "Drawn answers should not be nil")
    }
    
    func testThatGameEnginePreparesQuery() {
        XCTAssertNotNil(gameEngine.query, "Query should not be nil")
    }
    
    func testThatGameEnginePrepares4Answers() {
        let expectedNumberOfAnswers = 4
        XCTAssertEqual(gameEngine.answers.count, expectedNumberOfAnswers, "The number of prepared answers is not the same as expected one")
    }
    
    //POINTS
    func testThatPointsCounterAtTheVeryBeginingIsEqualZero() {
        XCTAssertEqual(gameEngine.points, 0, "Points counter is not equal zero at the very beginning")
    }
    
    // GAME OVER
    func testThatGameIsNotOverAtTheBeginning() {
        XCTAssertFalse(gameEngine.isGameOver)
    }
    
    func testThatGameIsOverAfter3Mistakes() {
        let kTestIncorrectAnswer = "xxx"
        (1...3).forEach { _ in let _ = gameEngine.isCorrect(userAnswer: kTestIncorrectAnswer)}
        XCTAssert(gameEngine.isGameOver)
    }

}
