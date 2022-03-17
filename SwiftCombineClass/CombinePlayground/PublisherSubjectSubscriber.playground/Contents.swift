import UIKit
import Combine

//currentValueSubject, PassthroughSubject

//currentValueSubject : 단일 값을 래핑하고 값이 변경될때마다 새로운 엘리먼트를 보내는 서브젝트이다.

let postOfficer = CurrentValueSubject<String, Never>("첫번째 소포는 시계입니다.")

let yeahSilver = postOfficer
    .sink {
        print($0)
    }

postOfficer.send("두 번쨰 소포는 맥북입니다.")
postOfficer.value = "세번째 소포는 애플천입니다."

//아래 있는 두개는 모두 예실버에게 전달되어 출력되는 항목들이다
//먼저 서브젝트에 센드를 통해 값을 전달해주거나, 밸류는 바꾸어줘도 잘 출력이 된다.

//PassThroughSubject : 구독자에게 데이터 및 요소를 퍼뜨려주는 친구이다.

let movingWalk = PassthroughSubject<String, Error>()

 // 현재 무빙워크는 설치했으나 사용하는 사람이 없기 때문에 초기값 세팅을 해주지 않은 상태이다.괄호안이 비어있으면 초기값이 없다.

//무빙위크에 사람을 실어서 나르는 중이다.
//이제 종착지에 다다르게 되면 확인을 해줘야 한다.

let subscriber = movingWalk
    .sink { completion in
        switch completion {
        case .finished:
            print("무빙워크 종료입니다.")
        case .failure(let error):
            print("무빙워크 개장시간이 종료되어 사용이 안됩니다.")
        }
    } receiveValue: { value in
        print(value)
    }

movingWalk.send("사람1")
movingWalk.send("사람2")
movingWalk.send("사람3")


movingWalk.send(completion: .finished)
//여기에서 아래에 명시한 코드는 실행되지 않는다. 조건을 통해서 문을 닫아주었기 떄문이다.

movingWalk.send("사람4")

//여기에서 큰 두가지 서브젝트의 다른점은. 1번 항의 경우는 
