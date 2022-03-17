import UIKit
import Combine

struct  Point {
    
    let x : Int
    let y : Int
    
}

let publisher = PassthroughSubject<Point, Never>()

publisher.map(\.x, \.y)
// 맵에서 지정한 스트럭트의 타입에 대한 키패스 별로 출력이 가능하다.
    .sink { x, y in
        print("x : \(x), y : \(y)")
    }

publisher.send(Point(x: 2, y: 10))
 //  맵 오퍼레이터에서 키패스를 통해서 받아올 값에 대해서 지정이 가능하다.


//출력결과
//x : 2, y : 10
