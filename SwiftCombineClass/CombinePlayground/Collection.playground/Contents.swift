import UIKit
import Combine


["A", "B", "C", "D"].publisher.collect()
    .sink {
        print($0)
    }
//Collect() 오퍼레이터를 사용하게 되면, 출력되는 값들을 다시 배열로 재정렬해준다.

["A", "B", "C", "D"].publisher
    .sink {
        print($0)
    }
//인덱스 순서대로 출력을 수행한다.

["A", "B", "C", "D"].publisher.collect(2)
    .sink {
        print($0)
    }

 // 인덱스 순서대로 앞에 2개씩 을 모아 배열을 만들어준다.

//출력결과
//["A", "B", "C", "D"]
//A
//B
//C
//D
//["A", "B"]
//["C", "D"]
