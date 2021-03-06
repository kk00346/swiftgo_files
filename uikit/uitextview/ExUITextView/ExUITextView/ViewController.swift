//
//  ViewController.swift
//  ExUITextView
//
//  Created by joe feng on 2016/5/16.
//  Copyright © 2016年 hsin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 建立一個 UITextView 的屬性
    var myTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 使用 UITextView(frame:) 建立一個 UITextView
        myTextView = UITextView(frame: CGRect(x: 0, y: 0, width: 250, height: 200))
        
        // 背景顏色
        myTextView.backgroundColor = UIColor.darkGrayColor()

        // 文字顏色
        myTextView.textColor = UIColor.whiteColor()
        
        // 文字字型及大小
        myTextView.font = UIFont(name: "Helvetica-Light", size: 20)
        
        // 文字向左對齊
        myTextView.textAlignment = .Left
        
        // 預設文字內容
        myTextView.text = "Swift 起步走"

        // 適用的鍵盤樣式 這邊選擇預設的
        myTextView.keyboardType = .Default
        
        // 鍵盤上的 return 鍵樣式 這邊選擇預設的
        myTextView.returnKeyType = .Default
        
        // 文字是否可以被編輯
        myTextView.editable = true
        
        // 文字是否可以被選取
        myTextView.selectable = true
        
        // 取得螢幕的尺寸
        let fullScreenSize = UIScreen.mainScreen().bounds.size
        
        // 設置於畫面的中間偏上位置
        myTextView.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.3)
        
        // 加入畫面
        self.view.addSubview(myTextView)
        
        // 建立兩個新的選項
        let mail = UIMenuItem(title: "寄送", action: #selector(ViewController.sendMail))
        let facebook = UIMenuItem(title: "FB", action: #selector(ViewController.sendFB))

        // 建立選單
        let menu = UIMenuController()
        
        // 將新的選項加入選單
        menu.menuItems = [mail,facebook]
        
        // 增加一個觸控事件
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.hideKeyboard(_:)))

        tap.cancelsTouchesInView = false
        
        // 加在最基底的 self.view 上
        self.view.addGestureRecognizer(tap)
        
    }

    func hideKeyboard(tapG:UITapGestureRecognizer){
        // 除了使用 self.view.endEditing(true)
        // 也可以用 resignFirstResponder()
        // 來針對一個元件隱藏鍵盤
        self.myTextView.resignFirstResponder()
    }
    
    func sendMail() {
        print("sendMail")
    }

    func sendFB() {
        print("sendFB")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

