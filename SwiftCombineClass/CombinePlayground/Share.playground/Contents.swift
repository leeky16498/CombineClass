import UIKit
import Combine

var subscription3 : AnyCancellable? = nil

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    fatalError()
}


let request = URLSession.shared.dataTaskPublisher(for: url)
    .map(\.data)
    .print()
    .share()

let subscription1 = request
    .sink { _ in
        
    } receiveValue: {
        print($0)
    }

let subscription2 = request
    .sink { _ in
        
    } receiveValue: {
        print($0)
    }
 // 위처럼 쉐어기능을 쓰게되면, 생산되는 퍼블리셔를 하나에만 국한해서 순차적으로 나누어주는 것이 아니고, 2개의 섭스크립션에 동일하게 나누어주는 것이 가능하다. 쉽게 말하면 쉐어를 통해서 1개의 퍼블리셔에서 다수의 섭스크립터를 만들 수 있는 셈이다.


DispatchQueue.main.asyncAfter(deadline: .now()+3) {
    subscription3 = request.sink(receiveCompletion: { _ in
        
    }, receiveValue: {
        print($0)
    })
}
//지금처럼 이미 이벤트가 생성된 상태에서 위와 같은 코드를 생성하게 되면 섭스크립션3는 데이터를 받아오지 못한다. 이유는 위에서 웹요청이 생성된 후 이미 섭스크립션을 마치고 소요시간이 지나버렸기 때문이다. 쉽게 말하면 버스가 지나가버린 상황이다.



//출력결과
//receive subscription: (DataTaskPublisher)
//request unlimited
//receive value: (27520 bytes)
//27520 bytes
//27520 bytes
//receive finished
