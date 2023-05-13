//
//  SecondViewController.swift
//  RandomTextImageBackground
//
//  Created by TorresChien on 2023/5/13.
//

import UIKit

class SecondViewController: UIViewController {
    
    // 顯示顏色的 View
    @IBOutlet var colorView: UIView!
    // 用來儲存傳入的背景色
    var backgroundColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 將背景顏色指定為傳入的背景色
        colorView.backgroundColor = backgroundColor
        
        // 呼叫隨機的函式將文字顯示到 view 上
        addRandomText()
        addRandomText()
    }
    /*
    // 文字的隨機位置、旋轉角度、字體大小、半透明的函式
    func addRandomText() {
        /// 依據陣列的元素數量來迴圈製造 Label
        /// 建立 label 並設置文字的隨機大小、位置、角度、顏色與透明度
        /// 將文字 label 加到 colorView
        for alphabet in koreanAlphabet {
            // 建立一個 label
            let label = UILabel()
            // 文字 label
            label.text = alphabet
            // 字體大小
            label.font = UIFont.boldSystemFont(ofSize: .random(in: 20...60))
            // 讓標籤適應字體大小
            label.sizeToFit()
            // 位置
            label.center = CGPoint(
                x: CGFloat.random(in: 0...colorView.frame.width),
                y: CGFloat.random(in: 0...colorView.frame.height))
            // 角度
            label.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...CGFloat.pi))
            // 顏色
            label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
            colorView.addSubview(label)
        }
    }
     */
    
    // 隨機語系版本的應用
    func addRandomText() {
        /// 從 allAlphabets 中隨機取出一個陣列，若 allAlphabets 沒有的話，則使用預設的陣列
        /// 依據陣列的元素數量來迴圈製造 Label
        /// 建立 albel 並設置文字的隨機大小、位置、角度、顏色與透明度
        /// 將文字 label 加到 colorView
        let randomAlphabet = allAlphabets.randomElement() ?? koreanAlphabet
        for alphabet in randomAlphabet {
            let label = UILabel()
            label.text = alphabet
            label.font = UIFont.boldSystemFont(ofSize: .random(in: 20...60))
            label.sizeToFit()
            label.center = CGPoint(
                x: CGFloat.random(in: 0...colorView.frame.width),
                y: CGFloat.random(in: 0...colorView.frame.height))
            label.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 0...CGFloat.pi))
            label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
            colorView.addSubview(label)
        }
    }
    
    // 隱藏狀態列
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
