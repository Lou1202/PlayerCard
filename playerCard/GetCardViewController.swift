//
//  GetCardViewController.swift
//  playerCard
//
//  Created by 楊曜安 on 2023/3/31.
//

import UIKit
import AVFoundation

class GetCardViewController: UIViewController {
    
    var timer: Timer?
    var scrollDistance = 0
    var changeCardCount = 0
    var userName: String?
    var month: Int!
    var hitValue: Float!
    var positionIndex: Int!
    var leagueIndex: Int!
    var rounds = 3
    var scrollSpeed = 0.05
    var playerCardArray = [String]()
    var randomPlayerCardArray = [String]()
    
    @IBOutlet weak var playerCard1ImageView: UIImageView!
    @IBOutlet weak var playerCard2ImageView: UIImageView!
    @IBOutlet weak var playerCard3ImageView: UIImageView!
    @IBOutlet weak var playerCard4ImageView: UIImageView!
    @IBOutlet weak var randomCardScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景漸層
        setupGradientBackground()
        //加入篩選後球員卡
        addPlayerCard()
        //球員卡洗牌
        shuffleCard()
        //設定初始四張球員卡圖片
        initialCard()
        //捲動球員卡拉霸效果
        autoScroll()
        // Do any additional setup after loading the view.
    }
    
    
    
    func autoScroll(){
        timer = Timer.scheduledTimer(timeInterval: scrollSpeed, target: self, selector: #selector(randomCard), userInfo: nil, repeats: true)
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
    
    
    func initialCard(){
        playerCard1ImageView.image = UIImage(named: randomPlayerCardArray[0])
        playerCard2ImageView.image = UIImage(named: randomPlayerCardArray[1])
        playerCard3ImageView.image = UIImage(named: randomPlayerCardArray[2])
        playerCard4ImageView.image = UIImage(named: randomPlayerCardArray[3])
    }
    
    func filterPlayerCards() -> [String] {
        let filteredCards = playerCards.filter { card in
            switch positionIndex {
            case 1:
                if !card.position.contains("內野") { return false }
            case 2:
                if !card.position.contains("外野") { return false }
            default:
                break
            }
            
            switch leagueIndex {
            case 1:
                if card.league != "AL" && card.league != "NL" { return false }
            case 2:
                if card.league == "AL" || card.league == "NL" { return false }
            default:
                break
            }
            
            switch Int(hitValue) {
            case ..<10:
                if card.hitType != "打擊型" { return false }
            case 20...:
                if card.hitType != "力量型" { return false }
            default:
                break
            }
            
            switch month {
            case 1, 2, 3:
                if card.birthday > 3 { return false }
            case 4, 5, 6:
                if card.birthday < 4 || card.birthday > 6 { return false }
            case 7, 8, 9:
                if card.birthday < 7 || card.birthday > 9 { return false }
            case 10, 11, 12:
                if card.birthday < 10 || card.birthday > 12 { return false }
            default:
                break
            }
            
            return true
        }
        return filteredCards.map { $0.imageName }
    }
    
    func addPlayerCard() {
        playerCardArray = filterPlayerCards()
    }
    
    
    
    //篩選後洗牌
    func shuffleCard(){
        //超過１０張再篩選(節省拉霸轉盤時間)
        if playerCardArray.count > 10{
            playerCardArray = playerCardArray.shuffled()
            for i in 0...10{
                randomPlayerCardArray.append(playerCardArray[i])
            }
        }else{
            randomPlayerCardArray = playerCardArray.shuffled()
        }
        
    }
    
    
    
    @objc func randomCard() {
        //畫面顯示imageView編號123 滾動顯示編號234 再變回初始顯示編號123
        //scrollView滾動1張imageView的距離
        if scrollDistance == 220{
            scrollDistance = 0
            randomCardScrollView.contentOffset.y = CGFloat(scrollDistance)
            changeCardCount += 1
            //array剩下倒數三張 將第4張imageView改成array[0]
            if changeCardCount == randomPlayerCardArray.count - 3{
                playerCard1ImageView.image = UIImage(named: randomPlayerCardArray[randomPlayerCardArray.count - 3])
                playerCard2ImageView.image = UIImage(named: randomPlayerCardArray[randomPlayerCardArray.count - 2])
                playerCard3ImageView.image = UIImage(named: randomPlayerCardArray[randomPlayerCardArray.count - 1])
                playerCard4ImageView.image = UIImage(named: randomPlayerCardArray[0])
                //將第3張imageView改成array[0] 第4張改成array[1]
            }else if changeCardCount == randomPlayerCardArray.count - 2{
                playerCard1ImageView.image = UIImage(named: randomPlayerCardArray[randomPlayerCardArray.count - 2])
                playerCard2ImageView.image = UIImage(named: randomPlayerCardArray[randomPlayerCardArray.count - 1])
                playerCard3ImageView.image = UIImage(named: randomPlayerCardArray[0])
                playerCard4ImageView.image = UIImage(named: randomPlayerCardArray[1])
                //將第2張imageView改成array[0] 第3張改成array[1] 第4張改成array[2]
            }else if changeCardCount == randomPlayerCardArray.count - 1{
                playerCard1ImageView.image = UIImage(named: randomPlayerCardArray[randomPlayerCardArray.count - 1])
                playerCard2ImageView.image = UIImage(named: randomPlayerCardArray[0])
                playerCard3ImageView.image = UIImage(named: randomPlayerCardArray[1])
                playerCard4ImageView.image = UIImage(named: randomPlayerCardArray[2])
                //將第1張imageView改成array[0] 第2張改成array[1] 第3張改成array[2] 變回初始才有重複輪盤效果
            }else if changeCardCount == randomPlayerCardArray.count {
                changeCardCount = 0
                rounds -= 1
                initialCard()
            }else{
                //依序放入array球員卡imageView
                playerCard1ImageView.image = UIImage(named: randomPlayerCardArray[changeCardCount])
                playerCard2ImageView.image = UIImage(named: randomPlayerCardArray[changeCardCount + 1])
                playerCard3ImageView.image = UIImage(named: randomPlayerCardArray[changeCardCount + 2])
                playerCard4ImageView.image = UIImage(named: randomPlayerCardArray[changeCardCount + 3])
            }
            
        }else{
            //scrollView每次滾動的距離
            scrollDistance += 55
            randomCardScrollView.contentOffset.y = CGFloat(scrollDistance)
        }
        
        //三次的滾動速度漸漸變緩
        switch rounds{
            case 0:
                timer?.invalidate()
            case 1:
                timer?.invalidate()
                scrollSpeed = 0.2
                autoScroll()
            case 2:
                timer?.invalidate()
                scrollSpeed = 0.1
                autoScroll()
            default:
                break
        }
        
        //跑完滾動次數 顯示抽到的球員卡
        if rounds == 0 {
           
            if let controller = storyboard?.instantiateViewController(withIdentifier: "AlertView") as? AlertViewController{
                controller.userName = userName
                controller.playerCardArray = randomPlayerCardArray
                present(controller, animated: true)
            }
        }
        
        
    }
    

    
    
    @IBAction func backSetPage(_ sender: Any) {
        
        SetCardViewController.player.pause()
        
        if let controller = storyboard?.instantiateViewController(withIdentifier: "SetCardView"){
            timer?.invalidate()
            present(controller, animated: true)
        }
        
        
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
