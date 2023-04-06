//
//  ViewController.swift
//  playerCard
//
//  Created by 楊曜安 on 2023/3/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
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


}

