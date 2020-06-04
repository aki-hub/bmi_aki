//
//  SecondViewController.swift
//  BMI1
//
//  Created by 高見明伸 on 2020/06/02.
//  Copyright © 2020 高見明伸. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var weight:String!
    var height:String!
    var bmi:Double!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(weight)
        print(height)
        print(bmi)

        // パーツの設定
        waku2Label.layer.cornerRadius = 20.0
        resetButton.layer.cornerRadius = 5.0
        waku2Label.layer.borderColor = UIColor.gray.cgColor
        waku2Label.layer.borderWidth = 0.1
        waku2Label.layer.shadowColor = UIColor.black.cgColor
        waku2Label.layer.shadowRadius = 5
        waku2Label.layer.shadowOffset = CGSize(width: 5, height: 5)
        waku2Label.layer.shadowOpacity = 0.1
        
    }
    
    
}
