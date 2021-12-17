//
//  ViewController.swift
//  ROCK_PAPER_SCISSOR!!!
//
//  Created by Parth Pol on 17/12/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userGuess: UILabel!
    @IBOutlet weak var computerGuess: UILabel!
    @IBOutlet weak var winner: UILabel!
    @IBOutlet weak var computerscore: UILabel!
    @IBOutlet weak var userscore: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var PlayerPoints = 0 // step 10... trying to make the scoreboard... add which increases each time either one wins
    var CPUPoints = 0
    //displaying the score
    func Print()
    {
        Swift.print("YOUR SCORE", PlayerPoints)
        Swift.print("CPU SCORE", CPUPoints)
    }
    
    enum Guess: String //step 3... generate guess to make error in step to go away
    {
        case rock = "Rock 👊🏼"
        case paper = "Paper 🖐🏼"
        case scissor = "Scissor ✌🏼"
    }
    
    enum Winner: String //step 7 generated winnner so that "->Winner wont show error
    {
        case user = "YOU WIN!!🥳"
        case computer = "YOU LOST🥺"
        case tie = "TIE!!👔"
    }
    
    

    let guesses:[Guess] = [.rock, .paper, .scissor] //step 4...
    
    @IBAction func userGuessed(_ sender: UIButton)
    {
        let tappedButton = sender.tag // step 1 after connecting buttons
        switch tappedButton
        {
        case 1:
            winner.text = (determineWinner(user: .rock, computer: generateComputerGuess())).rawValue // cases mentioned in step 1... filled later (after step 9)...says that determine winner when user rock and computer generates a guess
        case 2:
            winner.text = (determineWinner(user: .paper, computer: generateComputerGuess())).rawValue
        case 3:
            winner.text = (determineWinner(user: .scissor, computer: generateComputerGuess())).rawValue
        default:
            Swift.print ("I don't know what button was tapped")
        }
    }
    
    func generateComputerGuess() -> Guess // error given coz Guess was not yet specified (this was step 2)
    {
        return guesses.randomElement()! //step 5...
    }
    func determineWinner(user: Guess, computer: Guess) -> Winner // step 6... to determine the winner
    {
        userGuess.text = "YOU GUESSED: \(user.rawValue)" // step 8 accessing the text part of userGuess to provide as output...which will be line 32,33,34
        computerGuess.text = "CPU GUESSED: \(computer.rawValue)"
        
        switch user //step 9... all the cases below.
        {
            
        case .rock:
            if computer == .paper
            {
                CPUPoints = CPUPoints + 1
                return .computer //made return .user coz case already mentioned about user winning in line 32... if that not there then (winner.txt = "YOU WON!!")... without the brackets
            }
            else if computer == .scissor // user:rock comp:scissor
            {
                PlayerPoints = PlayerPoints + 1
                return .user
            }
            else
            {
                return .tie
            }
        case .paper:
            if computer == .scissor
            {
                CPUPoints = CPUPoints + 1
                return .computer
            }
            else if computer == .rock
            {
                PlayerPoints = PlayerPoints + 1
                return .user
            }
            else
            {
                return .tie
            }
        case .scissor:
            if computer == .rock
            {
                CPUPoints = CPUPoints + 1
                return .computer
            }
            else if computer == .paper
            {
                PlayerPoints = PlayerPoints + 1
                return .user
            }
            else
            {
                return .tie
            }
        }
    }
}

