import UIKit
import Combine
let publisher = (1...20).publisher

publisher
    .print("debugging") // 퍼블리셔에서 받아오는 밸류를 실시간으로 출력해준다. 받아오고 출력하고 받아오고 출력하고, 이렇게 진행하게 된다.
    .sink {
        print($0)
    }

// 프린트를 통해서 콤바인에서 전반적으로 일어나는 로직을 모니터링 할 수 있다.
