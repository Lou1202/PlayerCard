//
//  PlayerCard.swift
//  playerCard
//
//  Created by 楊曜安 on 2023/4/2.
//

import Foundation

struct PlayerCard {
    let playerName: String
    let league: String
    let position: String
    let hitType: String
    let birthday: Int
    let teamImageName: String
    let imageName: String
}

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
