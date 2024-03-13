//
//  ViewController.swift
//  TicTacToe
//
//  Created by Brianca Knight on 3/13/24.
//

import UIKit

class ViewController: UIViewController {

    enum Turn {
        case Os
        case Xs
    }

    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a1: UIStackView!
    @IBOutlet weak var a2: UIStackView!
    @IBOutlet weak var a3: UIStackView!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var firstTurn = Turn.Xs
    var currentTurn = Turn.Xs
    
    var OS = "O"
    var XS = "X"
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
    }

    @IBAction func boardTapAction(_ sender: UIButton) 
    {
        addToBoard(sender)
    }

func addToBoard(_ sender: UIButton)
{
    if(sender.title(for: .normal) == nil)
    {
        if(currentTurn == Turn.Os)
        {
            sender.setTitle(OS, for: .normal)
            currentTurn = Turn.Xs
            turnLabel.text = XS
        }
        else if(currentTurn == Turn.Xs)
        {
            sender.setTitle(XS, for: .normal)
            currentTurn = Turn.Os
            turnLabel.text = OS
        }
    }
    }
}

