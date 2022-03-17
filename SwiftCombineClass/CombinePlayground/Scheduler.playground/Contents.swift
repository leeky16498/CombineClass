import UIKit
import Combine

//scheduler는 클로저의 실행시기와 방법을 정의하는 프로토콜이다. 쉽게 말하면 언제 어디서 task가 실행될 것인지를 정의하는 것이다.

let subject = CurrentValueSubject<String, Never>("메인 스레드에서 작동되는 서브젝트")

let subscriber = subject
    .sink {
        print($0)
    }
//서브젝트의 항목에 접근하는 구독자 설정을 해주고 진행을 해주게 되면. scheduler는 default로 element가 생성된 스레드와 동일한 스레드에서 작동이 된다. 그래서 백그라운드 스레드에서 원소를 보내거나 할 경우 응답이 없다.

let subject1 = PassthroughSubject<Int, Never>()

let subscriber1 = subject1
    .sink {
        print($0)
    }

subject1.send(1)

DispatchQueue.global(qos: .background).async {
    subject1.send(2)
}
//일단 지금 되는게 이상한다. 원래 이런식으로 백그라운드 스레드에서 데이터를 전송하려고 하면 받아지지 않는다. 그래서 우리는 스케줄러를 동일한 스레드에서 작업을 한다. 따라서 우리는 스케줄러를 스위칭해주는 오퍼레이터를 사용하게 된다.

let publisher = [1].publisher

publisher.map { _ in
    print(Thread.isMainThread) // true
    //퍼블리셔를 메인스레드에 설정했으므로 트루 출력
}
.receive(on: DispatchQueue.global())
//이후 값을 수신할 곳을 백그라운드로 변경해주었다.
.map {
    print(Thread.isMainThread) // false
    //이 아래는 모두 백그라운드 스레드에서 설정된다.
}
.sink {
    print(Thread.isMainThread) // false
}
 
//subscribe(on:)이란 오퍼레이터는 연산수행을 위한 스케줄러를 지정하는 역할을 한다.

let subscriber = Just(1).subscribe(on: DispatchQueue.global())
    .map { _ in
        print(Thread.isMainThread)
    }
    .sink {
        print(Thread.isMainThread)
    }
