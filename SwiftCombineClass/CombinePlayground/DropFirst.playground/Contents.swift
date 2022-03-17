import UIKit
import Combine

let numbers = (1...10).publisher

numbers.dropFirst(5)
    .sink {
        print($0)
    }

//드랍 퍼스트는 앞의 5개 밸류를 생략하고 그 다음부터 시작하겠다는 오퍼레이터이다.
//이 후, 싱크를 통해서 파이프라인을 연결하고 메소드를 호출한다.

//출력결과
//6
//7
//8
//9
//10

