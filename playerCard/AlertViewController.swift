//AlertViewController
//  AlertViewController.swift
//  playerCard
//
//  Created by 楊曜安 on 2023/4/5.
//

import UIKit
import AVFoundation

class AlertViewController: UIViewController {
    
    
    
    var userName: String?
    var playerCardArray: [String]?


    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var playerCardView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let playerCardArray = self.playerCardArray{
            playerCardView.image = UIImage(named: playerCardArray[1])
        }
        if let userName = self.userName{
            alertLabel.text = "恭喜\(userName)獲得球員卡"
        } else {
            alertLabel.text = "恭喜您獲得球員卡"
        }
        
    }

    
    @IBAction func backHomePage(_ sender: Any) {
        SetCardViewController.player.pause()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
