import UIKit
import Combine

let numbers = (1...10).publisher

numbers.drop(while: {$0 % 3 != 0})
    .sink {
        print($0)
    }

//3부터 모든 항목이 들어오게 되는데, 이 이유는 조건이 true가 되는 순간부터 퍼블리셔가 동작되게 조건을 걸었기 떄문이다. 그 후에는 모든 항목이 조건을 거치지 않고 모두 들어오게 된다. 지금은 조건으로 3으로 나눈 나머지가 0인 순간부터 퍼블리셔 작동, 이렇게 했기 때문에 3부터는 무시한다.

let isReady = PassthroughSubject<Void, Never>()
let taps = PassthroughSubject<Int, Never>()

taps.drop(untilOutputFrom: isReady)
    .sink {
        print($0)
    }

(1...10).forEach {n in
    taps.send(n)
    
    if n == 3 {
        isReady.send()
    }
}
//이것은 다른 퍼블리셔의 조건에 따라서 퍼블리셔의 동작을 연결지을 수 있다.


//출력결과
//3
//4
//5
//6
//7
//8
//9
//10



//4
//5
//6
//7
//8
//9
//10
