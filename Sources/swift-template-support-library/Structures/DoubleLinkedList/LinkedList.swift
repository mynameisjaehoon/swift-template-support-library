//
//  LinkedList.swift
//  
//
//  Created by Jaehoon So on 2023/04/17.
//

import Foundation

enum ListIterateState {
    case begin
    case running
    case done
}

public final class LinkedList<Element: Equatable>: CustomStringConvertible, Sequence, IteratorProtocol {
    private var head: LLNode<Element>?
    private var tail: LLNode<Element>?
    private var current: LLNode<Element>? /// 반복문을 위한 변수
    private var iterateState: ListIterateState = .begin
    private var completeLoop: Bool = false
    public var description: String {
        var current = head
        var datas: [Element] = []
        if head == nil { return "empty linked list" }
        while current != nil {
            guard let data = current?.data else { break }
            datas.append(data)
            current = current?.next
        }
        return datas.map{ "\($0)" }.joined(separator: " -> ")
    }
    
    // MARK: - IteratorProtocol
    public func next() -> Element? {
        defer { self.current = self.current?.next }
        
        switch self.iterateState {
        case .begin:
            self.current = head
            self.iterateState = .running
        case .running:
            if self.current == tail { self.iterateState = .done }
        case .done:
            self.iterateState = .begin
            return nil
        }
        
        return current?.data
    }
    
    // MARK: - Insert Data
    
    /// 연결리스트의 제일 뒤에 데이터를 추가하는 메서드
    /// - Parameter data: 추가할 데이터
    public func append(_ data: Element) {
        var newNode = LLNode(data: data)
        if head == nil {
            head = newNode
            tail = newNode
            return
        }
        
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
    }
    
    /// 연결리스트의 원하는 위치에 데이터를 삽입하는 메서드
    /// - Parameters:
    ///   - data: 삽입할 데이터
    ///   - index: 데이터를 삽입할 위치의 인덱스, 연결리스트의 인덱스는 0부터 시작한다고 가정한다
    /// - Returns: 삽입에 성공했다면 true, 실패했다면 false를 반환한다
    public func insert(_ data: Element, at index: Int) -> Bool {
        var currentIndex: Int = 0
        var current: LLNode<Element>? = head
        
        repeat {
            if currentIndex == index {
                var newNode = LLNode<Element>(data: data)
                
                newNode.next = current
                newNode.prev = current?.prev
                current?.prev?.next = newNode
                current?.prev = newNode
                
                if current == head { head = newNode }
                
                return true
            }
            
            currentIndex += 1
            current = current?.next
        } while current != nil
        
        if currentIndex == index {
            var newNode = LLNode<Element>(data: data)
            newNode.prev = tail
            tail?.next = newNode
            tail = newNode
            
            return true
        }
        
        return false
    }
    
    // MARK: - remove data
    
    /// 연결리스트에 있는 데이터를 삭제한다. 삭제 작업 자체는 `O(1)`의 시간복잡도를 가지지만, 원하는 데이터를 가지는
    /// 노드를 탐색하기 위해 `head`에서부터 순차적으로 탐색하므로 `O(n)`의 시간복잡도를 가진다.
    /// - Parameter data: 삭제하고자 하는 데이터 정보
    /// - Returns: 삭제한 노드의 갯수, 아무것도 삭제하지 않으면 0을 반화한다.
    @discardableResult
    public func remove(_ data: Element) -> Int {
        var current: LLNode<Element>? = head
        var removeCount: Int = 0
        while current != nil {
            var tempNext = current?.next
            if current?.data == data {
                // 삭제 카운트 증가
                removeCount += 1
                
                current?.prev?.next = current?.next
                current?.next?.prev = current?.prev
                if current == head { head = current?.next }
                if current == tail { tail = current?.prev }
            }
            
            current = tempNext
        }
        return removeCount
    }
    
    /// 연결리스트에 있는 데이터를 클로저 조건으로 담아 삭제한다
    /// - Parameter closure: 삭제할 데이터의 조건을 담은 `Bool` 타입을 반환하는 클로저
    /// - Returns: 삭제한 노드의 개수
    public func remove(where closure: (Element) -> Bool) -> Int {
        var current: LLNode<Element>? = head
        var removeCount: Int = 0
        
        while current != nil {
            var tempNext = current?.next
            if closure(current!.data) {
                // 삭제 카운트 증가
                removeCount += 1
                
                current?.prev?.next = current?.next
                current?.next?.prev = current?.prev
                if current == head { head = current?.next }
                if current == tail { tail = current?.prev }
            }
            
            current = tempNext
        }
        return removeCount
    }
    
    public func remove(at index: Int) -> Bool {
        var current: LLNode<Element>? = head
        var currentIndex: Int = 0
        repeat {
            if currentIndex == index {
                current?.prev?.next = current?.next
                current?.next?.prev = current?.prev
                if current == head { head = current?.next }
                if current == tail { tail = current?.prev }
                
                return true
            }
            currentIndex += 1
            current = current?.next
        } while current != nil
        
        return false
    }
}

extension LinkedList {
    subscript(_ index: Int) -> Element? {
        var current: LLNode<Element>? = head
        var currentIndex: Int = 0
        while current != nil {
            if currentIndex == index {
                return current?.data
            }
            current = current?.next
            currentIndex += 1
        }
        return nil
    }
}


