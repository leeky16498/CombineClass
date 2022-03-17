import UIKit
import Combine

//var subscription3 : AnyCancellable? = nil

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    
    fatalError()
}

let subject = PassthroughSubject<Data, URLError>()

let request = URLSession.shared.dataTaskPublisher(for: url)
    .map(\.data)
    .print()
    .multicast(subject: subject)

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

let subscription3 = request
    .sink { _ in
        
    } receiveValue: {
        print($0)
    }

request.connect()
subject.send(Data())

//share 하면 받아온 것을 가져다가 자동으로 뿌려줬다.
//multicast를 하게되면, 중간에 문 하나를 만드는 것이다. 그래서 먼저 패스스루 섭젝을 해줘야 한다.
//그리고 난 후, 멀티태스크 타입으로 선정된 퍼블리셔와 구독을 연결해주고, 커넥트를 호출한다. 그러면 파이프라인이 모두 연결이 된 것이다. 그리고 나서 패스스루에 데이터를 밀어넣어주면 작동을 하게 된다.
