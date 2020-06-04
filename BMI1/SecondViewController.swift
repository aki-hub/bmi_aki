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

    var bmi:Double!
    var goodWeight:Double!
    var hikaku:Double!

    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var goodLabel: UILabel!
    @IBOutlet weak var hikakuLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var waku2Label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // パーツの設定
        resetButton.layer.cornerRadius = 5.0
        waku2Label.layer.cornerRadius = 20
        waku2Label.layer.backgroundColor = UIColor.white.cgColor
        waku2Label.layer.borderColor = UIColor.gray.cgColor
        waku2Label.layer.shadowColor = UIColor.black.cgColor
        waku2Label.layer.shadowRadius = 5
        waku2Label.layer.shadowOffset = CGSize(width: 5, height: 5)
        waku2Label.layer.shadowOpacity = 0.1
        waku2Label.layer.borderWidth = 0.1
        
        if 25 <= bmi && bmi < 30 {
            resultLabel.text = String("\(bmi!) ") + "　肥満（１度)"
        } else if 30 <= bmi && bmi < 35 {
            resultLabel.text = String("\(bmi!) ") + "　肥満（２度)"
        } else if 35 <= bmi && bmi < 40 {
            resultLabel.text = String("\(bmi!) ") + "　肥満（３度）"
        } else if 40 <= bmi {
            resultLabel.text = String("\(bmi!)") + "　肥満（４度）"
        } else if 18.5 <= bmi && bmi < 25 {
            resultLabel.text = String("\(bmi!)") + "　普通体重"
        } else if bmi < 18.5 {
            resultLabel.text = String("\(bmi!)") + "  低体重"
        }
        goodLabel.text = String("\(goodWeight!)") + "　kg"
        hikakuLabel.text = String("\(hikaku!)") + "　kg"
        
    }
    
    @IBAction func resetButton(_ sender: Any) {
        /*
        let vc = UIStoryboard(name: "FirstViewController", bundle: nil).instantiateInitialViewController()as! FirstViewController
        
        vc.weightTextField.placeholder = ""
        vc.heightTextField.placeholder = ""
    */
        //present()で遷移する
        dismiss(animated: true, completion: nil)
    }
    
}
