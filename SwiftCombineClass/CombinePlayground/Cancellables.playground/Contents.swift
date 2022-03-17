import UIKit
import Combine

 // cancellable : 영어 뜻 그대로 취소될 수 있음! 액티비티나 액션이 취소되는 것을 지원하는 프로토콜이다.
//cancel()이라는 함수가 호출되면 할당된 모든 리소스가 해제된다.
//여기에서 AnyCancellable이란 반환형은 무엇을 의미하는가? 어떠한 액션이 취소될 때 제공된 클로저를 실행하는 typeErasingCancellable객체이다.
//AnyCancellable 인스턴스는 deinit될 때 자동으로 cancel()을 호출하여 액션 또는 액티비티를 종료해준다.

let subject = PassthroughSubject<String, Never>()
let subscriber = subject
    .sink {
        print($0)
    }

subject.send("데이터1")
subscriber.cancel()
subject.send("데이터2")

//위에서는 Cancel()을 명시적으로 호출했는데, 이러면 리소스가 전부 사라짐으로서 다음의 데이터2 는 전달되지 않는다.
//Cancellable에는 Store(in:이라는 메소드강 ㅣㅆ는데 이는 말그대로 인스턴스를 저장하는 것이다. 싱크에서 반환된 AnyCancellable을 Set의 형태로 저장해둔다.

let subject1 = PassthroughSubject<Int, Never>()

var bag = Set<AnyCancellable>()

subject1
    .sink {
        print($0)
    }
    .store(in: &bag)

subject1.send(1)
subject1.send(2)
//정상적으로 출력되고 있다.
//그러면 왜 캔슬러블을 써야하는가? 메모리의 누수 방지를 위해서이다. 그래서 귀찮더라도 인스턴스 해제를 위해서 사용하게 된다.
//캔슬러블은 구독자가 퍼블리셔에게서 파이프라인을 통해 받은 결과값들을 넣어두는 일종의 저장백이다. 도중에 캔슬되어도 남은 것들은 그대로 보관이 가능하다.
