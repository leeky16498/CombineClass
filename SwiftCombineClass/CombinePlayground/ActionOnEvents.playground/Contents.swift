import UIKit
import Combine

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    fatalError()
}

let request = URLSession.shared.dataTaskPublisher(for: url)

request
    .handleEvents(receiveSubscription: { _ in
        print("Subscription Received")
    }, receiveOutput: { _ in
        print("Receive output")
    }, receiveCompletion: { _ in
        print("received completion")
    }, receiveCancel: {
         print("received Cancel")
    }, receiveRequest: { _ in
        print("received request")
    }) // 콤바인이 작동하지 않을 때 다음과 같은 핸들이벤트를 통해서 어디에서 문제가 나고 있는지 파이프라인을 체크해 볼 수 있다.
    .print()
    .sink { completion in
        print(completion)
    } receiveValue: { data, response in
        print(data)
    }

