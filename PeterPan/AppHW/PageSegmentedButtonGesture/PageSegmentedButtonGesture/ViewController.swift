//
//  ViewController.swift
//  PageSegmentedButtonGesture
//
//  Created by TorresChien on 2023/5/8.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - IBO
    @IBOutlet weak var albumScrollView: UIScrollView!
    @IBOutlet weak var albumPageControl: UIPageControl!
    @IBOutlet weak var albumSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var view01: UIView!
    @IBOutlet weak var view02: UIView!
    @IBOutlet weak var view03: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 將 app 設置為固定 dark mode
        overrideUserInterfaceStyle = .dark
        // 設定 segmentControl 的預設為第一個選項
//        albumSegmentedControl.selectedSegmentIndex = 0
        
    }
    // MARK: - 判斷目前頁面並更新小圓點
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = albumScrollView.contentOffset.x / albumScrollView.bounds.width
        albumPageControl.currentPage = Int(page)
        albumSegmentedControl.selectedSegmentIndex = Int(page)
        switch page {
        case 0:
            view01.isHidden = false
            view02.isHidden = true
            view03.isHidden = true
        case 1:
            view01.isHidden = true
            view02.isHidden = false
            view03.isHidden = true
        case 2:
            view01.isHidden = true
            view02.isHidden = true
            view03.isHidden = false
        default:
            break
        }
    }

    // MARK: - 小圓點的 Action
    @IBAction func albumPageControl(_ sender: UIPageControl) {
        let point = CGPoint(
            x: albumScrollView.bounds.width * CGFloat(sender.currentPage),
            y: 0)
        albumScrollView.setContentOffset(point, animated: true)
        albumSegmentedControl.selectedSegmentIndex = sender.currentPage
        switch sender.currentPage {
        case 0:
            view01.isHidden = false
            view02.isHidden = true
            view03.isHidden = true
        case 1:
            view01.isHidden = true
            view02.isHidden = false
            view03.isHidden = true
        case 2:
            view01.isHidden = true
            view02.isHidden = true
            view03.isHidden = false
        default:
            break
        }
        
    }
    // MARK: - Segmented 的 Action
    @IBAction func albumSegmentedControlValueChange(_ sender: UISegmentedControl) {
    // 取得選擇的選項索引
    let index = sender.selectedSegmentIndex
    // 設置 UIScrollView 的 contentOffset 為對應的位置
    let point = CGPoint(
        x: view.bounds.width * CGFloat(index),
        y: 0)
    albumScrollView.setContentOffset(point, animated: true)
    // 更新 pagecontrol 的當前頁面
    albumPageControl.currentPage = index
        // 利用 switch 來顯示或隱藏 view
        switch index {
        case 0:
            view01.isHidden = false
            view02.isHidden = true
            view03.isHidden = true
        case 1:
            view01.isHidden = true
            view02.isHidden = false
            view03.isHidden = true
        case 2:
            view01.isHidden = true
            view02.isHidden = true
            view03.isHidden = false
        default:
            break
        }
    
    }
}

