//
//  Crad.swift
//  Concentration
//
//  Created by 정대로 on 1/6/24.
//  Model

import Foundation
/**
 struct
 1.  상속성이 없다.
 2.  value type - copy
 3. 구조체가 받는 공짜 이니셜라이저는 모든 변수를 초기화한다.

 */
// what is card need?
struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    // static func는 Card class에 있지만 Card에게 보낼 수 없댜.
    // 이메세지를 이해하는 것은 Card Type뿐이다.
    static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    // 식별자가 하나만 쓰이면 외부 이름과 내부 이름이 같다는 의미이다.
    // init은 외부 이름과 내부 이름이 종종 같은 유일한 메소드다.
//    init(identifier: Int) {
//        self.identifier = identifier
//    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
