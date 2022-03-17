import UIKit
import Combine

let subscription = Timer.publish(every: 1.0, on: .main, in: .common)
    .autoconnect()
//    .sink {
//        print($0)
//    }
// // 이렇게 해주게 되면 현재시간을 표시해주게 된다.

//    .sink { value in
//        print("timer fired")
//    }
//이렇게 해주면 1초마다 다음과 같은 프린트를 수행한다.

let subscription1 = Timer.publish(every: 1, on: .main, in: .common)
    .autoconnect()
    .scan(3) { counter, _ in
        
// _ 여기에는 Date가 들어가게 되는데 파라미터 명을 생략해주었다.
//scan안의 0를 1로 바꾸어주면 해당 값에서부터 타이머 값이 호출된다.
//scan(3)해주면 4 5 6 7 8 9 이런식으로 진행된다.
        
        counter + 1
    }
    .sink {
        print($0)
    }

// 이렇게 해주면 1, 2, 3, 4, 5 이런식으로 타이머 클래스를 통해서 출력된다.

