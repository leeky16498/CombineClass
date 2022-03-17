import UIKit
import Combine

let queue = DispatchQueue.main // 메인스레드

let source = PassthroughSubject<Int, Never>()

//소스는 인트값을 전달받는 패스스루서브젝트이다.

var counter = 0

let cancellable = queue.schedule(after: queue.now, interval: .seconds(1)) {
    source.send(counter)
    counter += 1
}

//캔슬러블에 값을 담아서 소스에 1초마다 counter += 1의 메소드를 호출해준다.
// 1, 2, 3, 4, 5 이런식으로 값이 타이머 마냥 흘러가게 된다.

let subscription = source
    .sink {
        print($0)
    }

// 위에 켄슬러블 상수에 담아주니 타이머가 작동하기 시작한다.
// 디스패치큐를 통해서도 타이머 작동이 가능하다.
// 제일 베스트는 타이머를 사용하는게 제일 베스트 같다.
