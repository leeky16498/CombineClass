import UIKit
import Combine

let words = "apple apple apple fruits fruits apple mango watermelon apple".components(separatedBy: " ").publisher // 컴포넌츠의 간격을 통해서 배열 제작이 가능하다.

words
    .removeDuplicates()
    .sink {
        print($0)
    }


//앞에서 두번 이상 연속적으로 선언되는 것에 대해서 다음과 같이 하나로 축약해준다. 오퍼레이터이다. 연속으로 중복되는 값을 자동삭제하고 제공해준다.

//출력결과
//apple
//fruits
//apple
//mango
//watermelon
//apple

