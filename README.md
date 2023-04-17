# swift-template-support-library

코딩테스트를 Swift로 준비하다가 다른언어와 다르게 STL이 제공되지 않아 직접 만들어서 사용하기로 했습니다.

- [Stack](#stack)
- [Queue](#queue)
- [Linked List](#linked-listdouble-linked-list)

## 사용법

Swift Package Manager에서 다음 URL로 프로젝트에 package dependency를 추가합니다.
```
https://github.com/mynameisjaehoon/swift-template-support-library.git
```
파일에서 SwiftTSL을 import하여 사용할 수 있습니다.
```swift
import SwiftTSL
```

## Stack
스택은 제일 마지막에 들어간 데이터가 가장 먼저나오는 LIFO(Last-In-First-Out) 자료구조입니다.
- **프로퍼티**<br>
    - **`size`**: 스택에 들어있는 원소의 갯수를 반환합니다. 
    - **`isEmpty`**: 스택이 비어있는지 확인하는 프로퍼티 입니다. 비어있다면 `true`, 원소가 있다면 `false`를 반환합니다.
- **스택 초기화**<br>
    Stack 구조체를 통해 저장할 타입을 제네릭으로 전달하여 스택을 초기화할 수 있습니다. 아래의 코드는 `Int`타입의 데이터가 들어가는 스택을 초기화 하는 코드입니다. 처음부터 빈 스택을 생성하거나, 데이터가 담긴 배열을 전달하여 스택을 초기화 할 수 있습니다. 배열을 전달할 경우, 배열의 마지막 원소가 스택의 `top`에 있는 것으로 간주됩니다.
    ```swift
    var stack = Stack<Int>()
    var stack = Stack<Int>(with: [1,3,5,7,9])
    ```
- **스택 데이터 추가(`push`)**<br>
    스택에 원소를 추가하기 위해서는 `push(_:)` 메서드를 사용할 수 있습니다.
    ```swift
    stack.push(3)
    ```
- **스택 데이터 반환(`pop`)**<br>
    스택의 가장 상위에 있는 원소를 제거하여 반환받기 위해서는 `pop()`메서드를 사용할 수 있습니다. 옵셔널 타입을 반환합니다. 스택이 비워져 있는 경우 `nil`을 반환합니다.
    ```swift
    var stack = Stack<Int>(with: [1,3,5,7,9])
    stack.pop() // Optional(9)
    // 이후 스택의 상태는 [1,3,5,7]
    ```
- **스택 상위 데이터 조회(`top`)**<br>
    스택의 가장 상위에 있는 원소를 조회하기 위해서 `top()`메서드를 사용할 수 있습니다. 옵셔널 타입이 반환되고, 스택이 비워져있는 경우 `nil`을 반환합니다. 조회만 하는 것이기 때문에 데이터가 삭제되지 않습니다.
    ```swift
    var stack = STack<Int>(with: [1,3,5,7,9])
    stack.top() // Optional(9)
    ```
- **스택 비우기(`clear`)**<br>
    스택을 비우고 싶다면, clear 메서드를 사용할 수 있습니다.
    ```swift
    stack.clear()
    ```


## Queue
큐는 제일 먼저 들어간 데이터가 가장 먼저나오는 FIFO(First-In-First-Out)자료구조 입니다.
- **프로퍼티**<br>
    - **`size`**: 현재 큐에 있는 데이터의 개수를 표현하는 프로퍼티
    - **`isEmpty`**: 큐가 비어있는지 확인하는 프로퍼티 입니다. 비어있다면 `true`, 원소가 있다면 `false`를 반환합니다.
    - **`front`**: 큐의 가장 앞에 있는 원소를 표현하는 프로퍼티. 옵셔널 타입을 반환하며 큐가 비어있다면 nil을 반환합니다.
    - **`description`**: 큐에대한 정보를 반환하는 문자열 프로퍼티. `description` 변수를 출력하거나, 인스턴스를 출력하면 큐와 관련된 정보를 담은 문자열을 반환합니다.
        ```swift
        print(queue)
        // ----- Queue Elements -----
        // 3 -> 4
        // ----- Queue End -----
        ```
- **큐 초기화**<br>
    `Queue` 구조체를 통해 저장할 타입을 제네릭으로 전달하여 스택을 초기화할 수 있습니다. 아래의 코드는 `Int`타입의 데이터가 들어가는 큐를 초기화하는 코드입니다. 
    ```swift
    var queue = Queue<Int>()
    ```
- **큐 데이터 추가(`enqueue`)**<br>
    큐에 데이터를 추가하기 위해서는 `enqueue(_:)`메서드를 사용할 수 있습니다.
    ```swift
    queue.enqueue(3)
    queue.enqueue(4)
    ```
- **큐 데이터 삭제(`dequeue`)**<br>
    큐에 있는 데이터를 삭제하여 반환받기 위해서는 `dequeue()`메서드를 사용할 수 있습니다. 옵셔널 타입을 반환하며, 큐가 비워져있을 때 호출하면 `nil`을 반환합니다.
    ```swift
    queue.enqueue(3)
    queue.enqueue(4)
    queue.dequeue() // Optional(3)
    queue.dequeue() // Optional(4)
    queue.dequeue() // nil
    ```
- **큐 비우기(`clear`)**<br>
    큐를 비우고 싶을 때는 clear()메서드를 사용할 수 있습니다.
    ```swift
    queue.clear()
    ```    
## Linked List(Double Linked List)
## Author
- [Jaehoon So](https://github.com/mynameisjaehoon)
- e-mail: jhspacelover@naver.com
## LICENSE
`swift-template-support-library` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.

A description of this package.

