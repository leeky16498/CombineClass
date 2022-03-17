import UIKit
import Combine

let runLoop = RunLoop.main // main은 메인스레드를 의미한다.

let subscription = runLoop.schedule(after: runLoop.now, interval: .seconds(2), tolerance: .milliseconds(100)) {
        print("Timer fired") // 2초마다 타이머가 끝났다고 출력된다.
}

runLoop.schedule(after: .init(Date(timeIntervalSinceNow: 3.0))) {
    subscription.cancel()
}
//지금부터 3초 뒤에 런루프 타이머의 종료를 선언해주었기 때문에, 생산을 멈추고 끝내게 된다.



//출력결과
//Timer fired
//Timer fired(2초 후)

