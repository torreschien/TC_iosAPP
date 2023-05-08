//
//  ResultViewController.swift
//  LifeNumber
//
//  Created by TorresChien on 2023/5/8.
//

import UIKit
import WebKit

struct BmiInfo {
    let weight: Double
    let height: Double
}

class ResultViewController: UIViewController {

    var birthday: Date!
    @IBOutlet weak var webView: WKWebView!
    let lifeNumberNames = ["", "開創", "協調", "創意", "務實",
    "自由", "關懷", "探究", "權威", "智慧"]
    
    var bmiInfo: BmiInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        let number = calculateLifeNumber(date: birthday)
        title = "\(number) \(lifeNumberNames[number])數"

        if let url = URL(string: "https://www.ifreesite.com/numerology/a\(number).htm") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

    
    func calculateLifeNumber(date: Date) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yMd"
        var numberString = dateFormatter.string(from: date)
        var sum = 0
        repeat {
            sum = 0
            for character in numberString {
                let number = Int(String(character))!
                sum = sum + number
            }
            numberString = "\(sum)"
        } while sum > 9
        return sum
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
