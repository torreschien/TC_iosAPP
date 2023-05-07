//  MARK: -💡date: 2023-03-06💡 *
///  *** 駝峰式命名法 ***
//  🔴注意：所有的型別會使用『大寫開頭』，其餘的命名為『小寫開頭』🔴
//  Int、String、Bool

import UIKit // 導入使用者介面
var greeting = "Hello, playground"      //  assign 設值 (String型別)
//  列印訊息到除錯(debug)視窗
print("Hello, world!!")
print(greeting)
greeting = "Test 1234"
print(greeting)

///  ⭐️============ 單一值 (Simple Values) ============⭐️
///  ✨------ 使用型別推測機制 (type inference) 來宣告常數及變數 ------✨
//  var 變數:可變 variable
//  用 var 宣告一塊可變動的記憶體空間，但此空間較為耗用記憶體
var myVariable = 42     //  宣告變數為 "Int型別"
print(myVariable)
myVariable = 50         //  變動為另外一個 Int 的值
print(myVariable)
//  let 常數：不可變 constant
//  用 let 宣告一塊不可變動的記憶體配置空間，此空間較節省記憶體
let myConstant = 42     //  宣告常數為 Int 型別，常數經過第一次設值後不可變動
print(myConstant)
//myConstant = 60       //error:Cannot assign to value: 'myConstant' is a 'let' constant

///  ✨------ 宣告常數及變數時明確指定型別 ------✨
let implicitInteger = 70        //  使用型別推測機制(沒有明確指定型別，推測為 Int 型別，在64位元的作業系統上為 Int64、32位元的作業系統上為 32Int)
                                //  IPhone5 後為 64位元
let implicitDouble = 70.0       //  使用型別推測機制(沒有明確指定型別，推測為 Double 型別)
let explicitDouble:Double = 70  //  不使用型別推測機制，明確指定型別為 "Double"

//  常數的直不需要再編譯時就知道，但必須要明確指定型別 (Type)
let explicitFloat:Float         //  明確指定型別為 "Float"
//print(explicitFloat)  //error: constant 'explicitFloat' used before being initialized
explicitFloat = 3.88            //  常數第一次設值
//explicitFloat = 2.99  //error: immutable value 'explicitFloat' may only be initialized once
print(explicitFloat)

//  ** 練習1 ** |宣告一個常數，明確指定型別為 Float，並指定其值為 4
let explicitFlaot1:Float = 4
print(explicitFlaot1)
var explicitFlaot2:Float = 3.9999999
print(explicitFlaot2)
explicitFlaot2 = 3.999999
print(explicitFlaot2)
//  Float 型別的浮點數小數只會列印七位數
explicitFlaot2 = 2.88888846789
print(explicitFlaot2)
//  Double 型別的浮點數小數只會列印十六位數
var explicitDouble1:Double = 2.888_888_467_889_666_666
print(explicitDouble1)

var explicitInt1:Int8
Int8.min
Int8.max
explicitInt1 = 100
//explicitInt1 = -129   //error: integer literal '-129' overflows when stored into 'Int8'

var explicitInt2:Int64
Int64.min
Int64.max
explicitInt2 = 922337203685477

var explicitInt3:UInt64
UInt64.min
UInt64.max

///  *** Swift 沒有自動轉型 ***
//  值永遠不會隱含轉換為另一種類型。如果您需要將值轉換為不同的型別，請明確建立所需類型的實體 (instance of type)
let label = "The width is " // String 型別
let width = 94              // Int 型別
//  把常數 width 從 "int型別" 轉變為 "string型別"
let widthLabel = label + String(width) // "The width is " + "94"
///  ** 練習2 ** |試著移除上面最後一行轉回字串型別的語法，你會看到什麼錯誤?
//  Binary operator '+' cannot be applied to operands of type 'String' and 'Int'

//  operator:運算子/運算符號 | operand:運算元(素)
//  explicitInt1 + explicitInt2 //error: Binary operator '+' cannot be applied to operands of type 'Int8' and 'Int64'
let newInt1 = Int64(explicitInt1) + explicitInt2
//let newInt2 = explicitInt1 - Int8(explicitInt2)
//  🔴 注意 Int 型別運算的最大值上限是否溢位 (overflow)，溢位時會有執行階段錯誤 (execution interrupted/runtime error) 🔴

//  有更簡便的方法來執行字串中文字的插入，使用 \() 語法來插入，也可以用此語法來執行
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

///  ** 練習3 ** |使用\()來執行浮點數的運算，其中包含跟某人的問候訊息
//  浮點數的運算:計算 BMI 體重(公斤) / 身高平方(公尺)
//  程式中的加減乘除: + - * /(取商數) %(取餘數)

let myName = "Torres"
let myHeight = 170.0 , myWeigth = 70.0
let newHeight = myHeight / 100
let bmi = myWeigth / (newHeight*newHeight)
//print("\(name) 的身高\(myHeight)公分，體重\(wegith)公斤，BMI為 \(bmi)")
//print("\(myName) 的身高\(myHeight)公分，體重\(myWeigth)公斤，BMI為 \(String(format: "bmi = %.2f",bmi))")

"\(myName)的BMI是:\(bmi)"
String(format:"%@ 你的BMI是:%.2f", myName, bmi)
///  %@ 返回的字串

//  MARK: - 💡date: 2023-03-08💡 *
//  以三個雙引號(""")來標示字串，字串的中間可以保留換行和單個雙引號(")的呈現
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""
print(quotation)

///  ⭐️============= 復合值 (compouid Value) / 集合型別 (collection type) ============⭐️
/*
(小括號) [中括號] {大括號}
陣列 (array)、集合 (set) 和字典 (dictionary)

Swift 提供了三種主要的集合型別:陣列、集合和字典，用於儲存值的集合。
陣列:"有序"的值集合 (帶從 0 開始算起的索引值)。
集合:是唯一值的"無序"集合
字典:是鍵值關聯的"無序"集合
array:有序 - 有索引值 | set:無序 - 無索引值(唯一) | dictionary:無序 - 關鍵key(唯一) - 對應Value
*/
/*
 所有 Swift 的基礎型別 (String, Int, Double, Bool) 預設是可以雜湊的 (hashable)
 所以放置於無序的集合之中 (set)，或使用於字典的 (key)
 列舉的 case 如果沒有關聯值 (associated value)，帶原始值或沒有原始值時
 預設也可以雜湊
 */

///  ✨------ 使用 [] 建立陣列 (array) 和字典 (dictionary) ------✨

///  ****** 陣列 ******
//  宣告並建立陣列，此陣列為字串陣列，型別為 [String]
//  陣列最後一個元素可以出現逗號
var fruits = ["strawberries", "limes", "tangerines"]
//  確認陣列的筆數
fruits.count
//  陣列名稱[索引值]讀取陣列的值
fruits[0]
fruits[1]
fruits[2]
//fruits[3] //error:不可以存取不存在的索引值，會觸發執行階段錯誤

//  變新陣列的值
fruits[1] = "grapes"

//  在陣列的最後位置加上一個新的陣列元素
fruits.append("orange")

//  在指定的索引值位置 (參數二) 插入一個新的陣列元素
fruits.insert("apple", at: 2)

//  在指定的索引值位置 (參數二) 移除一個陣列元素
fruits.remove(at: 2)

/*
可用以下寫法來提示已刪除的元素
let deleted = fruits.remove(at: 2)
print("\(deleted)被刪除")
*/

//  移除陣列中的第一個元素
fruits.removeFirst()
fruits

//  移除陣列中的最後一個元素
fruits.removeLast()
fruits

//  移除陣列中的所有元素 (以下兩種用法)
fruits.removeAll()
//fruits = []
fruits

//  ****** 字典 ******
//  字典最後一個元素可以出現逗號
//  宣告並建立字典，此字典型別為 [String:String] | "key": "value"
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
 ]

//  確認字典的比數
occupations.count

//  字典查詢 -> 使用 key 來查詢 value，會回傳該型別的包裝值 (String?)
//  print 函式可以看到包裝盒，但會出現警告
let query1 = occupations["Malcolm"]
//print(query1)
//  使用 ! 來拆包，才可以與其它字串做動作
query1! + "Test"
print(query1!)

occupations["Kaylee"]

//  若查詢的 key 不存在字典中，會回報空值 (nil/null)
occupations["Torres"]

/* !!! 拆開空包裝會觸發執行階段錯誤，也許會當機，需注意 !!!
var query2 = occupations["Torres"]
query2
query2 = occupations["Kaylee"]
query2
query2 = nil    // 將包裝盒清空 (只適用於選擇性型別)
query2
print(query2)
*/

//  當 key 不存在時，設定其值會在字典中 "新增" 一組 『鍵值配對』
occupations["Jayne"] = "Public Relations"
occupations


//  當 key 存在時，設定其值會在字典中 "修改" 一組 『鍵值配對』的的值值
occupations["Kaylee"] = "Engineer"
occupations

//  刪除字典中的一組鍵值配對 (key-value pair) (以下兩種方法)
//occupations.removeValue(forKey: "Jayne")
//occupations
let deletedDic = occupations.removeValue(forKey: "Jayne")
print("\(deletedDic!)被刪除")

//  當刪除的 Key 不存在時，回報 nil
let deletedDic1 = occupations.removeValue(forKey: "Torres")
occupations

//  移除字典中的所有元素 (以下兩種用法)
occupations.removeAll()
//occupations = [:]
occupations

//  >>>>>> 補充:宣告空陣列與空字典，需給予型別類型 <<<<<<
///  < 方法一 >
var emptyArray: [String] = []
var emptyDictionary: [String: Float] = [:]

///  < 方法二 >
var emptyArray1 = [String]()
var emptyDictionary1 = [String: Float]()

///  < 方法三 (泛型) >
var emptyArray2 = Array<String>()
var emptyDictionary2 = Dictionary<String,Float>() // 🔴 注意字典需使用 , 號 🔴

emptyArray.append("test")

///  ⭐️============ 流程控制 (Control Flow) ============⭐️
//  使用 if 和 switch 來建立條件判斷式，使用 for-in、while、repeat-while 來建立迴圈
//  條件判斷式和迴圈中的小括號 () 是可以省略的
//  實作範圍 (body) 的大括號 {} 不可以省略

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0 // 團隊的加權統計分數
//  以 for-in 會圈列出陣列 (in 之後為陣列)
//  core 為常數 (原函式定義為 let)，若需變動必須主動加上 var
//  for var score in individualScores ...
for score in individualScores {
    if score > 50 {
        teamScore += 3 // teamScore = teamScore + 3
    } else {
        teamScore += 1 // teamScore = teamScore + 1
    }
}
print(teamScore)
/* C 與 Objective-C 寫法，Swift 目前已不用
for ( var i = 0; i < individualScores.count; i++){
    if (score > 50) {
        teamScore += 3 // teamScore = teamScore + 3
    } else {
        teamScore += 1 // teamScore = teamScore + 1
    }
}
*/
//  >>>>>> 以下補充:以 for-in 迴圈"正反向"列出陣列 <<<<<<
//let rrr = individualScores.reversed()
print("****** 空白行 ******")
for score in individualScores.reversed() {
    print(score)
}
//  迴圈正轉 1 (每次減一) 包含上標 (e.g.:  陣列值最高值))
print(">>>>>> 迴圈正轉 1 ( 每次 +1 ) 包含上標 >>>>>>")
for i in 0...individualScores.count-1 {
   print("i = \(i), value = \(individualScores[i])")
}
//  迴圈正轉 2 (每次加一) 不含上標 (e.g.: 陣列值最高值前１個))
print(">>>>>> 迴圈正轉 2 ( 每次 +1 ) 不含上標 >>>>>>")
for i in 0..<individualScores.count {
   print("i = \(i), value = \(individualScores[i])")
}
//  迴圈正轉 3 (每次加二) 包含上標
print(">>>>>> 迴圈正轉 3 ( 每次 +2) 包含上標 >>>>>>")
for i in stride(from: 0, through: individualScores.count-1, by: 2) {
    print("i = \(i), value = \(individualScores[i])")
}
//  迴圈正轉 4 (每次加二二) 不含上標
print(">>>>>> 迴圈正轉 4 ( 每次 +2 ) 不含上標 >>>>>>")
for i in stride(from: 0, to: individualScores.count, by: 2) {
    print("i = \(i), value = \(individualScores[i])")
}
//  迴圈反轉 1 (每次減一) 包含上標
print("<<<<<< 迴圈反轉 1 ( 每次 -1 ) 包含上標 <<<<<<")
for i in (0...individualScores.count-1).reversed() {
   print("i = \(i), value = \(individualScores[i])")
}
//  迴圈反轉 2 (每次減一) 不含上標
print("<<<<<< 迴圈反轉 2 ( 每次 -1 ) 不含上標 <<<<<<")
for i in (0..<individualScores.count).reversed() {
   print("i = \(i), value = \(individualScores[i])")
}
//  迴圈反轉 3 (每次減二) 包含上標
print("<<<<<< 迴圈反轉 3 ( 每次 -2 ) 包含上標 <<<<<<")
for i in stride(from: individualScores.count-1, through: 0, by: -2) {
    print("i = \(i), value = \(individualScores[i])")
}
//  迴圈反轉 4 (每次減二) 不含上標
print("<<<<<< 迴圈反轉 4 ( 每次 -2 ) 不含上標 <<<<<<")
for i in stride(from: individualScores.count-1, to: -1, by: -2) {
    print("i = \(i), value = \(individualScores[i])")
}
//  >>>>>> 以上補充:以 for-in 迴圈"正反向"列出陣列 <<<<<<

///  ⭐️============ 選擇性型別 (Optional Type) ============⭐️
/*  可以同時使用 if 和 let 來與可能不存在值(nil)協同運作，這一類的值呈現為選擇值(Optional Value)。
    選擇值可能有值，也可能為空值(nil)。可以在型別之後加上問號(?)來表示其值為選擇性，可以為空值。
    不是選擇性型別不得設定為空值(nil)。
 */

var optionalString: String? = "Hello"   // 選擇性型別必須明確宣告
print(optionalString!)
print(optionalString == nil)
// Prints "false"

///  ✨------ 選擇值的檢測 ------✨ *** 有值才拆包，否則有當幾危險 ***
///  < 方法一 > 自行檢查包裝盒內是否有值

if optionalString == nil {  //  包裝盒為空值時
    print("optionalString 為空包裝")
}
else {
    print("optionalString 包裝盒內有值: \(optionalString!)")
}

if optionalString != nil {  //  包裝盒不為空值時
    print("optionalString 包裝盒內有值: \(optionalString!)")
}
else {
    print("optionalString 為空包裝")
}

///  < 方法二 > 以選擇性綁定語法檢查包裝盒的值 (optional binding) 語法檢查包裝盒內的值
var optionalName: String? = "John Appleseed"    // 有包裝
//optionalName = nil
var greeting1 = "Hello!"    // 沒包裝
//greeting1 = nil // error: 'nil' cannot be assigned to type 'String'
greeting1 = ""  // 非字串的包裝只能設定空字串

//  此處為選擇性綁定 (optional binding) 語法，if let 包裝盒內有值會自動拆包並綁定常數 name
if let name = optionalName {    //  一但綁定成功 name 會拿到自動拆封過後的值
    greeting1 = "Hello, \(name)"
}
else {      //  包裝盒為空時，選擇性綁定則失敗
    greeting1 = "Hello"
}

///  ** 練習四 ** | 更改 optionalName 為 nil。你會收到什麼問候？如果 optionalName 為 nil 時，增加一個 else 區段設定
optionalName = nil
if let name = optionalName {
    greeting1 = "Hello, \(name)"
}
else {
    greeting1 = "Hello"
}

//  MARK: -💡date: 2023-03-13💡 *
///  < 方法三 > 以 ?? 方式來提供預設值 (Nil-Coalescling Operator 空值聚合運算)
/*
    簡化語法 : a ?? b
    完整語法 : a != nil ? a! : b  // a 是不是不為空? 是，不空 : 不是，是空
*/
//  簡化語法
var nickname: String? //= nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"
//  完整語法
"Hi \(nickname != nil ? nickname! : fullName)"
nickname = "ABC"
"Hi \(nickname != nil ? nickname! : fullName)"

///  < 方法四 > 為 < 方法二 > 的簡化版
        //  方法 < 方法二 > 完整語法
if let mySpecialName = nickname {
   greeting1 = "Hello, \(mySpecialName)"
}
else {      //  包裝盒為空時，選擇性綁定失敗
    greeting1 = "Hello, \(fullName)"
}

        //  以下為 < 方法四 > 新版簡化語法 (綁定的常數名稱與包裝盒名稱相同時可採用此語法)
if let nickname {  //   if let nickname = nickname
    print("Hey, \(nickname)")
}
    
///  < 補充 > if 語法
    //  一段式的 if 的條件判斷式
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
    //  兩段式的 if-else 的條件判斷式
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

    //  三段式的 if-else 的條件判斷式
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

//  ✨------ Switch-case 檢測語法 ------✨
//  switch 支持任何類型的資料和各種比較操作 (< > = <= >= != ==) 它們不限於整數和相等性測試
let vegetable = "red pepper"
vegetable.hasPrefix("red")          //  判斷字首
vegetable.hasSuffix("pepper")       //  判斷字尾
switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
        //  break        // case 沒有隱含的掉落風險，一但進入 case 會自動 break
        //  fallthrough  // 隱含掉落，會進入到下一個 case 運算
    case "cucumber", "watercress":      //  等同於 or 運算
        print("That would make a good tea sandwich.")
        //  break        //  *** Swift 語法不需要加 " break " 來跳脫 ***
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    default:        //  等同於 if 判斷式的 else 段
        print("Everything tastes good in soup.")
}
//  celery 芹菜, cucumber 小黃瓜, watercress 西洋菜

///  ** 練習五 ** | 嘗試刪除預設的 case，你會得到什麼錯誤?
//  error:Switch must be exhaustive(詳盡)
//  當 case 無法涵蓋所有狀況時，不可以省略預設 case (default段)
//  當 case 可以涵蓋所有狀況時，可以省略預設 case (default段)
//  ** 只有列舉型別 (Enum) 可以辦到省略 default 段 **

///  < 補充 > switch 支援任何類型的資料和各種比較操作
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String        //  沒有初始值的字串
switch approximateCount {
    case 0:
        naturalCount = "no"
    case 1..<5:     //  不含上標，介於 0 ~ 4 之間
        naturalCount = "a few"
    case 5..<12:
        naturalCount = "several"
    case 12..<100:
        naturalCount = "dozens of"
    case 100..<1000:
        naturalCount = "hundreds of"
    default:
        naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

///  < 補充 >
var aDouble = Double.pi     //  3.14159
switch aDouble {
    case Double.pi:
        print("圓周率")
    case let dbl where dbl >= 0:
        print("浮點數為正數")
    case let dbl where dbl < 0:
        print("福點數為負數")
    default:        //  🔴 注意:此段依照現狀的條件，沒有被執行到的機會 🔴
        break       //  可增加 break 直接離開
}

//  for-in 迴圈也可以列出字典，同時取的 key 和 value，因為字典為無序的集合，所以 for-in 迴圈列出字典時為任意順序
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],      //  Prime 質數數列，只有 "1 與 本身數" 可以被整除
    "Fibonacci": [1, 1, 2, 3, 5, 8],    //  Fibonacci 費式數列，前兩數相加的合
    "Square": [1, 4, 9, 16, 25, 36],    //  Square 平方數列，x^
]
var largest = 0     //  記錄所有數列的最大數
//  for-in 迴圈列出字典 (外迴圈)
for (_, numbers) in interestingNumbers {
    //  for-in 迴圈列出陣列 (內迴圈)
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

///  ** 練習六 ** | 將 for-in 迴圈中的 _ 替換為 "常數名稱"(kind)，並追蹤最大的數字出現在哪一種數列
//  最大數:36 出現在 squrae 數列
let interestingNumbers1 = [
    "Prime": [2, 3, 5, 7, 11, 13],      //  Prime 質數數列，只有 "1 與 本身數" 可以被整除
    "Fibonacci": [1, 1, 2, 3, 5, 8],    //  Fibonacci 費式數列，前兩數相加的合
    "Square": [1, 4, 9, 16, 25, 36],    //  Square 平方數列，x^
]
largest = 0             //  紀錄所有數列的最大數 (先歸零)
var largestKind = ""    //  ++ 紀錄最大數對應的數列名稱
for (kind, numbers) in interestingNumbers1 {
    for number in numbers {
        if number > largest {
            largest = number
            largestKind = kind  //  ++ 替換最大數時，同時替換最大數列的名稱
        }
    }
}
print("最大數:\(largest)，出現在 \(largestKind) 數列")

///  < 補充 > 對應行數 244 的陣列值
//let individualScores = [75, 43, 103, 87, 12]
//let newArray = individualScores.enumerated()
teamScore = 0 // 團隊的加權統計分數歸零
for (index, score) in individualScores.enumerated() {
    //  score 為常數，若需變動必須主動加上 var
    //  [(0,75), (1,43), (2,103), (3,87), (4,12)]
    if score > 50 {
        teamScore += 3      //  teamScore = teamScore + 3
        print("第 \(index + 1) 次: \(score)，加權分數: \(teamScore)")
    } else {
        teamScore += 1      //  teamScore = teamScore + 1
        print("第 \(index + 1) 次: \(score)，加權分數: \(teamScore)")
    }
}
//print(teamScore)

///  ✨------ while 迴圈 ------✨
//  先檢測條件的 while 迴圈
var n = 2
var i = 0
while n < 100 {
    n *= 2      //  n = n * 2
    i += 1
    print("第 \(i) 次迴圈的 n 累計值: \(n)")
}
print("迴圈結束 n 值為: \(n)")

///  ✨------ repeat while 迴圈 ------✨
//  後檢測條件的 repeat-while 迴圈 (就是傳統程式語言的 do-while)
var m = 2
i = 0
repeat {
    m *= 2
    i += 1
    print("第 \(i) 次迴圈的 m 累計值: \(m)")
} while m < 100
print("迴圈結束 m 值為: \(m)")

//  for-in 迴圈可以透過 ..< 或 ... 來建立索引的範圍
var total = 0
for i in 0..<4 {
    total += i
}
print(total)

///  ⭐️============ 函式和閉包 (Function and Closures) ============⭐️
///  ✨------ 函式 Function ------✨
//  宣告函式 (declare function)
//  使用 func 關鍵字來宣告函式，在函式名稱之後使用小括號()定義餐數列表 (parameter list)，使用 -> 來指定韓式的回傳型別 PS.參數列表包含參數名稱及型別，以冒號區隔
//  func 函式名稱(參數: 型別) -> 回傳型別
//  { } 之間為函式的實作 (implementation / body)
func greet(person: String, day: String) -> String {     //  參數列表預設為常數
    return "Hello \(person), today is \(day)."          //  return 為函式的最後一行
}
//  呼叫函式 (call function / execute function)，以小括號傳數引數 (argument)，傳入引數時會留下 "引數標籤" (label for argument)，函式若有回傳值時可以忽略回傳值
//  greet(person: "Bob", day: "Tuesday")                 // 忽略函式的回傳值
let greeting2 = greet(person: "Bob", day: "Tuesday")     //  接取函式的回傳值
print(greeting2)

///  ** 練習七 ** | 刪除 day 參數，增加一個參數 (lunch) 在問候語中包含今天的中午特餐
//  參數列表預設為常數
func greet1(person: String, lunch: String, price: Int) -> String {
//  return 為函式的最後一行
    return "嗨 \(person), 今日中午特餐是 \(lunch), 只要 $\(price) 塊."
}
let greeting3 = greet1(person: "Torres", lunch: "雞腿飯", price: 100)
print(greeting3)
//  ⬆️⬆️⬆️⬆️⬆️⬆️ 預設情況下，函式使用其參數名稱作為引數標籤
//  ⬇️⬇️⬇️⬇️⬇️⬇️ 非預設情況，在參數名稱之前可以給一個自行定義的引數標籤，或者以 _ 符號來表示不保留引數標籤
func greet2(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
//  以 small talk 語法呼叫函式
greet2("John", on: "Wednesday")

///  ✨------ 元組/元素組合 Tuple ------✨
//  使用元組來產生復合值，可以當作函式的多重回傳值，元組的元素可以透過名稱或編號兩種方式來取存取值
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    //  設定最小、最大、總和的初始值
    var min = scores[0]             //  此範例呼叫時為5
    var max = scores[0]             //  此範例呼叫時為5
    var sum = 0

    for score in scores {           //  比現在最大值大
        if score > max {            //  就取代最大值
            max = score
        } else if score < min {     //  比現在最小值小
            min = score             //  就取代最小值
        }
        sum += score                //  累加每一個元素的值
    }

    return (min, max, sum)          //  回傳最小、最大、總和的值
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
//  用 tuple 名稱存取元素值
statistics.min
statistics.max
print(statistics.sum)
//  用 tuple 編號存取元素值
statistics.0
statistics.1
print(statistics.2)

///  ✨------ 巢狀函式 ------✨
//  函式的實作中可以包含其它函式，巢狀函式可以存取宣告其函式外部的變數，可以使用巢狀函式來組織較長或複雜的程程式式碼
//  定義巢狀函式
func returnFifteen() -> Int {
    var y = 10
    func add() {    //  內部的巢狀函式用於封裝複雜邏輯 (沒有回傳值)
        y += 5      //  此處為複雜邏輯
    }
    //  自己呼叫內部的巢狀函式
    add()
    return y
}
//  呼叫巢狀函式
returnFifteen()

//  🔴 函式是一級型別 (Functions are a first-class type)，這意味著一個函式可以回傳另一個函式當作它的回傳值 🔴
func makeIncrementer() -> ((Int) -> Int) {      //  此函式回傳一個韓式，其型別為帶一個 Int 參數，回傳值為 Int 的函式
    //  此函式符合回傳的函式型別
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
//  呼叫函式
var increment = makeIncrementer()
increment(7)

//  函式的參數 (parameter) 也可以定義為一個函式型別，呼叫此函式時。對應的引述 (argument) 必須自行撰寫的實作
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
//  準備 hasAnyMatches 的第二個引數 (自訂判斷是否小於 10 的邏輯)
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
//  準備 hasAnyMatches 的第一個引數
var numbers = [20, 19, 7, 12]
///  < 方法一 > 正式呼叫 hasAnyMatches 函式
//  以命名函式傳入自定義實作
hasAnyMatches(list: numbers, condition: lessThanTen)

//  MARK: -💡date: 2023-03-20💡 *
///  ✨------ 閉包 Closures ------✨
///  < 方法二 > 以 "匿名函式" 傳入自定義實作
//  閉包 (closures) 就是沒有名稱的函式 (即匿名函式)
let result1 = hasAnyMatches(list: numbers, condition: {
    (number: Int) -> Bool in      //  參數列表及回傳值收納在實作的{}之內，以 in 關鍵字區隔實作
    return number < 10
})
print(result1)

///  < 方法三 > 以 "尾隨閉包" (trailing closure) 函式傳入自定義實作
let result2 = hasAnyMatches(list: numbers) {
    number in
    return number < 10
}
print(result2)

///  < 方法四_1 > 傳入閉包時，省略參數列表及 in 關鍵字，參數在實作中以 $0... 的索引值方式存取
let result3 = hasAnyMatches(list: numbers) {
    print($0)
    return $0 < 10      //  如果實作區塊內多於一行，且閉包有回傳值時，不可省略 return 關鍵字
}
print(result3)

/// < 方法四_2 >
let result4 = hasAnyMatches(list: numbers) {
    $0 < 10             //  如果實作區塊內只有一行，且必包有回傳值時，可以省略 return 關鍵字
}
print(result4)

///  ✨------ 針對陣列每一個圓入的對應處理方法 (map 方法) ------✨
//var numbers = [20, 19, 7, 12]
//  map()
///  < 方法一 > 以命名函式傳入自定義實作
func myTransfor(number: Int) -> Int {
    return 3 * number
}
/* 想像 map 函式內部的處理
 func mapxxx(abd: (Int) -> (Int) -> [In] {
    var newArray = [Int]()
    for number in numbres {
        newArrary.append(abc(number))
    }
    return newArray
}
*/
numbers.map(myTransfor)

///  < 方法二 > 以 "匿名函式" 傳入自定義實作
numbers.map({ (numbers: Int) -> Int in
    return 3 * numbers
})

/*
  官方範例
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
*/
 
///  < 方法三 > 以 "尾隨閉包" (trailing closure) 函式傳入自定義實作
numbers.map { numbers in
    return 3 * numbers
}

//  將原陣列處理成字串陣列
numbers.map { number in
    return "\(number)"
}

///  < 方法四_1 > 傳入閉包時，省略參數列表及 in 關鍵字，參數在實作中以 $0... 的索引值方式存取
numbers.map {
    $0 * 3
}

///  ** 練習八 ** | 重寫閉包將陣列中所有的奇數改成 0
//處理前 : [20, 19, 7, 12]
//處理後 : [20, 0, 0, 12]
//a / b 取商數，a % b 取餘數
numbers.map { numbers in
    if numbers % 2 == 0 {   // 偶數
        return numbers
    } else {                // 奇數
        return 0
    }
}


///  ✨------ 陣列的排序方法 ( sort ) ------✨
//  sorted() 陣列的預設排序方法，只能由小到大排序 (排序到新陣列)
numbers.sorted()
numbers             //  原陣列順序不變

//  sorted(by:) 陣列的"自訂"排序方法 (排序到新陣列)
numbers.sorted { num1, num2 in      //  小到大
    return num1 < num2
}
numbers.sorted { num1, num2 in      //  大到小
    return num1 > num2
}

//  陣列的元素為字典 ( 假設字典只有三個 key:abc, def, xyz)
let dicArray = [["abc":123, "def":456], ["abc":789, "def":555, "xyz":888], ["def":666]]
//  自訂排序邏輯，以三個 key 分別兩本字典中取出對應的 value，比較其 value 來進行排序 (排序到新陣列)
dicArray.sorted { dic1, dic2 in
    var value1 = 0
    var value2 = 0
    if let xyz = dic1["xyz"] {
       value1 = xyz
    } else if let def = dic1["def"] {
       value1 = def
    } else if let abc = dic1["abc"] {
        value1 = abc
    }
    
    if let xyz = dic2["xyz"] {
       value2 = xyz
    } else if let def = dic2["def"] {
       value2 = def
    } else if let abc = dic2["abc"] {
        value2 = abc
    }
    return value1 > value2
}


//  官方範例
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)
//  Prints "[20, 19, 12, 7]"

//  sort() 陣列的預設排序方法，只能由小到大排序 (排序到新陣列)
numbers.sort()
numbers

dicArray
/*
自訂排序邏輯，以三個 key 分別兩本字典中取出對應的 value，比較其 value 來進行排序 (排序原陣列)
dicArray.sort { dic1, dic2 in
    var value1 = 0
    var value2 = 0
    if let xyz = dic1["xyz"] {
       value1 = xyz
    } else if let def = dic1["def"] {
       value1 = def
    } else if let abc = dic1["abc"] {
        value1 = abc
    }

    if let xyz = dic2["xyz"] {
       value2 = xyz
    } else if let def = dic2["def"] {
       value2 = def
    } else if let abc = dic2["abc"] {
        value2 = abc
    }
    return value1 > value2
}
*/

///  ⭐️============ 物件和類別 (Objects and Classes) ============⭐️
///  ⭐️============ 類別和實體 (Classes and Instance) ============⭐️
//  物件導向
 
//  『類別』 (class) 用來組合生活上對應實際事務的概念
//  使用 class 關鍵字，之後跟著類別名稱來建立類別
//  類別中的 "屬性" (property) 宣告與『常數』或『變數』宣告的編寫方式相同，只是它存在於類別的定義中
//  類別中的 "方法" (method) 宣告方式與『函式』相同，只是它存在於類別的定義中
//class Shape {       //  定義形狀類別  🔴 (注意：類別為型別的一種，命名以大寫開頭) 🔴
//  🔴 注意：當類別的所有屬性都有初值時，類別會 "自動" 得到一個不帶參數的 "初始化方法" (initializer) 🔴
//    //  類別的屬性：形狀有幾邊
//    var numberOfSides = 0
//    //  類別的方法：列印方法
//    func simpleDescription() -> String {
//        return "A shape with \(numberOfSides) sides."
//    }
//}
 
///  ** 練習九 ** | 增加一個常數屬性，並且增加另一個帶參數的方法
class Shape1{       //  定義形狀類別
    var numberOfSides = 0
    //  增加一個常數屬性(唯讀)
    let dimension = "3D"
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    //  增加一個帶參數的方法
    func sharpWithHeight(height: Int) -> String {
        return "這是\(dimension)模型，高度\(height)公分"
    }
}
//  以變數來記錄配置的記憶體空間
//  以類別名稱加 () 來執行 "自動" 取得的不帶參數的 "初始化方法" (initialize)，取得類別實體 (instance of a class)
var shape1 = Shape1()
//  使用 . (點語法)來存取實體的屬性
shape1.numberOfSides        //  讀取屬性值
shape1.numberOfSides = 7    //  儲存屬性值
shape1.numberOfSides
shape1.dimension
//  常數屬性經過第一次設值後就不可變動
//shape1.dimension = "test"       //error:Cannot assign to property: 'dimension' is a 'let' constant
//  使用 . (點語法) 執行實體的方法
var shapeDescription = shape1.simpleDescription()
shape1.sharpWithHeight(height: 5)

//  🔴類別的實體(instance)在傳統上被稱為物件（object）。🔴
//  🔴然而，Swift的結構體 (structure) 和類別 (class) 在功能上比其他語言更接近。🔴
//  🔴所以使用實體 (instance) 來描述類別或結構的物件。🔴



class NamedShape {
    //  🔴 注意：當類別的任何一個屬性缺少初始值時，類別中必須自行定義 "初始化方法" (initializer) 🔴
    //error:Class 'NamedShape' has no initializers
    var numberOfSides: Int = 0
    var name: String
    
    //  以 init 關鍵字來定義 "初始化方法" (initializer)
    //  此為指定『初始化方法』 (designated initializer)
    init(name: String) {    //  以缺少值的屬性來定義參數列表
        //  初始化方法的實作，為缺值的屬性提供初始值
        self.name = name    //  存取屬性時，可加上 "self" 關鍵字，但名稱與參數名稱混淆時，self 不可省略
    }
    //  便利初始化方法
    //  ‼️規則二：便利初始化方法必須呼叫同一個類別中的另一個初始化方法 (可以是指定初始化方法或是便利初始化方法)
    //  ‼️規則三：便利初始化方法最終必須呼叫到指定初始化方法
    convenience init() {
        //  只能呼叫自己的初始化方法
        self.init(name: "Unknown")
    }
    //  使用 "deinit" 關鍵字定義『反初始化方法』
    deinit {    //  🔴 注意：此方法不可以主動呼叫 🔴
        //  執行一些清理作業，在即將被從記憶體釋放之前
        print("\(name)被釋放")
    }

    func simpleDescription() -> String {
       return "A shape with \(numberOfSides) sides."
    }
}

//  🟡實驗🟡 | 執行類別的初始化方法
var namedShape = NamedShape(name: "Test")
namedShape.numberOfSides
namedShape.name
namedShape.simpleDescription()

var namedShape1:NamedShape? = NamedShape(name: "Test1")
//namedShape1 = nil
//  已"選擇性串連" (optional chaining) 語法呼叫屬性和方法，會得到選擇值
let sides = namedShape1?.numberOfSides              // Int?
namedShape1?.name
let description = namedShape1?.simpleDescription()  // String?
//  清除配置記憶體空間
namedShape1 = nil

//   如果需要在類別實體被 "釋放" (deallocated) 時，執行一些清理作業，可以使用 "deinit" 關鍵字定義『反初始化方法』(deinitializer)

///  ✨------ 類別的繼承 (Inheritance) ------✨
//  子類別 (subclass) 要在其類別名稱後面，以冒號來指定繼承的父類別 (superclass)
//  子類別會繼承父類別的屬性和方法，但不包含初始化方法和反初始化方法
//  類別可以不需要繼承來自任何標準的根類別 (補充：如果是 OBJC 類別必須至少繼承自 NSObject)
//  因此您可以根據需要包含或省略父類別
class Square: NamedShape {      // Square 類別繼承來自 NamedShape (Square 為子類別，NamedShape 為父類別)
    
    /* 從父類別繼承過來的的屬性
     var numberOfSides: Int = 0
     var name: String
     */
//  單邊長度屬性
    var sideLength: Double
    //  ‼️規則一：指定初始化方法只能呼叫父類別的指定初始化方法
    //  宣告子類別的指定『初始化方法』 (designated initializer)
    init(sideLength: Double, name: String) {
        //  ❕Step1 & Step2 為第一階段
        //  ☑️Stpe1. 先為自己的屬性設定初值
        self.sideLength = sideLength
        //  ☑️Step2. 再為父類別缺值的屬性設定初始值  (呼叫父類別的指定初始化方法)
        super.init(name: name)
        //  ❕Step3 為第二階段
        //  ☑️Step3. 進一步為屬性調整初始值
        numberOfSides = 4
    }
    //  宣告子類別的第二個指定『初始化方法』
    init() {
        //  ✅Stpe1. 先為自己的屬性設定初值
        self.sideLength = 1
        //  ✅Step2. 再為父類別缺值的屬性設定初始值  (呼叫父類別的指定初始化方法)
        super.init(name: "Unknown")
        //  ✅Step3. 進一步為屬性調整初始值
        numberOfSides = 4
    }
    //  計算正方形面積的方法
    func area() -> Double {
        return sideLength * sideLength
    }
    
//  覆寫父類別的相同方法 (替換父類別的實作)，必須加上 "override" 關鍵字，在函式之前
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let abc = Square()
abc.numberOfSides
abc.sideLength
abc.sideLength = 3
let test = Square(sideLength: 5.2, name: "my test square")
//test.area()
//test.simpleDescription()

//  ‼️便利初始化方法
//  ‼️規則一 ➡️(line:953)：指定初始化方法只能呼叫父類別的指定初始化方法
//  ‼️規則二 ➡️(line:906)：便利初始化方法必須呼叫同一個類別中的另一個初始化方法 (可以是指定初始化方法或是便利初始化方法)
//  ‼️規則三 ➡️(line:907)：便利初始化方法最終必須呼叫到指定初始化方法
 
//  ❕兩階段初始化
//  ❕Step1 ➡️(line:957)：為第一階段
//  ❕Step2 ➡️(line:959)：為第一階段
//  ❕Step3 ➡️(line:962)：為第二階段


///  ** 練習十 ** | 建立一個繼承自 NamedShape 的子類別 Circle，它以半徑 (radius) 和名稱 (name)
//  作為其初始化的參數，在 Circle 類別中時做一個 area() 方法計算圓面積 (pi * r平方)
class Circle: NamedShape {
    
    var radius: Double

    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 1
    }

    func area() -> Double {
        return Double.pi * radius * radius
    }

    override func simpleDescription() -> String {
        return "圓型：\(name), 半徑：\(radius), 圓面積\(area())"
    }
}
let circle = Circle(radius: 3.99, name: "my test square")
circle.area()
circle.simpleDescription()

//  MARK: - 💡date: 2023-04-10💡 *
///  ✨------  計算屬性(computed property) vs 儲存屬性 (stored property) ------✨
//  除了簡單的儲存屬性 (stored property) 外，由 getter 和 setter 定義計算數性

class EquilateralTriangle: NamedShape {
    /* 從父類別繼承過來的的屬性
     var numberOfSides: Int = 0
     var name: String
     */
    var sideLength: Double = 0.0    //  單邊長度
    
    //  初始化方法必須為缺值的『儲存屬性』準備初始值
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    //  計算屬性：總長度屬性 ( 🔴 注意：計算屬性本身不能存值，其值是靠取值段和設值段的運作) 🔴
    var perimeter: Double {
        //  取值段
        get { return 3.0 * sideLength }
        //  設值段 (固定使用 newValue 常數接取設定值)
        //  回算單邊長度
        set { sideLength = newValue / 3.0 }
    }
    
    //  ** 補充練習 ** | 以唯讀計算屬性 (get-only property) 來計算三角型面積
    //  計算三角型面積公式：設 ∆ABC 的三邊長分別為 a, b, c 且 s =
    //  (a + b + c) / 2，則 ∆ABC = √ S(S - a)(S - b)(S - c) 開根號函式：sqrt()
    var area: Double {
        get {
            let s = perimeter / 2
            return sqrt(s*(s-sideLength)*(s-sideLength)*(s-sideLength))
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
    //  覆寫父類別的屬性，為父類別的屬性加上屬性觀察器(繼承的儲存屬性)
    override var name: String {
        didSet {
            print("name的didSet")
            sideLength = 999
        }
    }
}
//  測試
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)       //  運作計算屬性的取值
// Prints "9.3"
triangle.perimeter = 9.9
print(triangle.sideLength)      //  運作計算屬性的設值
// Prints "3.3000000000000003"
triangle.area

triangle.name = "ABC"
triangle.name

//  ‼️ 如果沒有設值段，則為唯讀的『計算屬性』
/* //  計算屬性：總長度屬性 (🔴 注意：計算屬性本身不能存值，其值是靠取值段和設值段的運作) 🔴
 縮減 1
 var perimeter: Double {
     get { return 3.0 * sideLength }
  }
 縮減 2
 var perimeter: Double {
    return 3.0 * sideLength
  }
 
 */

///  ✨------ 屬性觀察器 (Property Obertvers) ------✨
/*
 可以在以下位置添加屬性觀察器 (willSet 和 didSet)
 1.定義的儲存屬性
 2.繼承的儲存屬性
 3.繼承的計算屬性 (不可以是自己定義的計算屬性)
 
 如果不需要計算屬性，但仍需要提供在設置新值之前 (執行 willSet 段) 和之後 (執行 didSet 段) 運行的程式碼，
 請使用 willSet 和 didiSet 在"儲存屬性"之中。
 只要儲存屬性的值在初始化方法之外發生更動 (即產生類別實體之後更動)，提供的代碼就會運行。
 例如:下面的類別會確保其三角形的邊長始終與其正方形的邊長相同。
 */

class TriangleAndSquare{
    //  等邊三角形的儲存屬性
    var triangle: EquilateralTriangle{
        //  設置新值之前執行    //  將等邊三角形的單邊長度設定給正方形的單邊長度
        willSet {
            square.sideLength = newValue.sideLength
            print("調整等邊三角形的單邊長度和等邊三角形一致")
        }
        //  設置新值之後執行
        didSet {}
    }
    //  正方形的儲存屬性
    var square: Square {
        //  設置新值之前執行    //  將正方形的單邊長度設定給等邊三角形的單邊長度
        willSet { triangle.sideLength = newValue.sideLength }
    }
    init(size: Double, name: String) {
        //  初始化時，正方形宇等邊三角形同時使用 size 進行設定單邊長度，已經確保兩個形狀的單邊長度一致
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
        //  🔴 注意：以上兩行準備儲存屬性時，不會執行 willSet 和 didSet 🔴
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
// Prints "10.0"
print(triangleAndSquare.triangle.sideLength)
// Prints "10.0"

//  重新初始化 square 屬性時，會觸發 willSet 或 didSet
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
triangleAndSquare.square.sideLength
print(triangleAndSquare.triangle.sideLength)
// Prints "50.0"

triangleAndSquare.triangle = EquilateralTriangle(sideLength: 300, name: "larger triangle")

 
//  test
class MyEquilateralTriangle:EquilateralTriangle{
    //  為繼承的計算屬性添加屬性觀察器
    override var perimeter: Double{
        willSet { print("perimeter的willSet") }
    }
}
var myEquilateralTriangle = MyEquilateralTriangle(sideLength: 5, name: "TTT")
myEquilateralTriangle.sideLength
myEquilateralTriangle.perimeter

/*
 如果在類別的型別上使用選則性型別，不論在 nil 或非 nil 的情況下，整個選擇性串連的表達式會回傳為選擇值
 (如果整個選擇性串連的過程，在任一環節發生 nil，後面的串連動作會被直接忽略)
*/
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
//  🔴 注意：整個選擇性串連的表達式會回傳為選則值 🔴
let sideLength = optionalSquare?.sideLength
let description1 = optionalSquare?.simpleDescription()

let sideLength2 = optionalSquare!.sideLength
let description2 = optionalSquare!.simpleDescription()

//  選擇性串連配合選擇性綁定 (optional binding) 語法可以自動拆封
if let side = optionalSquare?.sideLength {
    //  綁定成功時會自動拆封
    print(side)
}

///  ⭐️============ 列舉和結構 (Enumeratoins and Structures) ============⭐️
///  ✨------ 列舉 (Enumerations) ------✨
//  使用 enum 關鍵字建立列舉型別，與類別和所有其他命名型別一樣，列舉也可以定義相關的方法 (method)
//  定義列舉

//  撲克牌牌數的列舉
//  此列舉帶 Int 的原始值 (RawValue)，原始值預設從 0 開始
enum Rank: Int, CaseIterable {
    //  列舉的屬性，一般稱為列舉成員
    //  圖象牌
    case ace = 1    //  改變起算位置，從 1 開始
    //  數字牌，2 ~ 10
    case two, three, four, five, six, seven, eight, nine, ten
    //  圖象牌，11 ~ 13
    case jack, queen, king

    //  列舉的實體方法 inetance
    func simpleDescription() -> String {
        switch self {
                //  當列舉型別已知時，Rank 可以省略
            case Rank.ace:
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
                //  2 ~ 10 回傳這邊
            default:
                return "\(self.rawValue)"
                //  return String(self.rawValue)
        }
    }
}

///  取得列舉實體 < 方法一 >
let ace = Rank.ace
ace.simpleDescription()
let aceRawValue = ace.rawValue

var aRank = Rank.five
aRank.simpleDescription()
//  使用 rawValue 屬性，來存取列舉實體的原始值
aRank.rawValue

///  取得列舉實體 < 方法二 > (當列舉帶有原始值時，列舉會自動得到一個帶 rawValue 參數的可失敗的初始化方法)
//  ‼️ 當 rawValue 的原始值不合法時 (不是介於 1 ~ 13的區間)，此行會觸發執行階段錯誤
aRank = Rank(rawValue: 11)!
aRank.rawValue

//  利用可失敗的初始化方法，拿到的就算是不合法的數，也不會造成程式崩潰
//  配合選擇性綁定執行可失敗初始化方法
if let convertedRank = Rank(rawValue: 4) {
    let threeDescription = convertedRank.simpleDescription()
}

///  < 補充 > 可失敗的初始化方法 (Failable Initializers)
class Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}
var dog = Animal(species: "")
dog = Animal(species: "狗")
dog?.species

if let cat = Animal(species: "貓"){
    print(cat.species)
}

//  MARK: - 💡date: 2023-04-11💡 *

///  ** 練習 11 ** | 撰寫一個函式，透過比較兩個 Rank 的原始值來比較出它們的大小
func compare(rank1:Rank, rank2:Rank) -> String {
    if rank1.rawValue < rank2.rawValue{
        return "rank1:\(rank1.rawValue) 比 rank2:\(rank2.rawValue) 小"
    }else if rank1.rawValue > rank2.rawValue{
        return "rank1:\(rank1.rawValue) 比 rank2:\(rank2.rawValue) 大"
    }else{
        return "rank1:\(rank1.rawValue) 與 rank2:\(rank2.rawValue) 一樣大"
    }
}

//  呼叫比較函式
print(compare(rank1: .five, rank2: Rank(rawValue: 5)!))


//  不帶原始值的列舉，不會有 rawValue 屬性，和帶 rawValue 參數的初始化方法
//  定義列舉 (撲克牌的花色)
enum Suit:Int, CaseIterable {
    //  黑桃、紅心、方塊、梅花
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
            case .spades:
                return "♠️" //  spades
            case .hearts:
                return "❤️" //  hearts
            case .diamonds:
                return "♦️" //  diamonds
            case .clubs:
                return "♣️" //  clubs
        }
    }
    /// ** 練習 12 ** | 增加 黑、紅 花色判斷
    func color() -> String {
        switch self {
            case .spades, .clubs:
                return "Black"
            case .hearts, .diamonds:
                return "Red"
        }
    }
}
//  測試
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

//  練習 12 呼叫
hearts.color()
Suit.spades.color()

/// < 補充 > 列舉的原始值
///  列舉可以不帶原始值，也可以帶整數、字串、字元或浮點數的原始值

//  以下定義指南針四個方向的列舉 (不帶原始值)
enum CompassPoint1 {
    case north
    case south
    case east
    case west
    //  case north, south, east, west
    
    func simpleDescription() -> String {
        switch self {
            case .north:
                return "北方"
            case .south:
                return "南方"
            case .east:
                return "東方"
            case .west:
                return "西方"
        }
    }
}
//  測試
let compassPoint1 = CompassPoint1.north
compassPoint1.simpleDescription()

//  定義指南針四個方向的列舉 (帶 字元 原始值)
enum CompassPoint2:Character {
    //  各別指定每一個 case 對應字元
    case north = "N"
    case south = "S"
    case east = "E"
    case west = "W"
    
    func simpleDescription() -> String {
        switch self {
            case .north:
                return "北方"
            case .south:
                return "南方"
            case .east:
                return "東方"
            case .west:
                return "西方"
        }
    }
}
//  測試
//  宣告變數為"預先拆封"的選擇值
var compassPoint2:CompassPoint2! = CompassPoint2.north
compassPoint2.simpleDescription()
//  "預先拆封"的選擇值可以接收未拆封的選擇值
compassPoint2 = CompassPoint2(rawValue: "E")!
compassPoint2 = CompassPoint2(rawValue: "E")
compassPoint2.rawValue
compassPoint2 = nil
//  若為不存在的字元，強制拆封會有問題產生，需注意
compassPoint2 = CompassPoint2(rawValue: "K")
compassPoint2

//  定義指南針四個方向的列舉 (帶 Int 始值)
enum CompassPoint3:Int {
    //  預設 Int 從 0 開始
    case north
    case south
    //  更改預設 Int 從 4 開始
    case east = 4
    case west
    //  case north, south, east, west
    
    func simpleDescription() -> String {
        switch self {
            case .north:
                return "北方"
            case .south:
                return "南方"
            case .east:
                return "東方"
            case .west:
                return "西方"
        }
    }
}
//  測試
var compassPoint3 = CompassPoint3.north
compassPoint3.rawValue
compassPoint3 = CompassPoint3.south
compassPoint3.rawValue
compassPoint3 = CompassPoint3.east
compassPoint3.rawValue
compassPoint3 = CompassPoint3.west
compassPoint3.rawValue

//  定義指南針四個方向的列舉 (帶 String 原始值)
enum CompassPoint4:String {
    
    //  列舉也可定義計算屬性
    var test:Int{
        return 1
    }
    //  原始值以 case 的描述文字當作字串預設的原始值
    case north, south, east
    case west = "W"
    
    //  自訂帶 RawValue 列舉的出使化方法
    init(){
        self.init(rawValue: "E")!
    }
    
    func simpleDescription() -> String {
        switch self {
            case .north:
                return "北方"
            case .south:
                return "南方"
            case .east:
                return "東方"
            case .west:
                return "西方"
        }
    }
}
//  測試
var compassPoint4:CompassPoint4! = CompassPoint4.east
compassPoint4.rawValue
compassPoint4 = CompassPoint4(rawValue: "west")
compassPoint4 = CompassPoint4(rawValue: "W")
compassPoint4.rawValue


//  定義指南針四個方向的列舉 (帶 Double 原始值)
enum CompassPoint5:Double {
    case north
    case south
    case east = 3.1
    case west = 3.3
    
    func simpleDescription() -> String {
        switch self {
            case .north:
                return "北方"
            case .south:
                return "南方"
            case .east:
                return "東方"
            case .west:
                return "西方"
        }
    }
}
//  測試
var compassPoint5:CompassPoint5! = CompassPoint5.east
compassPoint5.rawValue


///  ✨------ 列舉的關聯值 (Associated Value) ------✨
//  定義伺服器回應的列舉
enum ServerResponse {
    //  伺服器回傳結果
    case result(String, String)
    //  伺服器回傳錯誤訊息
    case failure(String)
    ///  ** 練習 13 ** | 檢測架構修正，自行定義實體方法，加入第三個 case (tide 漲退潮)
    //  漲潮、退潮
    case tide(String, String)
    
    func simpleDescription() -> String {
        switch self {
                //            case .result(let sunrise, let sunset):
            case let .result(sunrise, sunset):
                return "日出：\(sunrise)，日落：\(sunset)。"
            case let .failure(message):
                return "錯誤：\(message)"
            case let .tide(rising, ebb):
                return "漲潮：\(rising)，退潮：\(ebb)。"
        }
        // Prints "Sunrise is at 6:00 am and sunset is at 8:09 pm."
    }
}
   
//  以下為簡化版本
/*
switch success {
    case let .result(sunrise, sunset):
        print( "日出：\(sunrise)，日落：\(sunset)。")
    case let .failure(message):
        print( "錯誤：\(message)")
    case let .tide(rising, ebb):
        print( "漲潮：\(rising)，退潮：\(ebb)。")
}
switch failure {
    case let .result(sunrise, sunset):
        print( "日出：\(sunrise)，日落：\(sunset)。")
    case let .failure(message):
        print( "錯誤：\(message)")
    case let .tide(rising, ebb):
        print( "漲潮：\(rising)，退潮：\(ebb)。")
}
*/


//  測試帶關聯值的列舉實體
let success = ServerResponse.result("6:00 am", "8:09 pm")
success.simpleDescription()
let failure = ServerResponse.failure("Out of cheese.")
failure.simpleDescription()
let tide = ServerResponse.tide("5:30 am", "8:47 pm")
tide.simpleDescription()

///  < 補充 > 列出列舉的所有 case (Iterating over Enumeration Cases) ------✨
//  定義飲料列舉，以 : 引入 CaseIterable 協定
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// Prints "3 beverages available"

for beverage in Beverage.allCases {
    print(beverage)
}

///  ✨------ 結構 (Structure) ------✨
//  使用 struct 關鍵字建立結構。
//  『結構』支援許多跟『類別』相同的行為，包括 "方法" 和 "初始化方法" (建構子)。
//  『結構』和『類別』之間最重要的不同點，是『結構』在程式碼中傳遞時總是被複製 (copy) 一份，
//  但是類別是通過引用 (reference) 傳遞的

//  宣告撲克牌結構
struct Card {
    //  以變數定義 "結構成員" ( 🔴 注意：成員不會帶有 static 關鍵字) 🔴
    var rank: Rank      //  撲克牌牌數為 Rank 列舉
    var suit: Suit      //  撲克牌花色為 Suit 列舉
    
    //  以 static 關鍵字定義 『型別屬性』(Type Property)
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty:Int {
        return 1
    }
    
    
    
    
    //  🔴 注意：結構會 "自動" 得到一個 "逐一成員的初始化方法" (memberwise initializer) 🔴
    ///  結構的『實體方法』(instance method)：列印花色與牌數
    func simpleDescription() -> String {
        return "\(suit.simpleDescription()),\(rank.simpleDescription())"
    }
    ///  ** 練習 14 ** | 撰寫一個函式，該函式回傳一個陣列，該陣列包含一副完整的撲克牌
    ///  其中每個陣列元素包含牌數和花色的組合成為一張牌。
    ///  🔴 (注意：陣列每一個元素為Card結構的實體) 🔴

        ///  結構的『型別方法』(type method)：回傳一整副撲克牌
        //  有關鍵字 "static" 在前方
        static func fullDeckOfCard_v2() -> [Card] {
        //  準備撲克牌的空陣列
        var cards = [Card]()
            
        /// 第一種寫法
        /*
        for aRank in Rank.allCases {        //  外迴圈跑牌數
            for aSuit in Suit.allCases {    //  內迴圈跑花色
                //  以取得的牌數和花色來製作單張牌 (Card 結構實體)
                let card = Card(rank: aRank, suit: aSuit)
                //  將單張牌逐一加入陣列
                cards.append(card)
            }
        }*/
        /// 第二種寫法
        for aRank in Rank.ace.rawValue...Rank.king.rawValue{
            for aSuit in Suit.spades.rawValue...Suit.clubs.rawValue{
                let card = Card(rank: Rank(rawValue: aRank)!,
                                suit: Suit(rawValue: aSuit)!)
            }
        }
        
        
            //  回傳整副撲克牌陣列
        return cards
    }
}
//  測試撲克牌結構
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
//  由型別直接執行回傳一整副撲克牌的型別方法
Card.fullDeckOfCard_v2()

//  由型別直接存取型別屬性
Card.storedTypeProperty
Card.computedTypeProperty


///  ** 練習 14 ** | 撰寫一個函式，該函式回傳一個陣列，該陣列包含一副完整的撲克牌
///  其中每個陣列元素包含牌數和花色的組合成為一張牌。
///  🔴 (注意：陣列每一個元素為Card結構的實體) 🔴
func fullDeckOfCard() -> [Card] {
    //  準備撲克牌的空陣列
    var cards = [Card]()
    //  外迴圈跑牌數
    for aRank in Rank.allCases {
        //   內迴圈跑花色
        for aSuit in Suit.allCases {
            //  以取得的牌數和花色來製作單張牌 (Card 結構實體)
            let card = Card(rank: aRank, suit: aSuit)
            //  將單張牌逐一加入陣列
            cards.append(card)
        }
    }
    //  回傳整副撲克牌陣列
    return cards
}
//  執行函式取得撲克牌陣列
let fullCards = fullDeckOfCard()
fullCards.count
fullCards[0].simpleDescription()

//  MARK: - 💡date: 2023-04-13💡 *

///  < 補充 > static 型別屬性與 class 型別屬性
/*  使用 static 關鍵字來定義型別屬性 (type property)
    對於在類別中的 "型別計算屬性"，可以使用 class 關鍵字來允許子類別覆蓋父類別的實作
    下面的範例顯示了型別的儲存屬性和型別的計算屬性語法 */
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
//  測試
SomeStructure.storedTypeProperty
SomeStructure.computedTypeProperty

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
//  測試
SomeEnumeration.storedTypeProperty
SomeEnumeration.computedTypeProperty

class SomeClass {
    //  型別的儲存屬性只能使用 static 關鍵字
    static var storedTypeProperty = "Some value."
    //  型別的計算屬性可以使用 static 或 class 關鍵字來決定是否可讓子類別覆蓋
    static var computedTypeProperty: Int {
        return 27
    }
    //  (若使用 static 則只能被使用而無法再被子類別覆蓋)
//    static var overrideableComputedTypeProperty: Int {
    //  關鍵字 class 改寫父類別型別屬性
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
    class func someTypeMethod() {
        print("父類別的 someTypeMethod")
    }
}
//  測試
SomeClass.storedTypeProperty
SomeClass.computedTypeProperty
SomeClass.overrideableComputedTypeProperty
SomeClass.someTypeMethod()

class SomeSubClass:SomeClass {
    //  再次改寫父類別，需再加上 override
    override class var overrideableComputedTypeProperty: Int {
        return 222
    }
    override static func someTypeMethod() {
        print("子類別的 someTypeMethod")
    }
}
//  測試
SomeSubClass.overrideableComputedTypeProperty
SomeSubClass.someTypeMethod()

///  < 補充 > 比較結構與類別的特性
/*
Swift中的結構和類別有很多『共同點』。兩者都可以：
1.定義屬性來儲存值
2.定義提供某些功能的方法
3.定義標註/下標（subscript）以使用標註語法提供對應值的存取
4.定義初始化方法以設置其初始狀態
5.可以使用『擴展』（extension）擴充『預設實作』（default implementation）的功能
6.符合協定（Protocol）以提供某種標準功能
 
另外，類別具有結構、列舉所沒有的附加功能：

1.繼承使一個類別能夠繼承另一個類別的特性（繼承父類別的屬性和方法）。
2.型別轉換（Type casting）使您能夠在運行時檢查和轉換類別實體的型別。
3.反初始化方法（Deinitializers）使類別的實體能夠釋放它分配的任何資源。
4.引用計數（Reference counting）允許對一個『類別實體』（即同一個記憶體配置空間）進行多次引用。
*/

///  ✨------ 結構和列舉是值型別 (Structures and Enumerations Are Value Types) ------✨
///  值型別的行為是拷貝
//  定義解析度結構
struct Resolution {
    var width = 0
    var height = 0
}
//  定義影像麼是類別
class VideoMode {
    var resolution = Resolution()   //  預設解析度寬高為 0
    var interlaced = false          //  預設為非交錯模式
    var frameRate = 0.0             //  畫面的更新頻率
    var name: String?               //  影像模式名稱
    
    deinit {
        if let name { print("\(name)被釋放") }
        else { print("影像實體被釋放") }
    }
}
//  測試結構和類別的實體
let someResolution = Resolution()
let someVideoMode = VideoMode()

print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
//  Swift 在變更結構屬性時，可以單一設定結構成員的值
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
someVideoMode.resolution.height = 720
someVideoMode.name = "720P"
//  Object-C 在變更結構屬性時，只能重設整個結構
someVideoMode.resolution = Resolution(width: 1280, height: 720)

//  初始化 VGA 解析度結構
let vga = Resolution(width: 640, height: 480)
//  初始化 HD 解析度結構
let hd = Resolution(width: 1920, height: 1080)
//  copy hd 的結構，此動作會自動產生新的記憶體空間，並配置給 cinema
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

//  MARK: - 分隔
///  列舉也有相同的拷貝行為
enum CompassPoint {
    case north, south, east, west
    //  當變動列舉實體時，需加上關鍵字 mutatuig
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassPoint.east
//  copy currentDirection 的列舉，此動作會自動產生新的記憶體空間，並配置給 currentDirecrion
let rememberedDirection = currentDirection
//  將 currentDirecrion 的值改回 north
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")
// MARK: - 分隔

///  ✨------ 類別是引用型別 (Classes Are Reference Types) ------✨
///  引用型別的行為是引用
var tenEighty: VideoMode! = VideoMode()     //  此時引用計數為 1
tenEighty.resolution = hd       //  拷貝 1920 * 1080
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

//  引用 tenEighty
var alsoTenEighty: VideoMode! = tenEighty   //  此時引用計數為 2
alsoTenEighty.frameRate
alsoTenEighty.frameRate = 30.0
//  因為使用的是同一塊記憶體配置空間，所以 frameRate 會一起變動
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

///  恆等運算子 (Identity Operators)
//  結構跟結構或類別跟類別的比較
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
//  自動引用計數機制 (Automatic Reference Counting)
//  引用計數器歸 0 佔用的記憶體空間會釋放
alsoTenEighty = nil     //  引用計數器 - 1 (由 2 - 1)
tenEighty = nil         //  引用計數器 - 1 (由 1 - 1)

/*  🔴 注意：🔴
當你定義一個新的結構、列舉、類別時，就是在定義 Swift 的型別
定義型別名稱：
    採納大寫開頭的駝峰式命名法 (UpperCamelCase)，
    以便跟標準的 Swift 型別有一致的命名邏輯
    (例：Int, String, Bool)
    採納小寫開頭的駝峰式命名法 (LowerCamelCase) 來命名
    屬性、方法、變數、常數、函式，以便跟型別名稱做區別
*/

///  ⭐️============ 同時性 (Concurrency) ============⭐️
//  讓函式可以以 "非同步" (asynchronous) 的方式運行，加上 async 關鍵字
//  synchronous：同步 -> 不能跟別的程式碼同時執行      ❌
//  asynchronous：非同步 -> 可以跟別的程式碼同時執行    ⭕️

//  讓函式可以以 "非同步" (asynchronous) 的方式運行，加上 async 關鍵字
func fetchUserID(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}

//  以 await 關鍵字來進行非同步函式的呼叫
func fetchUsername(from server: String) async -> String {
    //  呼叫非同步函式取得伺服器回應 (97 or 501)
    //  需加上 await 關鍵字
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    }
    return "Guest"
}
/* ⬆️‼️⚠️‼️⚠️‼️⚠️‼️⚠️‼️⚠️‼️⚠️‼️⚠️‼️⚠️⬆️
 此呼叫雖然為非同步運作，可以跟其他程式同時執行，但是如果同時執行，下一行會得不到函式的回傳值
 所以用 await 關鍵字來等待非同步函式完全執行結束後，才會執行下一行
 如果非同步函式的呼叫必須得到回傳值，才能進行下一步時，請使用 await 關鍵字來使用
*/

func connectUser(to server: String) async {
    //  以下兩行的值行為同步運作，使用 async let
    async let userID = fetchUserID(from: server)
    async let username = fetchUsername(from: server)
    //  上面兩個同步運作全部執行玩，才會得到 userId 跟 username，才能進行下一行
    let greeting = await "Hello \(username), user ID \(userID)"
    print(greeting)
}
/* ⬆️‼️⚠️‼️⚠️‼️⚠️‼️⚠️‼️⚠️‼️⚠️‼️⚠️‼️⚠️⬆️
 使用 async let 關鍵字進行 "非同步函式" 的呼叫，
 讓這個呼叫可以跟其他非同步的程式碼同時運行
*/

//  使用 Task 關鍵字再循序執行的程式中來呼叫非同步函式，但不需等待非同步函式執行完畢
Task {
    await connectUser(to: "primary")
}


//  MARK: - 💡date: 2023-04-14💡 *

///  ⭐️============ 協定和擴展 (Protocols and Extensions) ============⭐️
///  ✨------ 協定 (Protocols) ------✨
//  使用 protocol 宣告協定，來定義協定的要求 (requirement)
protocol ExampleProtocol {
    //  要求至少是『唯讀』的屬性
    var simpleDescription: String { get }
    //  要求實作『方法』 -> 🔴 注意：mutauing 關鍵字僅供 "值型別" 使用 🔴
    mutating func adjust()
    ///  ** 練習 15 ** | 增加另一個要求，要求實作可讀可寫的屬性
    var aInt: Int { get set }
}

//  類別、列舉和結構都可以採納協議定
//  類別如需繼承，要放在協定之前
//  ‼️(繼承只能單一，協定可多份)‼️
//  類別採納協定
class SimpleClass: ExampleProtocol {
    ///  ** 練習 15 **
    //  < 方法一 > 以『可讀可寫的儲存屬性』實作協定屬性
//    var aInt: Int = 0
    //  < 方法二 > 以『可讀可寫的計算屬性』實作協定屬性
    private var tempInt = 0
    var aInt: Int {
        get { return tempInt}
        set { tempInt = newValue }
    }
    
    //  以可讀可寫的『儲存屬性』實作協定屬性
    var simpleDescription: String = "A very simple class."
    //  自行定義可讀可寫的『儲存屬性』
    var anotherProperty: Int = 69105
    //  實作協定方法
    func adjust() {
          simpleDescription += "  Now 100% adjusted."
    }
}
//  測試
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription
a.aInt = 2
a.aInt
//  結構採納協定
struct SimpleStructure: ExampleProtocol {
    ///  ** 練習 15 **
    //  以『結構成員』實作協定屬性
    var aInt: Int = 0
    //  以『結構成員』實作協定屬性
    var simpleDescription: String = "A simple structure"
    //  以『變動』方法實作協定方法
    mutating func adjust() {
        //  當方法的實作，會變動到值型別的屬性值時，方法必須加上 mutating
        simpleDescription += " (adjusted)"
    }
}
//  測試
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
b.aInt
b.simpleDescription

///  < 補充練習 >
//  列舉採納協定
enum SimpleEnumeration: Int, ExampleProtocol{
    //  🔴 注意：列舉不可使用儲存屬性 🔴 Enums must not contain stored properties
    ///  ** 練習 15 **
    ///  列舉中只能這樣實作成『可讀可寫的計算屬性』
    var aInt: Int {
        get { return 0 }
        set { }
    }
    //  以『唯讀計算屬性』實作協定屬性，回傳對應的中文數字，調整後的 case 則中文後加上 +
    var simpleDescription: String {
        switch self {
            case .one:
                return "【一】"
            case .two:
                return "【二】"
            case .three:
                return "【三】"
            case .oneAdjusted:
                return "【一】+"
            case .twoAdjusted:
                return "【二】+"
            case .threeAdjusted:
                return "【三】+"
        }
    }
    //  實作協定方法，當 case 為 one, two, three 時，調整為對應的 Adjusted
    //  當 case 為 Adjusted 時，則維持原值
    mutating func adjust() {
        switch self {
            case .one:
                self = .oneAdjusted
            case .two:
                self = .twoAdjusted
            case .three:
                self = .threeAdjusted
//            case .oneAdjusted, .twoAdjusted, .threeAdjusted:
//                break
            default:
                break
        }
    }
    //  原始值
    case one = 1, two, three
    case oneAdjusted, twoAdjusted, threeAdjusted
}
//  測試
var c = SimpleEnumeration(rawValue: 3)
c?.simpleDescription
c = SimpleEnumeration.threeAdjusted
print(c!.simpleDescription)
c?.adjust()
print(c!.simpleDescription)

///  ** 練習 15 ** | 在 ExampleProtocol，增加另一個要求
///  需要進行哪些更改讓 SimpleClass 和 SimpleStructure 仍然符合協定

///  ✨------ < 補充 > 選擇性的協定要求 (Optional Protocol Requirements) ------✨
@objc protocol CounterDataSource {
    //  以下為選擇性實作的協定屬性 (關鍵字 @objc optional)
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
    //  以下為必要實作的協定屬性
    var aDuble: Double { get set }
}

class Counter {
    //  以下兩個屬性都是類別自行定義的實體屬性
    var count = 0
    //  以 CounterDataSource 協定當作型別。如果有任何的類別、結構或列舉的『實體』
    //  實作過此協定，就可以存放在『儲存屬性』當中
    //  此設計模式為 Delegation (代理機制)
    var dataSource: CounterDataSource?
    //  類別中自行定義的實體方法
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        } else if let amount = dataSource?.aDuble {
            count += Int(amount)
        }
    }
}
//  NSObject 可以不寫，因為 Swift 本身是繼承 Object-C
class ThreeSource: NSObject, CounterDataSource {
    //  以儲存屬性來實作必要的協定屬性
    var aDuble: Double = 0
    //  以常數唯讀的儲存屬性來實作，選擇性的協定屬性
    let fixedIncrement = 3
    //  此屬性為類別自訂的實體屬性，與協定無關
    var otherInt = 22
}
var counter = Counter()
//  為類別實體記憶體配置，有完整的視角觀察所有類別相關的屬性和方法
let threeSource = ThreeSource()         //  引用計數:1
//  dataSource 數醒只關心協定相關的屬性和方法，所以即使以 threeSource 的類別實體存錄入，
//  此時的視角只看得到協定相關的屬性和方法
counter.dataSource = threeSource        //  引用計數:2
//  協定型別的實體，可以使用轉型語法進行類別的型別轉換，轉回原來初始化時的視角
//  因此可以操作原來的類別屬性和方法
(counter.dataSource as! ThreeSource).otherInt


counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

///  ✨------ 以協定當作型別 (Protocols as Types) ------✨
/*
你可以在以下場景使用『協定』來當作『型別』：
1. 協定型別可以當作西式、方法或初始化方法中的參數型別或回傳型別
2. 協定型別可以當作常數、變數或屬性的型別
3. 協定型別可以當作陣列、字典或其他容器中的項目型別
*/
//  類別
var protocolValue: ExampleProtocol = a          /// 引用
print(protocolValue.simpleDescription)
(protocolValue as! SimpleClass).anotherProperty

//  結構
protocolValue = b           /// 拷貝
//  列舉
protocolValue = c!           /// 拷貝

///  ✨------ 擴展 (Extensions) ------✨
//  擴展可以為既有型別加入新的方法、計算屬性或引入協定
//  以下擴展既有的 Int 型別，為 Int 型別引入 ExampleProtocol
extension Int: ExampleProtocol {
    //  引入協定為既有型別加入計算屬性
    var aInt: Int {
        get { return 0 }
        set { }
    }
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }

 }
//  測試擴展的屬性和方法
print(7.simpleDescription)
14.aInt

var testInt = 42
testInt.simpleDescription
testInt.adjust()

///  ** 練習 16 ** | 為 Double 型別撰寫一個擴展，增加一個絕對值屬性

extension Double {
    var absoulteValue: Double {
        //  < 方法 1 > 自行判斷浮點數的正負來進行絕對值的處理
        if self < 0 { return -self }
        //  < 方法 2 > 使用 Swift 內建的函式來取得絕對值 (來至於 C 語言?!)
//        return fabs(self)
        //  < 方法 3 > 以預設的取決對質屬性來回傳
//        return self.magnitude
        return self
    }
}

///  ⭐️============ 錯誤處理 (Error Handling) ============⭐️
//  任何的型別採納 Error 協定可用來呈現錯誤
enum PrinterError: Error {      //  ⚠️ Error 協定為空協定，不需要實作!!
    case outOfPaper     //  缺紙
    case noToner        //  沒有碳粉
    case onFire         //  故障
}
///  ** 練習 18 ** | 回補函式以增加拋出兩種錯誤
//  定義其它錯誤
enum OtherError: Error {
    case unknow
}
//  🔴 注意：使用 throws 標記可以拋出錯誤的函式 (在參數列表之後，回傳值之前使用 throws 關鍵字）🔴
//  使用 throws 在函式的實作中拋出錯誤
//  如果您在函數中拋出錯誤，該函數會立即返回，而且調用該函式的程式碼要處理該錯誤
func send(job: Int, toPrinter printerName: String) throws -> String {
    //  當符合特定條件時
    if printerName == "Never Has Toner" {
        //  拋出錯誤，立即離開函式
        throw PrinterError.noToner
        ///  ** 練習 18 ** | 回補函式以增加拋出兩種錯誤
    } else if printerName == "Out Of Paper" {
        throw PrinterError.outOfPaper
    } else if printerName == "On Fire" {
        throw PrinterError.onFire
        //  函式拋出其它錯誤
        //  印表機回空字串時
    } else if printerName.isEmpty {
        throw OtherError.unknow
    }
    return "Job sent"
}

//  當函式一定可以呼叫成功時，只需加上 try 關鍵字在會拋出錯誤的函式之前
try send(job: 100, toPrinter: "Test")   //  此呼叫沒有處理函式呼叫有可能或拋出錯誤的情況
//  當函式呼叫失敗時，只需加上 try 關鍵字會觸發執行階段錯誤
//try send(job: 101, toPrinter: "Never Has Toner")
//  不建議使用單純的 try 來進行會拋出錯誤的呼叫

///  < 方法一 >
///  ✨------ 單段式捕捉錯誤 (do-try-catch) ------✨
//  try 關鍵字呼叫函式時，需配合 do-catch 捕捉錯誤
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)    //  預設捕捉錯誤常數為 error
}

///  ** 練習 17 ** |
do {
    try send(job: 1050, toPrinter: "Never Has Toner")
}
catch (let err) {   //  可以變更預設錯誤的常數名稱
    print(err)
    print(err.localizedDescription)     //  列印 Error 的實體屬性
}

///  < 方法二 >
///  ✨------ 多段式捕捉錯誤 (do-try-catch) ------✨
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
//  第一段：捕捉印表機故障的錯誤
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
//  第二段：捕捉 PrinterError 的另外兩種錯誤 (缺紙或沒有碳粉)
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
//  第三段：捕捉不屬於 PrinterError 的其他錯誤
} catch {
    print(error)
}

//  MARK: - 💡date: 2023-04-19💡 *

///  ** 練習 18 ** | 在do區段內增加程式碼來引發錯誤。
///  您必需要拋出什麼樣的錯誤，來讓第一個catch區段捕捉到錯誤？
///  還有讓第二區段和第三區段捕捉到錯誤？

///  讓第一段捕捉錯誤並印出錯誤
do {
    let printerResponse = try send(job: 1440, toPrinter: "On Fire")
    print(printerResponse)
//  第一段：捕捉印表機故障的錯誤
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
//  第二段：捕捉 PrinterError 的另外兩種錯誤 (缺紙或沒有碳粉)
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
//  第三段：捕捉不屬於 PrinterError 的其他錯誤
} catch {
    print(error)
}

///  讓第二段捕捉錯誤並印出錯誤
do {
//    let printerResponse = try send(job: 1440, toPrinter: "Out Of Paper")
    let printerResponse = try send(job: 1440, toPrinter: "Never Has Toner")
    print(printerResponse)
//  第一段：捕捉印表機故障的錯誤
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
//  第二段：捕捉 PrinterError 的另外兩種錯誤 (缺紙或沒有碳粉)
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
//  第三段：捕捉不屬於 PrinterError 的其他錯誤
} catch {
    print(error)
}

///  讓第三段捕捉錯誤並印出錯誤
do {
    let printerResponse = try send(job: 1440, toPrinter: "")
    print(printerResponse)
//  第一段：捕捉印表機故障的錯誤
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
//  第二段：捕捉 PrinterError 的另外兩種錯誤 (缺紙或沒有碳粉)
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
//  第三段：捕捉不屬於 PrinterError 的其他錯誤
} catch {
    print(error)
}

///  < 方法三 >
///  ✨------ 多段式捕捉錯誤 (do-try-catch) ------✨
//  處理錯誤的另一種方法是使用try？將函式的呼叫結果轉換為選擇值。
//  如果函式拋出錯誤，則丢棄特定錯誤並且結果為nil
//  呼叫成功時，函式回傳結果是一個原函式回傳的選擇值

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

//  改寫
if let _ = try? send(job: 1884, toPrinter: "Mergenthaler") {
//if let _ = try? send(job: 1884, toPrinter: "") {
    print("Work done")
} else {
    print("Failed")
}

/// defer
//  使用 defer 區段來撰寫在函式中所有其他程式碼執行之後才會執行的代碼塊
//  無論函式是否拋出錯誤，defer 區段的程式碼都會在離開函式之前的"最後階段"被執行
//  您可以在 defer 區段將一開始要執行的設定和最後要執行清理(還原)的程式碼並排撰寫

//  一開始預設冰箱門關著
var fridgeIsOpen = false
//  冰箱內容物
let fridgeContent:Array<String> = ["milk", "eggs", "leftovers"]
//  確認冰箱內容的函式
func fridgeContains(_ food: String) -> Bool {
    //  1.把冰箱門打開
    fridgeIsOpen = true
    defer {
        //  3.把冰箱門關上
        fridgeIsOpen = false
    }
    //  2.確認冰箱是否存在該食物
    let result = fridgeContent.contains(food)
    //  4.回傳並離開函式
    return result
}
//  測試函式
fridgeContains("banana")
print(fridgeIsOpen)

///  ✨------ 回拋函式或方法的錯誤(Rethrowing Functions and Methods) ------✨
enum SomeError: Error {
    case error
}

///  < 狀況一 > 以下定義一個會回拋出錯誤的函式
//  someFunction 函式本身不捕捉錯誤
func someFunction(callback: () throws -> Void) rethrows {
    //  此呼叫沒有處理錯誤，當此呼叫產生錯誤時，會回拋錯誤給外層函式的呼叫者
    //  由外層函式的呼叫者捕來捉錯誤
    try callback()
}

//  呼叫外層函式，由外層函式的呼叫者來捕捉錯誤
try? someFunction {
    throw SomeError.error
}
//  呼叫外層函式，由外層函式的呼叫者來捕捉錯誤
do {
    try someFunction {
        throw SomeError.error
    }
} catch {
    print(error)
}

/// < 狀況二 > 函式的參數接受一個會拋出錯誤的閉包
func someFunction1(callback: () throws -> Void) {
    //  函式的實作自行捕捉錯誤
    do {
        try callback()
    } catch {
        print(error)
    }
}
//  外層函式的呼叫者不需處理錯誤
someFunction1 {
    throw SomeError.error
}

///  ⭐️============ 泛型、泛用型別 (Generics) ============⭐️
func makeArray(repeating item: Int, numberOfTimes: Int) -> [Int] {
    var result: [Int] = []
    for _ in 0..<numberOfTimes {
         result.append(item)
    }
    return result
}
//  執行函式
makeArray(repeating: 55, numberOfTimes: 5)
func makeArray(repeating item: String, numberOfTimes: Int) -> [String] {
    var result: [String] = []
    for _ in 0..<numberOfTimes {
         result.append(item)
    }
    return result
}
//  執行函式
makeArray(repeating: "test", numberOfTimes: 4)
  
//  使用 <> 定義泛型函式，Item 為型別代換的代換字 (自定義名稱，通常使用 T 來代表)
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
         result.append(item)
    }
    return result
}
//  執行函式
makeArray(repeating: 7.88, numberOfTimes: 4)
makeArray(repeating: "knock", numberOfTimes: 4)

///  可以將泛型使用在方法或函式，而且也可以用在類別、列舉、結構
//  以下帶關聯值的列舉重新實作了 Swift 標準函式庫的選擇性型別
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
//  測試列舉
var possibleInteger: OptionalValue<Int> = .none
var possibleInteger1 = OptionalValue.some("test")
possibleInteger = .some(100)

//  在函式的實作之前使用 where 來指定需求列表，要求型別實作協定，要求兩種型別相同，或者要求類別繼承自特定的父類別
//  (可以只用一個泛型就好)
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element {
    /// where 條件：T 集合的元素型別必須採納過相等協定，T 集合元素的型別必須與 U 集合的元素型別相同
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
   return false
}
//  測試
anyCommonElements([1, 2, 3], [3])
anyCommonElements([1, 2, 4], [3])
anyCommonElements(["a", "b", "c"], ["c"])
anyCommonElements(["aa", "bb", "cc"], ["c"])
anyCommonElements(["aa", "bb", "dd"], ["dd"])

//  一個泛型
func anyCommonElements2<T: Sequence>(_ lhs: T, _ rhs: T) -> Bool
    where T.Element: Equatable {
    /// where 條件：T 集合的元素型別必須採納過相等協定，T 集合元素的型別必須與 U 集合的元素型別相同
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
   return false
}

anyCommonElements2([1, 2, 3], [3])
anyCommonElements2([1, 2, 4], [3])
anyCommonElements2(["a", "b", "c"], ["c"])
anyCommonElements2(["aa", "bb", "cc"], ["c"])
anyCommonElements2(["aa", "bb", "dd"], ["dd"])

///  ** 練習 19 ** | 修改anyCommonElEments(_:_:)函式以建立一個新函式，該函式回傳任意兩個序列共同元素的陣列

func anyCommonElements3<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Element] where T.Element: Equatable, T.Element == U.Element {
    var commonElements = [T.Element]()
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                commonElements.append(rhsItem)
            }
        }
    }
   return commonElements
}
//  測試
print(anyCommonElements3([1, 2, 3, 4, 5], [5, 3]))

///  < 補充練習 > 以自訂型別採納相等協定
///  自定義的情況下可能需要到官方文件內去看需求條件，如下方兩個 func
struct MyPoint: Comparable, Hashable {    // Comoarable 包含 Equatable 協定
    
    var x: Int, y: Int, z: Int
    //  以下會替換相等與不相等的預設實作 (此實作如果沒有特殊需求可省略)
//    static func == (lhs: MyPoint, rhs: MyPoint) -> Bool {
//        return lhs.x+lhs.y+lhs.z == rhs.x+rhs.y+rhs.z
//    }
    //  比較協定唯一要求的實作(Developer Documentatioin)
    static func < (lhs: MyPoint, rhs: MyPoint) -> Bool {
        return lhs.x+lhs.y+lhs.z < rhs.x+rhs.y+rhs.z
    }
}

//  MARK: - 💡date: 2023-04-25💡 *
//  測試
let point1 = MyPoint(x: 5, y: 3, z: 6)
let point2 = MyPoint(x: 6, y: 5, z: 3)

if point1 < point2 {
    print("兩個座標相同")
} else {
    print("兩個座標不相同")
}
if point1 <= point2 {
    print("point1 <= point2")
}

let dic = [point1:"abc", point2:"def"]
dic[point1]
dic[point2]

// 補充
// Comparable, Hashable 兩個協定儘量一起使用，會比較完整












//  MARK: - 💡date: 2023-04-💡 *
///  ⭐️============  () ============⭐️
///  ✨------  () ------✨
///  <  >
///  ** 練習 ** |
//  🔴 注意： 🔴
//  🟡 實驗 🟡 |
//  ✅ ⚠️ ‼️ ⬆️⬅️⬇️➡️ ❕ ☑️
//  #warning("備註：test")
//  #error("備註：test")

