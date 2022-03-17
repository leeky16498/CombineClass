import UIKit
import Combine

let publisher = [1, 2, 3, 4, 5, 6, 7].publisher

publisher
    .allSatisfy {
        $0 % 2 == 0
    }
    .sink { allEven in
        print(allEven)
    }

let publisher1 = [2, 4, 6, 8].publisher

publisher1
    .allSatisfy {
        $0 % 2 == 0
    }
    .sink {
        print($0)
    }
 // allSatisfy 오퍼레이터는 모든 항목에 대한 조건을 확인하고, 하나라도 틀리면 false를 리턴한다. 지금은 모두 2의 배수인 경우 트루, 하나라도 아니면 폴스를 리턴해주었다.

//출력결과
//false
//true

