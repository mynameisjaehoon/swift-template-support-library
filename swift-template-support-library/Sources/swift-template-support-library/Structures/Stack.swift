//
//  File.swift
//  
//
//  Created by Jaehoon So on 2023/04/16.
//

import Foundation

public struct Stack<Element> {
    
    private var elements: [Element]
    
    public var count: Int {
        return elements.count
    }
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    init(with list: [Element] = []) {
        self.elements = list
    }
    
    mutating public func clear() {
        elements.removeAll()
    }
    
    mutating public func push(_ value: Element) {
        elements.append(value)
    }
    
    mutating public func pop() -> Element? {
        if elements.isEmpty { return  nil }
        return elements.removeLast()
    }
    
    public func top() -> Element? {
        return elements.last
    }
}
