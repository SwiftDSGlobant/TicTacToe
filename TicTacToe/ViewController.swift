//
//  ViewController.swift
//  TicTacToe
//
//  Created by Aldo Antonio Martinez Avalos on 04/07/18.
//  Copyright © 2018 Aldo Avalos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boardView.delegate = self
        boardView.configure()
    }

    @IBAction func reset(_ sender: Any) {
        boardView.resetBoard()
    }
    
}

extension ViewController: BoardViewDelegate {

    func didPlayerWin(player: Player) {
        switch player {
        case .O:
            presentAlert(title: "Felicidades!!!", message: "Nooooooo que capooo ganaste!!!", cta: ":D")
        case .X:
            presentAlert(title: "...", message: "Que decepción", cta: ":c")

        }
    }
    
    func presentAlert(title: String, message: String, cta: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cta, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
