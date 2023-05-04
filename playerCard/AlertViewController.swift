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
    var playerSeconds: Double!
    let player = AVPlayer()

    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var playerCardView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("第三次播放前：\(String(describing: playerSeconds))")
        playerSeconds += 0.75
        print("第三次播放前：\(String(describing: playerSeconds))")
        let url = Bundle.main.url(forResource: "my-hero", withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: url)
        let time = CMTime(seconds: playerSeconds, preferredTimescale: 1)
        player.replaceCurrentItem(with: playerItem)
        player.seek(to: time)
        player.play()
        
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
        player.pause()
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
