import UIKit
import Combine

let strings = ["a","1.24","c","3.5","e"].publisher

strings.compactMap {
    Float($0)
}
.sink {
    print($0)
}

// nil이 아닌 값들에 대해서 출력을 해주게 된다.


//출력결과
//1.24
//3.5

