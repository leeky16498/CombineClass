import UIKit
import Combine

let numbers = (1...10).publisher

numbers
    .append(11, 12)
    .sink {
        print($0)
    }
 // append는 배열과 비슷한데, 이렇게 되면 가장 뒤에서 호출되는 엘리먼트를 추가해줄 수 있다.

let postOffce = (1100...1110).publisher

numbers
    .append(postOffce)
    .sink {
        print($0)
    }
//퍼블리셔 자체로도 합치는 것이 가능해진다.
