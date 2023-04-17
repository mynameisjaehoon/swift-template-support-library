//
//  Queue.swift
//  
//
//  Created by Jaehoon So on 2023/04/16.
//

import Foundation

/// 큐 자료구조를 구현한 구조체 입니다.
public struct Queue<Element>: CustomStringConvertible {
    
    /// 데이터가 들어오는 변수
    private var inbox: [Element]
    /// 데이터가 나가는 변수
    private var outbox: [Element]
    /// 현재 큐에 있는 데이터의 개수
    public var count: Int { inbox.count + outbox.count }
    /// 큐가 비어있는지를 나타내는 변수. 비어있을 경우 `true`, 비어있지 않을 경우 `false`를 가진다.
    public var isEmpty: Bool { inbox.isEmpty && outbox.isEmpty }
    /// 큐 에대한 정보를 호출하고 싶을 때 출력하는 변수
    public var description: String {
        if isEmpty { return "status: Queue is Empty" }
        var allElements: [Element] = []
        allElements.append(contentsOf: outbox.reversed())
        allElements.append(contentsOf: inbox)
        
        return "----- Queue Elements -----\n"
                + "\(allElements.map{"\($0)"}.joined(separator: " -> "))"
                + "----- Queue End -----"
    }
    
    public init(contentsOf elements: [Element] = []) {
        self.inbox = elements
        self.outbox = []
    }
    
    /// 큐에 데이터를 넣는다
    /// - Parameter data: 큐에 삽입할 데이터. 제네릭 타입에 맞는 데이터를 삽입해야한다.
    mutating public func enqueue(_ data: Element) {
        inbox.append(data)
    }
    
    
    /// 큐에서 데이터를 빼오는 메서드 `outbox`가 비어있을 경우, `inbox`의 데이터들을 뒤집어서 `outbox`에 넣고
    /// `outbox`의 제일 마지막 데이터를 반환한다. 비어있지 않을 경우 `outbox`의 마지막 데이터를 반환하고 삭제한다.
    /// - Returns: 큐에서 가장 마지막에 들어온 데이터. 큐가 비어있을 경우 `nil`을 반환한다.
    @discardableResult
    mutating public func dequeue() -> Element? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
    
    /// 큐를 비우는 메서드
    mutating public func clear() {
        inbox.removeAll()
        outbox.removeAll()
    }
    
}
