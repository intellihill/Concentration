//
//  Concentration.swift
//  Concentration
//
//  Created by 정대로 on 1/6/24.
//  Model

import Foundation
/**
 class
 1. 상속성이 있다.
 2. reference type
    2-1. heap에 자료형이 담겨 있고 그 자료형에 포인터를 쓸 수 있다.
    2-2. 자료형을 가리키는 포인터를 보내는 것이다.
 3. Class는 모든 변수들이 초기화되면 인수가 없는 init을 자동으로 가지게 된다.
 */
class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if card match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no card or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
//        for identifier in 1...numberOfPairsOfCards {
//            let card = Card(identifier: identifier)
//            let matchingCard = card // 구조체를 다른 변수에 할당할 때 복사하기 때문에 가능하다.
//            cards.append(card)
//            cards.append(card) // matchingCard->card 배열에 넣거나 뺄 때도 카드를 복사하기 때문이다.
            //위의 네줄을 리팩토링 할 수 있다. 배열도 구조체이다.
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: shuffle the cards
    }
}
