//
//  SetCardViewController.swift
//  playerCard
//
//  Created by 楊曜安 on 2023/3/30.
//

import UIKit
import AVFoundation

class SetCardViewController: UIViewController {
    
    let player = AVPlayer()
    var timer: Timer?
    var playerImageArray = ["AL天使", "AL太空人", "AL水手", "AL白襪", "AL光芒", "AL印地安人", "AL老虎", "AL金鶯", "AL洋基", "AL皇家", "AL紅襪", "AL遊騎兵", "AL運動家", "AL藍鳥", "AL雙城", "CPBL兄弟", "CPBL味全", "CPBL時報", "CPBL桃猿", "CPBL統一", "CPBL誠泰", "CPBL興農", "CPBL鯨", "CPBL三商", "CT中華隊", "NL大都會", "NL小熊", "NL巨人", "NL勇士", "NL洛磯", "NL紅人", "NL紅雀", "NL海盜", "NL馬林魚", "NL教士", "NL費城人", "NL道奇", "NL蒙特羅", "NL響尾蛇", "NL釀酒人", "TML太陽", "TML金剛", "TML勇士", "TML雷公"]

    @IBOutlet weak var player1ImageView: SharpImageView!
    @IBOutlet weak var player2ImageView: SharpImageView!
    @IBOutlet weak var player3ImageView: SharpImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet weak var hitValueSilder: UISlider!
    @IBOutlet weak var hitContactLabel: UILabel!
    @IBOutlet weak var hitPowerLabel: UILabel!
    @IBOutlet weak var hitLabel: UILabel!
    @IBOutlet weak var positionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var leagueSegmentedControl: UISegmentedControl!
    @IBOutlet weak var dateSwitch: UISwitch!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "my-hero", withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        
        setupGradientBackground()
        titleLabel.transform = CGAffineTransform(rotationAngle: -.pi / 80)
        initialImageView()
        hitValueSilder.setThumbImage(UIImage(systemName: "baseball.fill"), for: .normal)
        
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(changeImageView), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            CGColor(red: 1, green: 216/255, blue: 118/255, alpha: 1),
            UIColor.white.cgColor
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @objc func changeImageView(){
        playerImageArray.shuffle()
        initialImageView()
    }
    
    func initialImageView(){
        player1ImageView.image = UIImage(named: playerImageArray[0])
        player2ImageView.image = UIImage(named: playerImageArray[1])
        player3ImageView.image = UIImage(named: playerImageArray[2])
    }
    
    
    @IBAction func filter(_ sender: Any) {
        if dateSwitch.isOn {
            let alertController = UIAlertController(title: "啟用生日篩選球員卡", message: "只能單獨篩選生日條件，不能加入其他篩選條件。", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "確定啟用", style: .default)
            let cancelAction = UIAlertAction(title: "取消篩選", style: .cancel){ _ in
                self.dateSwitch.isOn = false
            }
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true)
            hitValueSilder.value = 15
            positionSegmentedControl.selectedSegmentIndex = 0
            leagueSegmentedControl.selectedSegmentIndex = 0
        }
        
        if hitValueSilder.value < 10 || hitValueSilder.value > 20, positionSegmentedControl.selectedSegmentIndex != 0, leagueSegmentedControl.selectedSegmentIndex != 0 {
            let alertController = UIAlertController(title: "球員卡篩選限制", message: "守位、聯盟、能力 3項條件，最多只能設定 2個項目！", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "重新設定", style: .cancel)
            alertController.addAction(cancelAction)
            present(alertController, animated: true)
            hitValueSilder.value = 15
            hitLabel.text = "隨機"
            hitPowerLabel.text = ""
            hitContactLabel.text = ""
            positionSegmentedControl.selectedSegmentIndex = 0
            leagueSegmentedControl.selectedSegmentIndex = 0
        }
        
        
        
        
    }
    
    
    @IBAction func changeHitValue(_ sender: UISlider) {
        if hitValueSilder.value > 20 {
            hitLabel.text = ""
            hitPowerLabel.text = "力量型"
            hitContactLabel.text = ""
        } else if hitValueSilder.value < 10{
            hitLabel.text = ""
            hitPowerLabel.text = ""
            hitContactLabel.text = "打擊型"
        } else {
            hitLabel.text = "隨機"
            hitPowerLabel.text = ""
            hitContactLabel.text = ""
        }
    }
    
    @IBAction func returnCloseKeyboard(_ sender: Any) {
        
    }
    @IBAction func closeKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func resetRule(_ sender: Any) {
        nameTextField.text = ""
        birthdayDatePicker.date = NSDate() as Date
        dateSwitch.isOn = false
        hitValueSilder.value = 15
        hitLabel.text = "隨機"
        hitPowerLabel.text = ""
        hitContactLabel.text = ""
        positionSegmentedControl.selectedSegmentIndex = 0
        leagueSegmentedControl.selectedSegmentIndex = 0
    }
    
    @IBSegueAction func setRules(_ coder: NSCoder) -> GetCardViewController? {
        timer?.invalidate()
        let name = String(nameTextField.text!)
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: birthdayDatePicker.date)
        var month = 0
        if dateSwitch.isOn {
            month = Int(dateComponents.month!)
        }
        let hitValue = Float(hitValueSilder.value)
        let position = Int(positionSegmentedControl.selectedSegmentIndex)
        let league = Int(leagueSegmentedControl.selectedSegmentIndex)
        let controller = GetCardViewController(coder: coder)
        
        controller?.userName = name
        controller?.month = month
        controller?.hitValue = hitValue
        controller?.positionIndex = position
        controller?.leagueIndex = league
    
        return controller
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
