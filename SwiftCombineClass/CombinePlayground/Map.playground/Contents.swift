import UIKit
import Combine

//맵은 첫 타입의 객체를 받아서 타입을 변환해주는 역할을 한다.

let formatter = NumberFormatter()
formatter.numberStyle = .spellOut

[123, 45, 67].publisher.map {
    formatter.string(from: NSNumber(integerLiteral: $0)) ?? ""
}
.sink {
    print($0)
}
//맵은 감싸고 있는 컨테이너 안에 값들의 형태와 형질을 변화시킬때 사용한다.
//중간에 위치한 맵을 통해서 번호의 타입을 스트링계열의 타입으로 새롭게 변경시켰다.

//출력결과
//one hundred twenty-three
//forty-five
//sixty-seven


