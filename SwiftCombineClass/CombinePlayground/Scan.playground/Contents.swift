import UIKit
import Combine

let publisher = (1...10).publisher

publisher.scan([]) { number, value -> [Int] in
    number + [value]
}.sink {
    print($0)
}

//number : 스캔 안의 빈 컨테이너(스캔을 하게 되면 원하는 시작점에서부터 진행되는 메소드를 준비해줄 수 있다.
//value : 퍼블리셔에서 받아오는 밸류값.
//더해주고 출력하고, 더해주고 출력하고를 반복하게 된다. 언제까지? 마지막 퍼블리셔 값까지.


//출력결과
//[1]
//[1, 2]
//[1, 2, 3]
//[1, 2, 3, 4]
//[1, 2, 3, 4, 5]
//[1, 2, 3, 4, 5, 6]
//[1, 2, 3, 4, 5, 6, 7]
//[1, 2, 3, 4, 5, 6, 7, 8]
//[1, 2, 3, 4, 5, 6, 7, 8, 9]
//[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
