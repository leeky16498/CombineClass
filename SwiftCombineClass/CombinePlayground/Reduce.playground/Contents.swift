import UIKit
import Combine

let publisher = [1, 2, 3, 4, 5, 6, 7].publisher

publisher
    .reduce(0) { accumulator, value in
        print("Accumulator = \(accumulator), value = \(value)")
        return accumulator + value
    }
    .sink {
        print($0)
    }

 // 리듀스는 퍼블리셔의 항목들에 대해서 수식을 정해줌으로서 타입이 정해진 하나의 것으로 리턴을 해줄 수 있다.
//지금은 1 ~ 7 까지 모두 더해주었다.
