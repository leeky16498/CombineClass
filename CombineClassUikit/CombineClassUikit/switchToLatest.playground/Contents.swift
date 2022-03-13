import UIKit
import Combine

let publisher1 = PassthroughSubject<String, Never>()
let publisher2 = PassthroughSubject<String, Never>()

let publishers = PassthroughSubject<PassthroughSubject<String, Never>, Never>()
 // parent 퍼블리셔를 생성해준다.

publishers
    .switchToLatest() // 이것을 통해서 부모 퍼블리셔가 무엇을 확인할 것인가 지정해줄 수 있다.
    .sink {
        print($0)
    }

publishers.send(publisher1)

publisher1.send("Hello1-value1")
publisher1.send("Hello1-value2")

// 이게 뭐냐면, 패싱퍼블리셔 안에 패싱퍼블리셔를 재작업 해준것이다.
publisher2.send("Hello2 - value2")
//이렇게 하면 캐치가 되지 않는다., 왜냐면 위으 부모 퍼블리셔가 퍼블리셔2를 옵저빙하고 있지 않기 때문이다. 그래서 이렇게 하면 이제 본다.

publishers.send(publisher2)
publisher2.send("Hello2 - value2") // 이렇게 부모에게 먼저 옵저빙해주고 실행하면 실행이 된다.
