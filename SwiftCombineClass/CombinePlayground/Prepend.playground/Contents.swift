import UIKit
import Combine

let numbers = (1...5).publisher
let publisher1 = (500...1000).publisher

numbers
    .sink {
        print($0)
    }

numbers.prepend(101,102)
    .sink {
        print($0)
    }

numbers
    .prepend(-1,-2)
    .prepend([45, 567])
    .prepend(publisher1)
    .sink {
        print($0)
    }
//prepend 오퍼레이터를 쓰게되면 퍼블리셔가 생산해내는 파라미터 앞에 위처럼 미리 선언이 가능해진다.
//prepend에 별도의 퍼블리셔를 대입해서 사용하는 것도 가능하다.

//출력결과(가장 마지막 예시)
//45
//567
//-1
//-2
//1
//2
//3
//4
//5

