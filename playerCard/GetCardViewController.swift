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
    var playerSeconds: Double!
    let player = AVPlayer()

    var playerCards = [
        PlayerCard(playerName: "M.楚勞特", league: "AL", position: "外野", hitType: "力量型", birthday: 8, teamImageName: "AL天使", imageName: "AL天使2"),
        PlayerCard(playerName: "J.貝格瑋爾", league: "AL", position: "內野", hitType: "力量型", birthday: 5, teamImageName: "AL太空人", imageName: "AL太空人2"),
        PlayerCard(playerName: "小葛瑞菲", league: "AL", position: "外野", hitType: "力量型", birthday: 11, teamImageName: "AL水手", imageName: "AL水手2"),
        PlayerCard(playerName: "L.阿波林", league: "AL", position: "內野", hitType: "打擊型", birthday: 4, teamImageName: "AL白襪", imageName: "AL白襪2"),
        PlayerCard(playerName: "C.克勞佛", league: "AL", position: "外野", hitType: "打擊型", birthday: 8, teamImageName: "AL光芒", imageName: "AL光芒2"),
        PlayerCard(playerName: "N.喬伊", league: "AL", position: "內野", hitType: "打擊型", birthday: 9, teamImageName: "AL印地安人", imageName: "AL印地安人2"),
        PlayerCard(playerName: "T.柯布", league: "AL", position: "外野", hitType: "打擊型", birthday: 12, teamImageName: "AL老虎", imageName: "AL老虎2"),
        PlayerCard(playerName: "C.銳普肯", league: "AL", position: "內野", hitType: "力量型", birthday: 8, teamImageName: "AL金鶯", imageName: "AL金鶯2"),
        PlayerCard(playerName: "貝比魯斯", league: "AL", position: "外野", hitType: "力量型", birthday: 2, teamImageName: "AL洋基", imageName: "AL洋基2"),
        PlayerCard(playerName: "G.布雷特", league: "AL", position: "內野", hitType: "打擊型", birthday: 5, teamImageName: "AL皇家", imageName: "AL皇家2"),
        PlayerCard(playerName: "T.威廉斯", league: "AL", position: "外野", hitType: "力量型", birthday: 8, teamImageName: "AL紅襪", imageName: "AL紅襪2"),
        PlayerCard(playerName: "I.羅里奎滋", league: "AL", position: "內野", hitType: "打擊型", birthday: 11, teamImageName: "AL遊騎兵", imageName: "AL遊騎兵2"),
        PlayerCard(playerName: "R.韓德森", league: "AL", position: "外野", hitType: "打擊型", birthday: 12, teamImageName: "AL運動家", imageName: "AL運動家2"),
        PlayerCard(playerName: "T.費南德滋", league: "AL", position: "內野", hitType: "打擊型", birthday: 6, teamImageName: "AL藍鳥", imageName: "AL藍鳥2"),
        PlayerCard(playerName: "R.卡魯", league: "AL", position: "內野", hitType: "打擊型", birthday: 10, teamImageName: "AL雙城", imageName: "AL雙城2"),
        PlayerCard(playerName: "彭政閔", league: "CPBL", position: "內野/外野", hitType: "力量型", birthday: 8, teamImageName: "CPBL兄弟", imageName: "CPBL兄弟2"),
        PlayerCard(playerName: "張泰山", league: "CPBL", position: "內野", hitType: "力量型", birthday: 10, teamImageName: "CPBL味全", imageName: "CPBL味全2"),
        PlayerCard(playerName: "廖閔雄", league: "CPBL", position: "外野", hitType: "力量型", birthday: 10, teamImageName: "CPBL時報", imageName: "CPBL時報2"),
        PlayerCard(playerName: "陳金鋒", league: "CPBL", position: "外野", hitType: "力量型", birthday: 10, teamImageName: "CPBL桃猿", imageName: "CPBL桃猿2"),
        PlayerCard(playerName: "潘武雄", league: "CPBL", position: "外野", hitType: "打擊型", birthday: 3, teamImageName: "CPBL統一", imageName: "CPBL統一2"),
        PlayerCard(playerName: "丘昌榮", league: "CPBL", position: "外野", hitType: "力量型", birthday: 10, teamImageName: "CPBL誠泰", imageName: "CPBL誠泰2"),
        PlayerCard(playerName: "黃忠義", league: "CPBL", position: "內野", hitType: "力量型", birthday: 10, teamImageName: "CPBL興農", imageName: "CPBL興農2"),
        PlayerCard(playerName: "陳連宏", league: "CPBL", position: "外野", hitType: "打擊型", birthday: 9, teamImageName: "CPBL鯨", imageName: "CPBL鯨2"),
        PlayerCard(playerName: "林中秋", league: "CPBL", position: "內野/外野", hitType: "力量型", birthday: 9, teamImageName: "CPBL三商", imageName: "CPBL三商2"),
        PlayerCard(playerName: "陳金鋒", league: "CT", position: "外野", hitType: "力量型", birthday: 10, teamImageName: "CT中華隊", imageName: "CT中華隊2"),
        PlayerCard(playerName: "D.萊特", league: "NL", position: "內野", hitType: "打擊型", birthday: 12, teamImageName: "NL大都會", imageName: "NL大都會2"),
        PlayerCard(playerName: "R.桑托", league: "NL", position: "內野", hitType: "力量型", birthday: 2, teamImageName: "NL小熊", imageName: "NL小熊2"),
        PlayerCard(playerName: "W.梅斯", league: "NL", position: "內野/外野", hitType: "力量型", birthday: 5, teamImageName: "NL巨人", imageName: "NL巨人2"),
        PlayerCard(playerName: "H.阿倫", league: "NL", position: "外野", hitType: "力量型", birthday: 2, teamImageName: "NL勇士", imageName: "NL勇士2"),
        PlayerCard(playerName: "T.赫爾頓", league: "NL", position: "內野", hitType: "力量型", birthday: 8, teamImageName: "NL洛磯", imageName: "NL洛磯2"),
        PlayerCard(playerName: "P.羅斯", league: "NL", position: "內野/外野", hitType: "打擊型", birthday: 4, teamImageName: "NL紅人", imageName: "NL紅人2"),
        PlayerCard(playerName: "S.穆休", league: "NL", position: "內野/外野", hitType: "力量型", birthday: 11, teamImageName: "NL紅雀", imageName: "NL紅雀2"),
        PlayerCard(playerName: "H.華格納", league: "NL", position: "內野", hitType: "打擊型", birthday: 2, teamImageName: "NL海盜", imageName: "NL海盜2"),
        PlayerCard(playerName: "L.卡斯提歐", league: "NL", position: "內野", hitType: "打擊型", birthday: 9, teamImageName: "NL馬林魚", imageName: "NL馬林魚2"),
        PlayerCard(playerName: "T.關恩", league: "NL", position: "外野", hitType: "打擊型", birthday: 5, teamImageName: "NL教士", imageName: "NL教士2"),
        PlayerCard(playerName: "M.史梅特", league: "NL", position: "內野", hitType: "力量型", birthday: 9, teamImageName: "NL費城人", imageName: "NL費城人2"),
        PlayerCard(playerName: "彼威瑞斯", league: "NL", position: "內野", hitType: "打擊型", birthday: 7, teamImageName: "NL道奇", imageName: "NL道奇2"),
        PlayerCard(playerName: "蓋瑞卡特", league: "NL", position: "內野", hitType: "力量型", birthday: 4, teamImageName: "NL蒙特羅", imageName: "NL蒙特羅2"),
        PlayerCard(playerName: "L.岡薩雷滋", league: "NL", position: "外野", hitType: "力量型", birthday: 9, teamImageName: "NL響尾蛇", imageName: "NL響尾蛇2"),
        PlayerCard(playerName: "R.揚特", league: "NL", position: "內野/外野", hitType: "打擊型", birthday: 9, teamImageName: "NL釀酒人", imageName: "NL釀酒人2"),
        PlayerCard(playerName: "李以保", league: "TML", position: "外野", hitType: "打擊型", birthday: 10, teamImageName: "TML太陽", imageName: "TML太陽2"),
        PlayerCard(playerName: "謝佳賢", league: "TML", position: "內野/外野", hitType: "力量型", birthday: 4, teamImageName: "TML金剛", imageName: "TML金剛2"),
        PlayerCard(playerName: "吳富連", league: "TML", position: "內野", hitType: "打擊型", birthday: 1, teamImageName: "TML勇士", imageName: "TML勇士2"),
        PlayerCard(playerName: "呂銘賜", league: "TML", position: "外野", hitType: "打擊型", birthday: 10, teamImageName: "TML雷公", imageName: "TML雷公2")
    ]
    
    
    
    @IBOutlet weak var playerCard1ImageView: UIImageView!
    @IBOutlet weak var playerCard2ImageView: UIImageView!
    @IBOutlet weak var playerCard3ImageView: UIImageView!
    @IBOutlet weak var playerCard4ImageView: UIImageView!
    @IBOutlet weak var randomCardScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerSeconds += 0.78
        let url = Bundle.main.url(forResource: "my-hero", withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: url)
        let time = CMTime(seconds: playerSeconds, preferredTimescale: 1)
        player.replaceCurrentItem(with: playerItem)
        player.seek(to: time)
        player.play()
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
            let playerSeconds = player.currentTime().seconds
            player.pause()
            if let controller = storyboard?.instantiateViewController(withIdentifier: "AlertView") as? AlertViewController{
                controller.playerSeconds = playerSeconds
                controller.userName = userName
                controller.playerCardArray = randomPlayerCardArray
                present(controller, animated: true)
            }
        }
        
        
    }
    
    
    
    
    @IBAction func backSetPage(_ sender: Any) {
        
        print("第二次播放結束：\(String(describing: playerSeconds))")
        player.pause()
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
