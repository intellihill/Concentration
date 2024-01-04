//
//  ViewController.swift
//  Concentration
//
//  Created by 정대로 on 1/4/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["😀","😍","🤩","😛"]
    
    var flipCount: Int = 0 {
        // Property Observer
        // 속성이 설정될 때마다 이 안의 코드가 실행 됨
        didSet {
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    // _ : 인수가 없다는 뜻(no argument)
    // Object-c에서 온 기능이고, 거기에는 내부 외부 이름이 없어서 _가 쓰임
    @IBAction func touchCard(_ sender: UIButton) {
        
        // 영어처럼 읽혀야함 flipCard withEmoji on sender
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            print("cardNumber : \(cardNumber)")
        } else {
            print("chosen card was not in cardButtons")
        }

    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipCard(withEmoji: \(emoji)")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = UIColor.black
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = UIColor.white
        }
    }
    
}

