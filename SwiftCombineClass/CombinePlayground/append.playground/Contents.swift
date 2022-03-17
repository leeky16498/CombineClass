import UIKit
import Combine

let numbers = (1...10).publisher

numbers
    .append(11, 12)
    .sink {
        print($0)
    }
 // append는 배열과 비슷한데, 이렇게 되면 가장 뒤에서 추가적으로 호출되는 엘리먼트를  더해줄 수 있다.

let postOffce = (1100...1110).publisher

numbers
    .append(postOffce)
    .sink {
        print($0)
    }
//퍼블리셔 자체로도 합치는 것이 가능해진다.


//출력결과
//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//11
//12
//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//1100
//1101
//1102
//1103
//1104
//1105
//1106
//1107
//1108
//1109
//1110
//
