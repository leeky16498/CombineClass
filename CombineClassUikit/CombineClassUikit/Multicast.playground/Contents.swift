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
