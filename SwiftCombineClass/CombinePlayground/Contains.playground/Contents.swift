import UIKit
import Combine

let publisher = ["A", "B", "C", "D"].publisher

publisher
    .contains("C")
    .sink {
        print($0)
    }
 // 컨테인 오퍼레이터는 퍼블리셔의 포함여부를 불리언 값으로 리턴해서 던져주는 친구이다.

//출력결과
//true

