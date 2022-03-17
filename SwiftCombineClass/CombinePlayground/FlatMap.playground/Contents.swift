import UIKit
import Combine

struct School {
    
    let name : String
    let numberOfStudents : CurrentValueSubject<Int, Never>
    
    init(name : String, numberOfStudents : Int) {
        self.name = name
        self.numberOfStudents = CurrentValueSubject(numberOfStudents)
    }
}

let citySchool = School(name: "MNIT", numberOfStudents: 100)

let school = CurrentValueSubject<School, Never>(citySchool)

//school.sink {
//    print($0)
//}

school.flatMap {
    $0.numberOfStudents
}.sink {
    print($0)
}
// 다음처럼 플랫맵을 통해서 원하는 파이프 라인을 구체적으로 선언해주게 된다면,

let townSchool = School(name: "Town", numberOfStudents: 45)
//이상하게도 섭스크리션이 파이어 된다. 싱크를 사용하고 있기 때문이다.

school.value = townSchool

citySchool.numberOfStudents.value += 1
townSchool.numberOfStudents.value += 100

//이렇게 새로운 타운스쿨 밸류를 생성해서 스쿨의 밸류를 대체해주면, 정상적으로 작동하게 된다.
//기존에 싱크를 사용하면 통째로 데이터가 다 출력되지만, 플랫맵을 사용하게 되면 데이터 그 자체 값에 대해서 조작이 가능하다.

//출력결과
//100
//45
//101
//145

