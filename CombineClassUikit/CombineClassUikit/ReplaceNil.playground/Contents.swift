import UIKit
import Combine

["A", "B" , nil, "C"].publisher.replaceNil(with: "*")
    .sink {
        print($0)
    }
//리플레이스 닐을 사용하게 되면, 옵셔널 밸류로 바꿔서 뱉어주게 된다.

["A", "B", nil, "C"].publisher.replaceNil(with: "*")
    .sink { // 이렇게 해주면 닐 값을 뱉어줄 때는 별표로 대신해서 뱉어주게 된다.
        print($0!) // 옵셔널 언래핑이 하여 출력하도록 세팅해줬다.
    }

["A", "B" , nil, "C"].publisher.replaceNil(with: "*")
    .map {
        $0!
    }
    .sink {
        print($0)
    }
//이렇게 해도 맵을 통해서 해제하고 난 후 리턴이 가능하다.
