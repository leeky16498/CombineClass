import UIKit
import Combine

let numbers = (1...100).publisher

numbers.sink {
    print($0)
} receiveValue: {
    print($0)
}

numbers.ignoreOutput()
    .sink {
        print($0)
    } receiveValue: {
        print($0)
    }

//이렇게 이그노어 아웃풋을 사용하게 되면, 출력되는 모든 값을 무시하고, 작업 완료에 대한 결과만 리턴을 해주게 된다.
