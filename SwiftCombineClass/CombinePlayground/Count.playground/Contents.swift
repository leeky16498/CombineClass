import UIKit
import Combine

let publisher = ["A","B", "C","D"].publisher
let publisher1 = PassthroughSubject<Int, Never>()

publisher
    .count()
    .sink {
        print($0)
    }
 // 퍼블리셔의 갯수를 셈해서 리턴해주게 된다.

publisher1
    .count()
    .sink {
        print($0)
    } // 이벤트가 완전히 종료되어있지 않기 때문에 출력이 이루어지지 안흔ㄴ다.

publisher1.send(1)
publisher1.send(completion: .finished)
 //이렇게 패스스루를 해주게 되면, 컴플리션을 통해 완성이 되면서 정상적으로 값 출력을 완료하게 된다.
// 지금은 퍼블리셔1 안에 센드해준 1 값 1개만 있으므로 갯수 1을 리턴해주게 된다.
