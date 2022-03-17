import UIKit
import Combine

// skip 50 values
// take next 20 values
// only take even numbers

let numbers = (1...100).publisher

numbers.dropFirst(50) // 먼저 앞에 50개의 항목을 날려버려
    .prefix(20) // 그 다음 20개의 항목만 가져온다.
    .filter { $0 % 2 == 0 }
    .sink {
        print($0)
    }

//고차함수 오퍼레이터들을 통해서 아주 깔끔하게 걸러내주었다. 지린다.



