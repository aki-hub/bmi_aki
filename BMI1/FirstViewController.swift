//
//  FirstViewController.swift
//  BMI1
//
//  Created by 高見明伸 on 2020/06/02.
//  Copyright © 2020 高見明伸. All rights reserved.
//

import UIKit
import Darwin

class FirstViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var waku1Label: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    override func viewDidLoad() {
           super.viewDidLoad()

           secondLabel.numberOfLines = 3
           secondLabel.text = "前回の健康診断の結果はいかがでしたか？\n現在のBMI指数を把握して\n健康を維持しましょう。"
           weightTextField.text = "体重"
           heightTextField.text = "身長"
           //青色の設定
           let rgba = UIColor(red:55/255,green:200/255,blue: 214/255,alpha: 1.0)
           //ボタンの角の設定
           resultButton.layer.cornerRadius = 5.0
           
           resetButton.layer.borderColor = rgba.cgColor
           resetButton.layer.borderWidth = 0.8
           resetButton.layer.cornerRadius = 5.0
           resetButton.backgroundColor = UIColor.white
           
           waku1Label.layer.cornerRadius = 20
           waku1Label.layer.backgroundColor = UIColor.white.cgColor
           waku1Label.layer.borderColor = UIColor.gray.cgColor
           waku1Label.layer.shadowColor = UIColor.black.cgColor
           waku1Label.layer.shadowRadius = 5
           waku1Label.layer.shadowOffset = CGSize(width: 5, height: 5)
           waku1Label.layer.shadowOpacity = 0.1
           waku1Label.layer.borderWidth = 0.1
           
           //textFieldの下線作成
           weightTextField.placeholder = "NAME"
           weightTextField.addBorderBottom(height: 1.0, coler:UIColor.lightGray )
           heightTextField.addBorderBottom(height: 1.0, coler: UIColor.lightGray)
           heightTextField.placeholder = "NAME"
           weightTextField.delegate = self
           heightTextField.delegate = self
           weightTextField.placeholder = "体重"
           heightTextField.placeholder = "身長"
       }
       
       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
       
    @IBAction func heightTextField(_ sender: Any) {
    }
    
    @IBAction func weightTextField(_ sender: Any) {
    }
    
    @IBAction func resultButton(_ sender: Any) {
    //Storyboardから遷移先のViewControllerを生成
           //簡易的なコードなので強制キャストしている。
           let vc = UIStoryboard(name: "SecondViewController", bundle: nil).instantiateInitialViewController()as! SecondViewController
        
        if weightTextField.text != nil {
            if heightTextField.text != nil {
        var doubleWeight:Double = atof(weightTextField.text)
        var doubleHeight:Double = atof(heightTextField.text)/100
        
        var bmi:Double = doubleWeight / (doubleHeight * doubleHeight)
        var goodWeight:Double = 22 * doubleHeight * doubleHeight
        var hikaku:Double = doubleWeight - goodWeight
        
        bmi = round(bmi*10)/10
        goodWeight = round(goodWeight*10)/10
        hikaku = round(hikaku*10)/10
                
        vc.bmi = bmi
        vc.goodWeight = goodWeight
        vc.hikaku = hikaku
           //present()で遷移する
           present(vc,animated: true,completion: nil)
            
        } else {
                secondLabel.text = "数値を入力してください"
        }
    
        } else {
            secondLabel.text = "数値を入力してください"
        }
        weightTextField.text = ""
        heightTextField.text = ""
        }
    
    @IBAction func resetButton(_ sender: Any) {
        weightTextField.text = ""
        heightTextField.text = ""
    }
    
    // キーボードを閉じる（returnキーを押下時）
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension UITextField {
    func addBorderBottom(height:CGFloat,coler:UIColor) {
        let border = CALayer()
        border.frame = CGRect(x:0, y:self.frame.height - height, width: self.frame.width,height: height)
        border.backgroundColor = coler.cgColor
        self.layer.addSublayer(border)
    }
}
    

