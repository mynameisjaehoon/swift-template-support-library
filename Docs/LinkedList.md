# Linked List(Double Linked List)
### `class LinkedList<Element: Equatable>: CustomStringConvertible, Sequence, IteratorProtocol`
연결리스트는 각 노드가 데이터와 포인터를 가지고 연결되어있는 방식으로 데이터를 저장하는 자료구조이다. 본 라이브러리에서의 연결리스트는 이중 연결리스트(Double Linked List)로 구현되어 있습니다.
- **연결리스트 초기화**<br>
    LinkedList 클래스를 통해 노드에 저장할 타입을 제네릭으로 전달하여 스택을 초기화할 수 있습니다. 아래의 코드는 `Int`타입의 데이터가 들어가는 연결리스트를 초기화 하는 코드입니다.
    ```swift
    let linkedList = LinkedList<Int>()
    ```
- **`append(_: Element)`**<br>
    - `parameter1`: 삽입할 노드가 가지는 데이터

    연결리스트의 제일 뒤에 노드를 추가하기 위해서 사용하는 메서드 입니다.

    ```swift
    let linkedList = LinkedList<Int>()
    linkedList.append(3)
    linkedList.append(4)
    linkedList.append(7)
    print(linkedList) // 3 -> 4 -> 7
    ```
- **`insert(_: Element, at: Int) -> Bool`**<br>

    - `parameter1`: 삽입할 노드가 가지는 데이터
    - `at`: 노드를 삽입할 인덱스
    - **`Return`**: 삽입 성공여부를 나타내는 `Bool` 타입의 데이터. 삽입에 성공하면 `true` 반환하고 삽입할 수 없는 인덱스를 제공하여 실패하면 `false`를 반환한다.

    원하는 위치에 데이터를 삽입하기 위해서 사용하는 메서드 입니다. **연결리스트의 시작 노드의 인덱스가 0인 것으로 다루어집니다.**
    ```swift
    linkedList.insert(0, at: 0) // true
    linkedList.insert(0, at: 2) // true
    linkedList.insert(0, at: 5) // true
    linkedList.insert(0, at: 100) // false
    print(linkedList) // 0 -> 3 -> 0 -> 4 -> 7 -> 0
    ```
- **`remove(_: Element) -> Int`**<br>
    - `parameter1`: 삭제할 노드가 가지고 있는 데이터
    - **`Return`**: 삭제한 노드의 개수

    특정 데이터를 삭제하기 위해서 사용하는 메서드 입니다. 해당 데이터를 가지고 있는 모든 노드를 삭제합니다. 삭제한 노드의 수를 반환합니다.

    ```swift
    print(linkedList) // 0 -> 3 -> 0 -> 4 -> 7 -> 0
    linkedList.remove(0) // 3
    print(linkedList) // 3 -> 4 -> 7
    ```
- **`remove(where: (Element) -> Bool) -> Int`**<br>
    - `where`: 삭제할 데이터의 조건을 제공하는 클로저
    - **`Return`**: 삭제한 데이터의 개수<br>

    특정 조건을 만족하는 데이터를 삭제하기 위해서 사용하는 메서드 입니다. 아래는 4보다 작은 데이터를 가진 노드를 삭제하는 코드입니다.
    ```swift
    print(linkedList) // 0 -> 3 -> 0 -> 4 -> 7 -> 0
    linkedList.remove{ $0 < 4 } // 4
    print(linkedList) // 4 -> 7
    ```
- **`remove(at: Int) -> Int`**<br>
    원하는 위치의 데이터를 삭제하기 위해서 사용하는 메서드 입니다. 인덱스는 시작노드를 0으로 지정합니다.
    - `at`: 삭제할 노드의 위치
    - **`Return`**: 삭제한 노드의 개수

    ```swift
    print(linkedList) // 0 -> 3 -> 0 -> 4 -> 7 -> 0
    linkedList.remove(at: 2) // true
    print(linkedList) // 0 -> 3 -> 4 -> 7 -> 0
    ```

- **`firstIndex(of: Element)`**<br>
    원하는 데이터가 존재하는 데이터가 연결리스트의 몇번째에 위치하는지 찾기 위한 메서드 입니다.
    - `of`: 찾고자 하는 데이터
    - **`Return`**: 데이터가 존재하는 첫번째 인덱스를 반환한다. 존재하지 않는다면 -1을 반환한다.
    ```swift
    print(linkedList) // 1 -> 3 -> 5 -> 3 -> 6 -> 7
    linkedList.append(7)
    print(linkedList.firstIndex(of: 7)) // 5
    ```