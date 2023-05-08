//
//  BirthdayViewController.swift
//  LifeNumber
//
//  Created by TorresChien on 2023/5/8.
//

import UIKit

class BirthdayViewController: UIViewController {
    // 月曆的 outlet
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - SequeAction -> birthday -> Result
    @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {
        /// 把資料利用 IBSequeAction 傳遞到下一個頁面
        // coder => 包含所設計的東西
        let controller = ResultViewController(coder: coder)
        controller?.birthday = datePicker.date
        return controller
        // 下列寫法只會回傳一個空畫面
//        return ResultViewController()
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
