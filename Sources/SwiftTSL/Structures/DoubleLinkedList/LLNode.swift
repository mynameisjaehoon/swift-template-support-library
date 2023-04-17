//
//  LLNode.swift
//  
//
//  Created by Jaehoon So on 2023/04/17.
//

import Foundation

/// 더블 연결리스트(Double Linked List)를 구성하는 노드 클래스
/// 노드 삭제시 노드가 같은지 식별해야하기 때문에 `Equatable` 프로토콜을 채택하고 있습니다.
public final class LLNode<Element: Equatable>: Equatable {
    var id: UUID
    var data: Element
    /// 다음 노드를 가리키는 포인터 역할을 하는 변수 `next`와 이전 노드를 가리키는 `prev`가 둘다
    /// strong reference로 선언되어 있으면 강한 순환참조 문제가 발생할 수 있기 때문에 `next`와 `prev` 둘 중
    /// 하나는 약한 참조로 선언하였다
    weak var next: LLNode?
    var prev: LLNode?
    
    public init(data: Element) {
        self.id = UUID()
        self.data = data
        self.next = nil
        self.prev = nil
    }
    
    public static func == (lhs: LLNode<Element>, rhs: LLNode<Element>) -> Bool {
        lhs.id == rhs.id
    }
}

