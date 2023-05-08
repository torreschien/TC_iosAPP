import Foundation

struct Exam {
    var chinese: Int
    var english: Int
    var math: Int
    var total: Int { (chinese + english + math) / 3
    }
}

var score = Exam(chinese: 76, english: 85, math: 74)
score.total

