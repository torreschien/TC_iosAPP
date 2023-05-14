//
//  ViewController.swift
//  RandomTextImageBackground
//
//  Created by TorresChien on 2023/5/12.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    // 透明度相關的 IBOutlet
    @IBOutlet weak var alphaValueLabel: UILabel!
    @IBOutlet weak var alphaSlider: UISlider!
    // 紅色相關的 IBOutlet
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var redValueSlider: UISlider!
    // 綠色相關的 IBOutlet
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var greenValueSlider: UISlider!
    // 藍色相關的 IBOutlet
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var blueValueSlider: UISlider!
    // 顏色相關的 IBOutlet
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var sendColorButton: UIButton!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        /// 呼叫更新數值
        updateValueLabel()
        updateRedValueLabel()
        updateGreenValueLabel()
        updateBlueValueLabel()
        updateColor()
    }
    // MARK: - Action
    // slider 的動作會呼叫更新 label 與 color
    @IBAction func alphaSliderValueChange(_ sender: UISlider) {
        /// 呼叫更新數值
        updateValueLabel()
        updateColor()
    }
    @IBAction func redSliderValueChange(_ sender: UISlider) {
        updateRedValueLabel()
        updateColor()
    }
    @IBAction func greenSliderValueChange(_ sender: UISlider) {
        updateGreenValueLabel()
        updateColor()
    }
    @IBAction func blueSliderValueChange(_ sender: UISlider) {
        updateBlueValueLabel()
        updateColor()
    }
    // MARK: - 資料傳遞
    // 按下按鈕後的做動
    @IBAction func sendColorButton(_ sender: UIButton) {
        /// 呼叫 performSegue
        /// 傳遞 identifier 為 "showView" 的 segue 以開啟目標 ViewController
        performSegue(withIdentifier: "showView", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /// 檢查目前 segue 是否是我們想要傳遞資料的 segue
        /// 檢查 segue 的目標 viewController 是否為 SecondViewController
        /// 如果是的話，將其轉型為 SecondViewController 型別
        /// 並將儲存至 destinationVC
        if segue.identifier == "showView" {
            if let destinationVC = segue.destination as? SecondViewController {
                let alpha = alphaSlider.value
                let red = redValueSlider.value
                let green = greenValueSlider.value
                let blue = blueValueSlider.value
                // 用來儲存並傳到下個頁面，將顏色數值轉換成 UIColor 物件
                destinationVC.backgroundColor = UIColor(
                    red: CGFloat(red/255.0),
                    green: CGFloat(green/255.0),
                    blue: CGFloat(blue/255.0),
                    alpha: CGFloat(alpha)
                )
            }
        }
    }
  
    // 更新數值標籤的函式
    func updateValueLabel() {
        /// 設定一個變數來放入 slider 的數值
        /// 把標籤的文字改變成 slider 的數值，並格式化到小數位２位數
        let value = alphaSlider.value
        alphaValueLabel.text = String(format: "%.1f", value)
    }
    func updateRedValueLabel() {
        let redValue = redValueSlider.value
        redValueLabel.text = String(format: "%.f", redValue)
    }
    func updateGreenValueLabel() {
        let greenValue = greenValueSlider.value
        greenValueLabel.text = String(format: "%.f", greenValue)
    }
    func updateBlueValueLabel() {
        let blueValue = blueValueSlider.value
        blueValueLabel.text = String(format: "%.f", blueValue)
    }
    // 顏色更新
    func updateColor() {
        /// 設定變數來放入各自顏色的值
        /// 將顏色數值轉換成 UIColor 物件
        let alphaValue = CGFloat(alphaSlider.value)
        let redValue = CGFloat(redValueSlider.value)
        let greenValue = CGFloat(greenValueSlider.value)
        let blueValue = CGFloat(blueValueSlider.value)
        colorView.backgroundColor = UIColor(
            red: redValue/255,
            green: greenValue/255,
            blue: blueValue/255,
            alpha: alphaValue)
    }
}

