//
//  FirstViewController.swift
//  BMI1
//
//  Created by 高見明伸 on 2020/06/02.
//  Copyright © 2020 高見明伸. All rights reserved.
//

import UIKit
import Darwin

class FirstViewController: UIViewController {
    
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var waku1Label: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var firstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureResetButton()
        configureWaku1Label()
        configureWeightTextField()
        configureHeightTextField()
    }
    
    @IBAction func resultButton(_ sender: Any) {
        // NOTE: if let のネストを防ぐ、早期 Return のために guard let を使用する.
        guard let weightText = weightTextField.text,
            let heightText = heightTextField.text else { return }
        
        // NOTE: 数値のチェックはキャストで可能
        if let weight = Double(weightText),
            let height = Double(heightText) {
            
            var bmi: Double = weight / (height * height)
            var goodWeight: Double = 22 * height * height
            var hikaku: Double = weight - weight
            
            bmi = round(bmi * 100) / 100
            goodWeight = round(goodWeight * 100) / 100
            hikaku = round(hikaku * 100) / 100
            
            // NOTE: 値渡しの漏れを防ぐために関数として切り出して、必ず全ての値を渡すようにする.
            presentSecond(bmi: bmi, goodWeight: goodWeight, hikaku: hikaku)
        } else {
            presentAlert(with: "数値を入力してください")
        }
        weightTextField.text = ""
        heightTextField.text = ""
    }
    
    @IBAction func resetButton(_ sender: Any) {
        weightTextField.text = ""
        heightTextField.text = ""
    }
}

// MARK: - Configure

extension FirstViewController {
    
    private func configureResetButton() {
        //ボタンの角の設定
        resultButton.layer.cornerRadius = 5.0
        resetButton.layer.borderColor = UIColor(red: 55/255, green: 200/255, blue: 214/255, alpha: 1.0).cgColor
        resetButton.layer.borderWidth = 0.8
        resetButton.layer.cornerRadius = 5.0
        resetButton.backgroundColor = UIColor.white
    }
    
    private func configureWaku1Label() {
        // NOTE: UILabel ではなく UIView にするべき
        waku1Label.layer.cornerRadius = 20
        waku1Label.layer.backgroundColor = UIColor.white.cgColor
        waku1Label.layer.borderColor = UIColor.gray.cgColor
        waku1Label.layer.shadowColor = UIColor.black.cgColor
        waku1Label.layer.shadowRadius = 5
        waku1Label.layer.shadowOffset = CGSize(width: 5, height: 5)
        waku1Label.layer.shadowOpacity = 0.1
        waku1Label.layer.borderWidth = 0.1
    }
    
    private func configureWeightTextField() {
        weightTextField.addBorderBottom(height: 1.0, coler: UIColor.lightGray)
        weightTextField.delegate = self
    }
    
    private func configureHeightTextField() {
        heightTextField.addBorderBottom(height: 1.0, coler: UIColor.lightGray)
        heightTextField.delegate = self
    }
}

// MARK: - Transition

extension FirstViewController {
    
    private func presentAlert(with message: String) {
        let ac = UIAlertController(title: "", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
    }
    
    private func presentSecond(bmi: Double, goodWeight: Double, hikaku: Double) {
        let vc = UIStoryboard(name: "SecondViewController", bundle: nil).instantiateInitialViewController() as! SecondViewController
        vc.bmi = bmi
        vc.goodWeight = goodWeight
        vc.hikaku = hikaku
        
        present(vc, animated: true, completion: nil)
    }
}

// MARK: - TextField delegate

extension FirstViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       textField.resignFirstResponder()
       return true
    }
}
