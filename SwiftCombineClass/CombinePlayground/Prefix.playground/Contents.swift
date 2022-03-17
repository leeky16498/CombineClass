import UIKit
import Combine

let numbers = (2...10).publisher

numbers.prefix(6)
    .sink {
        print($0)
    }

numbers.prefix(while: {$0 < 3})
    .sink {
        print($0)
    }

//prefix를 사용하게 되면 퍼블리셔의 생산동작 횟수를 정해줄 수 있따. 이 또한 루프를 도는 건데 일종의 범위를 지정해주는 것이며, 이는 조건문을 통해서도 전달이 가능하다.

//출력결과
//2
//3
//4
//5
//6
//7

//2
