import UIKit
import Combine

let empty = Empty<Int, Never>()

empty.sink {
    print($0)
} receiveValue: {
    print($0)
}

 // finished 를 뱉어낸다.

empty.replaceEmpty(with: 1)
    .sink {
        print($0)
    }
 // 1을 뱉어내게 된다.


//출력결과
//finished
//1

