//
//  Linear.swift
//  
//
//  Created by Jaehoon So on 2023/04/16.
//

import Foundation


/// 선형자료구조가 채택하는 프로토콜
protocol Linear {
    var count: Int { get set }
    var isEmpty: Bool { get set }
    
    mutating func clear()
}
