//
//  Stack.swift
//  
//
//  Created by Jaehoon So on 2023/04/16.
//

import Foundation

public struct Stack<Element> {
    
    private var elements: [Element]
    public var count: Int { elements.count }
    public var isEmpty: Bool { elements.isEmpty }
    
    public init(with list: [Element] = []) { self.elements = list }
    
    /// 스택의 내용을 비워주는 메서드
    mutating public func clear() {
        elements.removeAll()
    }
    
    /// 스택에 원소를 추가하는메서드. 스택자료구조 이기 때문에 배열의 마지막에 추가됩니다.
    /// - Parameter value: 추가할 데이터. `Stack<Element>` 에서 Element 타입만 추가할 수 있습니다.
    mutating public func push(_ value: Element) {
        elements.append(value)
    }
    
    /// 스택에서 제일 상위의 데이터를 삭제하고 반환하는 메서드
    /// - Returns: 스택 상위에 있는 데이터를 반환한다. 스택이 비어있다면 `nil`을 반환한다.
    mutating public func pop() -> Element? {
        if elements.isEmpty { return  nil }
        return elements.removeLast()
    }
    
    /// 스택 제일 상위에 있는 데이터를 반환하는 메서드
    /// - Returns: 스택 상위에 있는 데이터를 반환한다. 스택이 비어있다면 `nil`을 반환한다.
    public func top() -> Element? {
        return elements.last
    }
}
