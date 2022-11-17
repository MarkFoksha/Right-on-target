//
//  Game.swift
//  Right on target
//
//  Created by Марк Фокша on 25.07.2022.
//

import Foundation

protocol GameProtocol {
    var score: Int { get }
    var currentRound: GameRoundProtocol! { get }
    var isGameEnded: Bool { get }
    var secretValueGenerator: GeneratorProtocol { get }
    
    func restartGame()
    func startNewRound()
}

class Game: GameProtocol {
    
    var score: Int {
        var totalScore: Int = 0
        for round in rounds {
            totalScore += round.score
        }
        return totalScore
    }
    
    var currentRound: GameRoundProtocol!
    private var rounds: [GameRoundProtocol] = []
    var secretValueGenerator: GeneratorProtocol
    private var roundsCount: Int!
    
    var isGameEnded: Bool {
        roundsCount == rounds.count ? true : false
    }
    
    init?(valueGenerator: GeneratorProtocol, rounds: Int) {
       secretValueGenerator = valueGenerator
        roundsCount = rounds
        startNewRound()
    }
    
    func restartGame() {
        rounds = []
        startNewRound()
    }
    
    func startNewRound() {
        let newSecretValue = self.getNewSecretValue()
        currentRound = GameRound(currentSecretValue: newSecretValue)
        rounds.append(currentRound)
    }
    
    private func getNewSecretValue() -> Int {
        secretValueGenerator.getRandomValue()
    }
    
  
}
