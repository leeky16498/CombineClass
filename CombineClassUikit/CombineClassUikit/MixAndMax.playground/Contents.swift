import UIKit
import Combine

let publisher = [1, -45, 3, 45, 100].publisher

publisher
    .min()
    .sink {
        print($0)
    }
 // 퍼블리셔의 최소값을 리턴하게 된다.

publisher
    .max()
    .sink {
        print($0)
    }
 // 이렇게 하면 최대값을 리턴해주게 된다.
