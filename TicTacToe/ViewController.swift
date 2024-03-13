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
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
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
    var board = [UIButton]()
    
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        initBoard()
    }
    
    func initBoard()
    {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }

    @IBAction func boardTapAction(_ sender: UIButton) 
    {
        addToBoard(sender)
        
        if(fullBoard())
        {
            resultAlert(title: "Draw")
        }
    }
    
    func resultAlert(title: String)
    {
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.resetBoard()
        }))
        self.present(ac, animated: true)
    }
    
    func resetBoard()
    {
        for button in board
        {
            button.setTitle(nil,  for: .normal)
            button.isEnabled = true
        }
        if(firstTurn == Turn.Os)
        {
            firstTurn = Turn.Xs
            turnLabel.text = XS
        }
        else if(firstTurn == Turn.Xs)
            {
                firstTurn = Turn.Os
                turnLabel.text = OS
            }
        currentTurn = firstTurn
    }
    
    func fullBoard() -> Bool
    {
     for button in board
        {
         if button.title(for: .normal) == nil
         {
             return false
         }
     }
        return true
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
        sender.isEnabled = false
    }
    }
}

