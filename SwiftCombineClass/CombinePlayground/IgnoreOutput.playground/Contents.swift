import UIKit
import Combine

let numbers = (1...100).publisher

numbers.sink {
    print($0)
} receiveValue: {
    print($0)
}

numbers.ignoreOutput()
    .sink {
        print($0)
    } receiveValue: {
        print($0)
    }

//이렇게 이그노어 아웃풋을 사용하게 되면, 출력되는 모든 값을 무시하고, 작업 완료에 대한 결과만 리턴을 해주게 된다.


//출력결과
//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//11
//12
//13
//14
//15
//16
//17
//18
//19
//20
//21
//22
//23
//24
//25
//26
//27
//28
//29
//30
//31
//32
//33
//34
//35
//36
//37
//38
//39
//40
//41
//42
//43
//44
//45
//46
//47
//48
//49
//50
//51
//52
//53
//54
//55
//56
//57
//58
//59
//60
//61
//62
//63
//64
//65
//66
//67
//68
//69
//70
//71
//72
//73
//74
//75
//76
//77
//78
//79
//80
//81
//82
//83
//84
//85
//86
//87
//88
//89
//90
//91
//92
//93
//94
//95
//96
//97
//98
//99
//100
//finished
//finished
