import UIKit
import Combine
let publisher = (1...20).publisher

publisher
    .print("debugging") // 퍼블리셔에서 받아오는 밸류를 실시간으로 출력해준다. 받아오고 출력하고 받아오고 출력하고, 이렇게 진행하게 된다.
    .sink {
        print($0)
    }

// 프린트를 통해서 콤바인에서 전반적으로 일어나는 로직을 모니터링 할 수 있다.


//출력결과
//debugging: receive subscription: (1...20)
//debugging: request unlimited
//debugging: receive value: (1)
//1
//debugging: receive value: (2)
//2
//debugging: receive value: (3)
//3
//debugging: receive value: (4)
//4
//debugging: receive value: (5)
//5
//debugging: receive value: (6)
//6
//debugging: receive value: (7)
//7
//debugging: receive value: (8)
//8
//debugging: receive value: (9)
//9
//debugging: receive value: (10)
//10
//debugging: receive value: (11)
//11
//debugging: receive value: (12)
//12
//debugging: receive value: (13)
//13
//debugging: receive value: (14)
//14
//debugging: receive value: (15)
//15
//debugging: receive value: (16)
//16
//debugging: receive value: (17)
//17
//debugging: receive value: (18)
//18
//debugging: receive value: (19)
//19
//debugging: receive value: (20)
//20
//debugging: receive finished
