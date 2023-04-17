# Queue
### `struct Queue<Element>: CustomStringConvertible`
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
- **`enqueue(_: Element)`**<br>
    큐에 데이터를 추가하기 위해서 사용하는 메서드 입니다.
    ```swift
    queue.enqueue(3)
    queue.enqueue(4)
    ```
- **`dequeue() -> Element`**<br>
    큐에 있는 데이터를 삭제하여 반환받기 위해 사용하는 메서드 입니다. 옵셔널 타입을 반환하며, 큐가 비워져있을 때 호출하면 `nil`을 반환합니다.
    ```swift
    queue.enqueue(3)
    queue.enqueue(4)
    queue.dequeue() // Optional(3)
    queue.dequeue() // Optional(4)
    queue.dequeue() // nil
    ```
- **`clear()`**<br>
    큐를 비우고 싶을 때는 clear()메서드를 사용할 수 있습니다.
    ```swift
    queue.clear()
    ```    