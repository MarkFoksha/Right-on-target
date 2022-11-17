//
//  Generator.swift
//  Right on target
//
//  Created by Марк Фокша on 26.07.2022.
//

import Foundation

protocol GeneratorProtocol {
    func getRandomValue() -> Int
}

class NumberGenerator: GeneratorProtocol {
    private let startValue: Int
    private let endValue: Int
    
    init?(startValue: Int, endValue: Int) {
        guard startValue <= endValue else {
            return nil
        }
        self.startValue = startValue
        self.endValue = endValue
    }
    
    func getRandomValue() -> Int {
        (startValue...endValue).randomElement()!
    }
}
