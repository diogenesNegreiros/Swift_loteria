//
//  ViewController.swift
//  Loteria
//
//  Created by Diogenes de Souza on 13/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbGameTitle: UILabel!
    @IBOutlet weak var segmentedGameType: UISegmentedControl!
    
    @IBOutlet var balls: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func generateGame() {
    }
    
}

