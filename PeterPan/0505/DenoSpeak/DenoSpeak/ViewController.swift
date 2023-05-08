//
//  ViewController.swift
//  DenoSpeak
//
//  Created by TorresChien on 2023/5/5.
//

import UIKit
import AVFAudio

class ViewController: UIViewController {
    let synthesizer = AVSpeechSynthesizer()
    
    
    // MARK: - IBO
    @IBOutlet weak var speakTextField: UITextField!
    
    @IBOutlet weak var speedSliderLabel: UILabel!
    @IBOutlet weak var volumSliderLabel: UILabel!
    
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var volumSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - ACtion Button
    /// 說話語系-ZH
    @IBAction func speakZH(_ sender: Any) {
        
        let utteranceTW = AVSpeechUtterance(string: speakTextField.text!)
        utteranceTW.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        synthesizer.speak(utteranceTW)
    }
    /// 說話語系-KR
    @IBAction func speakKR(_ sender: Any) {
        let utteranceKR = AVSpeechUtterance(string: speakTextField.text!)
        utteranceKR.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        synthesizer.speak(utteranceKR)
    }
    /// 說話語系-EN
    @IBAction func speakEN(_ sender: Any) {
        let utteranceEN = AVSpeechUtterance(string: speakTextField.text!)
        utteranceEN.voice = AVSpeechSynthesisVoice(language: "en-US")
        utteranceEN.rate = speedSlider.value
        synthesizer.speak(utteranceEN)
    }
    
    /// 改變說話速度
    @IBAction func sliderSpeedValueChange(_ sender: UISlider) {
        //        print(sender.value)
        /// 改變小數位
        speedSliderLabel.text = String(format: "%.2f", sender.value)
    }
    @IBAction func sliderVolumvalueChange(_ sender: UISlider) {
        volumSliderLabel.text = String(format: "%.2f", sender.value)
    }
    
    
    
    
    
}

//測試
//
