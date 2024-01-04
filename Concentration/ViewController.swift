//
//  ViewController.swift
//  Concentration
//
//  Created by 정대로 on 1/4/24.
//

import UIKit

class ViewController: UIViewController {
    

    // _ : 인수가 없다는 뜻
    // Object-c에서 온 기능이고, 거기에는 내부 외부 이름이 없어서 _가 쓰임
    @IBAction func touchCard(_ sender: UIButton) {
        
        // 영어처럼 읽혀야함 flipCard withEmoji on sender
        flipCard(withEmoji: "😍", on: sender)
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipCard(withEmoji: \(emoji)")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = UIColor.black
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = UIColor.orange
        }
    }
    
}

