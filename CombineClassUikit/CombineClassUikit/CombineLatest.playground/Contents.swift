import UIKit
import Combine

let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<String, Never>()

 // 서로의 타입이 같지 않은 퍼블리셔 두개를 생성해 주었다.


publisher1
    .combineLatest(publisher2)
    .sink {
        print("p1 = \($0), p2  = \($1)")
    }

publisher1.send(1)
publisher2.send("하이")
 //컴바인 레이티스트의 경우 다음과 같이 튜플값을 통해서 들어오게 된다.

publisher2.send("바이루바이루")
//퍼블리셔의 값을 변경시켜줌에 따라서도 값이 유동성있게 변화한다.
//zip과 다른 부분은 짝이 맞지 않으면, 우선한 값에 대해서 튜플을 생성해주게 된다.
