import UIKit
import Combine

let publisher = ["A", "B", "C", "D"].publisher

publisher
    .first()
    .sink {
        print($0)
    }
 // "A"를 출력해준다. 가장 첫번째 값을 출력해준다.

publisher
    .first(where: {"Cat".contains($0)} )
    .sink {
        print($0)
    }
// "C"를 출력해준다. "Cat"에 포함된 값의 첫번째를 출력해주기 때문이다.

publisher
    .last()
    .sink {
        print($0)
    }
 // D를 출력해주게 된다.
