import UIKit
import Combine

let queue = DispatchQueue.main // 메인스레드

let source = PassthroughSubject<Int, Never>()

var counter = 0

let cancellable = queue.schedule(after: queue.now, interval: .seconds(1)) {
    source.send(counter)
    counter += 1
}

let subscription = source
    .sink {
        print($0)
    }
// 위에 켄슬러블 상수에 담아주니 타이머가 작동하기 시작한다.
//디스패치큐를 통해서도 타이머 작동이 가능하다.
//제일 베스트는 타이머를 사용하는게 제일 베스트 같다.
