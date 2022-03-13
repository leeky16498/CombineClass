import UIKit
import Combine

func getPosts()  -> AnyPublisher<Data, URLError> {
    
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
            
    else {
        fatalError("there is error on URL")
    }
        
    return URLSession.shared.dataTaskPublisher(for: url)
            .map {$0.data}
            .eraseToAnyPublisher() // AnyPublisher는 모든 타입의 퍼블리셔를 래핑할 수 있는 넓적한 틀이다.
}

let cancellable = getPosts()
    .sink { _ in
        print("오우야")
    } receiveValue: { value in
        print(value)
    }
 // 이렇게 되면 네트워크의 결과값을 현재 받아온 상태이다.
