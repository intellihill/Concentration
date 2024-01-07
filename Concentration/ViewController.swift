//
//  ViewController.swift
//  Concentration
//
//  Created by 정대로 on 1/4/24.
//  Controller

import UIKit

class ViewController: UIViewController {
    
    // Concentration으로부터의 arrow : game에 어떤 메세지도 전달할 수 있다.
    // lazy는 누가 사용하기 전까지는 초기화하지 않는다. (lazy는 초기화 되었다고 쳐준다)
    // lazy는 property observe를 쓸 수 없다.
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    @IBOutlet var cardButtons: [UIButton]!
    

    
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
    // target-action
    @IBAction func touchCard(_ sender: UIButton) {
        
        // 영어처럼 읽혀야함 flipCard withEmoji on sender
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
        
    }
    
    func updateViewFromModel() {
        // indices Array method : 모든 인덱스의 계수 가능 범위를 배열로 리턴해준다.
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.black
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
            }
        }
    }
    
    var emojiChoices = ["😀","😍","🤩","😛"]
    
    // Dictionary
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        // 중첩된 if문은 같은 줄에 쉼표로 구분한 뒤 적을 수 있다.
        if emoji[card.identifier] == nil ,emojiChoices.count > 0 {
            // 카드가 비어있으면 채워준다
            // arc4random_uniform은 유사(pseudo) 임의 번호 생성기이다.
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }
        return emoji[card.identifier] ?? "?"
    }
    
}

