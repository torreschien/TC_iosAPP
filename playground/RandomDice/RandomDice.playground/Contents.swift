import Cocoa
import Foundation

//  MARK: - line
//  題目:模擬二個骰子連續丟500次，出現Snake eyes(二個骰字都出現1)的次數

//  建立計數器
var count:Int = 0

//  擲骰子500次
for _ in 1...500{
    //  建立兩顆骰子，並產生隨機數字 1 ~ 6
    let dice_1:Int = Int.random(in: 1...6)
    let dice_2:Int = Int.random(in: 1...6)
    if (dice_1 == 1 && dice_2 == 1){
        count += 1
    }
//    print("第一顆骰子 => \(dice_1)")
//    print("第二顆骰子 => \(dice_2)")
}
print("丟骰子 500 次中，Snake eyes 的次數: \(count) 次")
