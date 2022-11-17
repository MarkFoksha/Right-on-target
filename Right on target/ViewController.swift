//
//  ViewController.swift
//  Right on target
//
//  Created by Марк Фокша on 23.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    //MARK: - LifeCyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        let generator = NumberGenerator(startValue: 1, endValue: 50)!
        game = Game(valueGenerator: generator, rounds: 5)
        updateLabelText(newText: String(game.currentRound.currentSecretValue))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    //MARK: - View - Model working
    
    @IBAction func checkNumber() {
        game.currentRound.calculateScore(with: Int(slider.value))
        if game.isGameEnded {
            showAlert(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelText(newText: String(game.currentRound.currentSecretValue))
    }

    //MARK: - View update
    
    private func updateLabelText(newText: String) {
        label.text = newText
    }
    
    private func showAlert(score: Int) {
        let alert = UIAlertController(title: "Game is over", message: "You have reached: \(score) points!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Start over", style: .default, handler: nil)
        
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
    }

}
