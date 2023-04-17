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
- **스택 초기화**<br>
    Stack 구조체로 사용할 타입과 함게 스택을 초기화할 수 있습니다. 아래의 코드는 `Int`타입의 데이터가 들어가는 스택을 초기화 하는 코드입니다. 처음부터 빈 스택을 생성하거나, 데이터가 담긴 배열을 전달하여 스택을 초기화 할 수 있습니다. 배열을 전달할 경우, 배열의 마지막 원소가 스택의 `top`에 있는 것으로 간주됩니다.
    ```swift
    var stack = Stack<Int>()
    var stack = Stack<Int>(with: [1,3,5,7,9])
    ```
- **스택 push**<br>
    스택에 원소를 추가하기 위해서는 `push(_:)` 메서드를 사용할 수 있습니다.
    ```swift
    stack.push(3)
    ```
- **스택 pop**<br>
    스택의 가장 상위에 있는 원소를 제거하여 반환받기 위해서는 `pop()`메서드를 사용할 수 있습니다. 옵셔널 타입을 반환합니다. 스택이 비워져 있는 경우 `nil`을 반환합니다.
    ```swift
    var stack = Stack<Int>(with: [1,3,5,7,9])
    stack.pop() // Optional(9)
    ```
- **스택 clear**<br>
    스택을 비우고 싶다면, clear 메서드를 사용할 수 있습니다.
    ```swift
    stack.clear()
    ```
- **프로퍼티**<br>
    - **`isEmpty`**: 스택이 비어있는지 확인하는 프로퍼티 입니다. 비어있다면 `true`, 원소가 있다면 `false를` 반환합니다.
    - **`size`**: 스택에 들어있는 원소의 갯수를 반환합니다.

## Queue
## Linked List(Double Linked List)
## Author
- [Jaehoon So](https://github.com/mynameisjaehoon)
- e-mail: jhspacelover@naver.com
## LICENSE
`swift-template-support-library` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.

A description of this package.

