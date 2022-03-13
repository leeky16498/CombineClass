import UIKit
import Combine

let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<String, Never>()

publisher1.zip(publisher2)
    .sink {
        print("p1 = \($0), p2 = \($1)")
    }

publisher1.send(1)
publisher1.send(2)
publisher2.send("a")


//다음을 보게되면 서로를 합쳐주지만 짝이 맞지 않는 경우에, 튜플이 생성되지 않는다.
//튜플의 생성은 선언된 순서에 따라서 순차적으로 짝을 만들게 된다.

