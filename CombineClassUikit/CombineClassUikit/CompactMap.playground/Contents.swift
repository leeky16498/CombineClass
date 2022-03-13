import UIKit
import Combine

let strings = ["a","1.24","c","3.5","e"].publisher

strings.compactMap {
    Float($0)
}
.sink {
    print($0)
}

// 닐이 아닌 값들만 출력되게 된다. 문자열은 플롯으로 씌워줄 경우 값이 닐로 변경되므로 출력이 되지 않는다.
