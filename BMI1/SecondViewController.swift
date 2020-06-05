//
//  SecondViewController.swift
//  BMI1
//
//  Created by 高見明伸 on 2020/06/02.
//  Copyright © 2020 高見明伸. All rights reserved.
//

import UIKit
import Darwin

class SecondViewController: UIViewController {

    var bmi: Double!
    var goodWeight: Double!
    var hikaku: Double!

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var goodLabel: UILabel!
    @IBOutlet weak var hikakuLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var waku2Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureResetButton()
        configureWaku2Label()
        configureResultLabels()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Configure

extension SecondViewController {
    
    private func configureResetButton() {
        resetButton.layer.cornerRadius = 5.0
    }
    
    private func configureWaku2Label() {
        // NOTE: そもそも UILabel ではなく、UIView を使うべき
        waku2Label.layer.cornerRadius = 20
        waku2Label.layer.backgroundColor = UIColor.white.cgColor
        waku2Label.layer.borderColor = UIColor.gray.cgColor
        waku2Label.layer.shadowColor = UIColor.black.cgColor
        waku2Label.layer.shadowRadius = 5
        waku2Label.layer.shadowOffset = CGSize(width: 5, height: 5)
        waku2Label.layer.shadowOpacity = 0.1
        waku2Label.layer.borderWidth = 0.1
    }
    
    private func configureResultLabels() {
        resultLabel.text = convertBmiToFormattedString(of: bmi)
        goodLabel.text = String(format: "%.2f kg", goodWeight)
        hikakuLabel.text = String(format: "%.2f kg", hikaku)
    }
}

// MARK: - Util

extension SecondViewController {
    
    private func convertBmiToFormattedString(of bmi: Double) -> String {
        let roundedBmiString = String(format: "%.2f", bmi)
        
        if bmi < 18.5 {
            return  roundedBmiString + "  低体重"
        }
        
        switch bmi {
        case 18.5 ..< 25:
            return roundedBmiString + "  普通体重"
        case 25 ..< 30:
            return roundedBmiString + "  肥満（１度)"
        case 30 ..< 35:
            return roundedBmiString + "　肥満（２度)"
        case 35 ..< 40:
            return roundedBmiString + "　肥満（３度）"
        default:
            return roundedBmiString + "　肥満（４度）"
        }
    }
}
