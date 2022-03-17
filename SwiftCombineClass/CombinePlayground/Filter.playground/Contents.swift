import UIKit
import Combine

let numbers = (1...20).publisher

numbers.filter{ $0 % 2 == 0}
    .sink {
        print($0)
    }


//출력결과
//2
//4
//6
//8
//10
//12
//14
//16
//18
//20
