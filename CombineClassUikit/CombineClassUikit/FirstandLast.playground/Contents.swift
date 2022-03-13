import UIKit
import Combine

let number = (1...9).publisher

number.first(where: {$0 % 2 == 0})
    .sink {
        print($0)
    }

//이렇게 퍼스트를 사용하게 되면, 조건을 만족하는 값들 중 가장 첫번째 엘리먼트를 리턴해주게 된다.

number.last(where: {$0 % 2 == 0})
    .sink {
        print($0)
    }

//라스트를 사용하면 조건을 만족하는 값의 가장 마지막 값을 리턴해주게 된다.


