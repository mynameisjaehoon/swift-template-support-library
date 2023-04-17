import XCTest
@testable import SwiftTSL

final class SwiftTSLTests: XCTestCase {
    
    var stack = Stack<Int>()
    var queue = Queue<Int>()
    var linkedList = LinkedList<Int>()
    
    override func setUpWithError() throws {
        self.stack = Stack<Int>(with: [2,4,6,8,10])
        self.queue = Queue<Int>(contentsOf: [2,4,6,8])
        
        self.linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(3)
        linkedList.append(5)
        linkedList.append(3)
        linkedList.append(6)
        linkedList.append(7)
    }

}

// MARK: - Stack Test
extension SwiftTSLTests {
    func test1_stack_push() throws {
        var stack = Stack<Int>()
        stack.push(8)
        stack.push(10)
        stack.push(12)
        
        XCTAssertEqual(stack.pop()!, 12)
    }
    
    func test2_stack_pop() throws {
        var stack = Stack<Int>(with: [2,4,6,8,10])
        XCTAssertEqual(stack.pop()!, 10)
        XCTAssertEqual(stack.pop()!, 8)
        XCTAssertEqual(stack.pop()!, 6)
        XCTAssertEqual(stack.pop()!, 4)
        XCTAssertEqual(stack.pop()!, 2)
        XCTAssertEqual(stack.pop(), nil)
    }
    
    func test3_stack_top() throws {
        XCTAssertEqual(stack.top()!, 10)
    }
}

// MARK: - Queue Test
extension SwiftTSLTests {
    func test4_queue_enqueue() throws {
        self.queue.enqueue(10)
        XCTAssertEqual(queue.size, 5)
    }
    
    func test5_queue_dequeue() throws {
        XCTAssertEqual(queue.front, Optional(2))
        XCTAssertEqual(queue.dequeue(), Optional(2))
        XCTAssertEqual(queue.size, 3)
    }
    
    func test6_queue_clear() throws {
        self.queue.clear()
        XCTAssertEqual(queue.dequeue(), nil)
    }
}

// MARK: - Linked List Test
extension SwiftTSLTests {
    
}
