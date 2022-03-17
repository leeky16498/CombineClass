import UIKit
import Combine

let publisher = ["he", "C", "D"].publisher

publisher
    .output(at: 1)
    .sink {
        print($0)
    }
 // 인덱스 2번 값이 출력되게 된다. 일종의 인덱스를 추적해서 출력해준다고 생각하면 편하다.

publisher
    .output(in: 0..<2)
    .sink {
        print($0)
    }
 // 인덱스의 범주만큼 출력해주게 된다.
