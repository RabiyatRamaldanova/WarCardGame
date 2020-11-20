//
//  ViewController.swift
//  WarCardGame
//
//  Created by student on 17.11.2020.
//

import UIKit

class ViewController: UIViewController {
    var playerscore: Int = 0
    var cpuscore: Int  = 0
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var CPUCard: UIImageView!
    @IBOutlet weak var action_button: UIButton!
    @IBOutlet weak var PlayerCard: UIImageView!
    @IBOutlet weak var CPUScore: UILabel!
      @IBOutlet weak var PlayerScore: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //generate values 2-14
    func generateValue()->Int{
        return Int.random(in: 1...13)    }
    
    //function action for Deal button
    @IBAction func DealFunc(_ sender: UIButton) {
       
        let playernumber=generateValue()
        let cpunumber=generateValue()
        PlayerCard.image = UIImage (imageLiteralResourceName: "card\(playernumber)")
        CPUCard.image = UIImage (imageLiteralResourceName: "card\(cpunumber)")
        
        if (playernumber>cpunumber && playerscore<19 && cpuscore < 19){
            playerscore += 1
            PlayerScore.text = String(playerscore)
            CPUScore.text = String(cpuscore)
            message.text = "Player wins the round"
        }/*else if(playernumber > cpunumber && playerscore == 20 ) {
            message.text = "Player wins the round"
            playerscore = 0
            cpuscore = 0
            PlayerScore.text = String(playerscore)
            CPUScore.text = String(cpuscore)
        }*/
        else if (playernumber<cpunumber && playerscore < 19 && cpuscore < 19) {
            cpuscore += 1
            PlayerScore.text = String(playerscore)
            CPUScore.text = String(cpuscore)
            message.text = "CPU wins the round"
        }
        else if(playernumber == cpunumber) {
            message.text = "draw"
        }
        else if(playerscore == 19){
            message.text = "Player wins the game. For begin to play again press the button "
            /*PlayerCard.image = UIImage (imageLiteralResourceName: "back")
            CPUCard.image = UIImage (imageLiteralResourceName: "back")
            cpuscore = 0
            playerscore = 0*/
            PlayerScore.text = String(playerscore + 1)
            CPUScore.text = String(cpuscore)
            cpuscore = 0
            playerscore = 0
        }
        else if(cpuscore == 19){
            message.text = "CPU wins the game. For begin to play again press the button "
            /*PlayerCard.image = UIImage (imageLiteralResourceName: "back")
            CPUCard.image = UIImage (imageLiteralResourceName: "back")*/
            PlayerScore.text = String(playerscore )
            CPUScore.text = String(cpuscore + 1)
            cpuscore = 0
            playerscore = 0
        }
        /*else if(playernumber < cpunumber && cpuscore == 20) {
            message.text = "cpu wins the round"
            cpuscore = 0
            playerscore = 0
            PlayerScore.text = String(playerscore)
            CPUScore.text = String(cpuscore)
        }
        else if (playerscore == cpuscore){
            playerscore += 1
            cpuscore += 1
            message.text = "draw"
            PlayerScore.text = String(playerscore)
            CPUScore.text = String(cpuscore)
        } */
        
    }
    
}

