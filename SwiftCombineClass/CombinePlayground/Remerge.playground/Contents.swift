import UIKit
import Combine

let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<Int, Never>()

publisher1.merge(with: publisher2)
    .sink {
        print($0)
    }

publisher1.send(10)
publisher2.send(11)


publisher1.send(12)
publisher2.send(13)

//두개의 퍼브리셔를 합병하면 퍼블리셔의 구분없이 모두 센드값을 가져올 수 있다.

//출력결과
//10
//11
//12
//13

