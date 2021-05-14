//
//  ViewController.swift
//  Loteria
//
//  Created by Diogenes de Souza on 13/05/21.
//

import UIKit

enum GameType: String {
    case megasena = "Mega-Sena"
    case quina = "Quina"
}

infix operator >-<
func >-< (total: Int, universe: Int) -> [Int] {
    var result: [Int] = []
    while result.count < total {
        let randomNumber = Int(arc4random_uniform(UInt32(universe))+1)
        if !result.contains(randomNumber) {
            result.append(randomNumber)
        }
    }
    return result.sorted()
}


class ViewController: UIViewController {
    
    @IBOutlet weak var lbGameTitle: UILabel!
    @IBOutlet weak var segmentedGameType: UISegmentedControl!
    
    @IBOutlet var balls: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumbers(for: .megasena)
    }
    
    @IBAction func generateGame() {
        
        switch segmentedGameType.selectedSegmentIndex {
        case 0:
            showNumbers(for: .megasena)
            
        default:
            showNumbers(for: .quina)
            
        }
        
    }
    
    func showNumbers(for type: GameType) {
        lbGameTitle.text = type.rawValue
        var game: [Int] = []
        
        switch type {
        case .megasena:
            game = 6>-<60
            balls.last!.isHidden = false
            print("mega-sena")
            
        case .quina:
            game = 5>-<80
            balls.last!.isHidden = true
            
            print("quina")
        }
        for (index, game) in game.enumerated() {
            balls[index].setTitle("\(game)", for: .normal)
        }
        animatedViews()
    }
    
    func animatedViews() {
        
        for button in balls {
            button.alpha = 0
        }
        
        UIView.animate(withDuration: 1) {
            for button in self.balls {
                button.alpha = 1
            }
        }
    }
    
}

