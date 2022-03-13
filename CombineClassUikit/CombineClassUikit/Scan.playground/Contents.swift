import UIKit
import Combine

let publisher = (1...10).publisher

publisher.scan([]) { number, value -> [Int] in
    number + [value]
}.sink {
    print($0)
}

//number : 스캔 안의 빈 컨테이너
//value : 퍼블리셔에서 받아오는 밸류값.
//더해주고 출력하고, 더해주고 출력하고를 반복하게 된다. 언제까지? 마지막 퍼블리셔 값까지.
