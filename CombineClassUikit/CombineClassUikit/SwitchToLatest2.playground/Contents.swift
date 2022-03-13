import UIKit
import Combine

let images = ["Houston", "Denver", "Seattle"]
var index = 0

func getImage() -> AnyPublisher<UIImage?, Never> {
    
    return Future<UIImage?, Never> { promise in
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            promise(.success(UIImage(named: images[index])))
        }
    }.print()
    .map {
        $0
    }
    .receive(on: RunLoop.main) // 메인 스레드로 받아온다.
    .eraseToAnyPublisher()
} // 이미지를 다운로드하는 함수를 구현해보는 중이다.


let taps = PassthroughSubject<Void, Never>()

let subscription = taps.map { _ in getImage() }
    .print()
    .switchToLatest() // 가장 최근의 퍼블리셔가 있다면 그것으로 대체해주는 오퍼레이터이다.
    .sink {
        print($0)
    }

//houston
taps.send()

//denver
DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
    index += 1
    taps.send()
}

//seattle
DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
    index += 1
    taps.send()
}
