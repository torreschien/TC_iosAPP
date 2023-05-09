//
//  ViewController.swift
//  PageSegmentedButtonGesture
//
//  Created by TorresChien on 2023/5/8.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - IBO
    /// 用來連結 Storyboard 上的元件
    // 控制 View 的方式
    @IBOutlet weak var albumScrollView: UIScrollView!
    @IBOutlet weak var albumPageControl: UIPageControl!
    @IBOutlet weak var albumSegmentedControl: UISegmentedControl!
    // 要顯示的 View
    @IBOutlet weak var view01: UIView!
    @IBOutlet weak var view02: UIView!
    @IBOutlet weak var view03: UIView!
    // 上下頁的 Button
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 將 app 設置為固定 dark mode
        overrideUserInterfaceStyle = .dark
        // 將 previous 一開始設置為隱藏
        previousButton.isHidden = true
    }
    // MARK: - 判斷目前頁面並更新小圓點
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        /// 計算目前頁面，更新小圓點的當前頁面，更新分頁控制的項目
        let page = albumScrollView.contentOffset.x / albumScrollView.bounds.width
        albumPageControl.currentPage = Int(page)
        albumSegmentedControl.selectedSegmentIndex = Int(page)
        // 顯示對應的 View，並判斷頁數來顯示或隱藏 Button
        showView(at: Int(page))
        buttonHiddenOrNot(at: Int(page))
        
    }

    // MARK: - 元件的 Action
    // Page Control 的動作
    @IBAction func albumPageControl(_ sender: UIPageControl) {
        /// 取得目標位置，捲動到目標位置，更新分頁控制的項目
        let point = CGPoint(
            x: albumScrollView.bounds.width * CGFloat(sender.currentPage),
            y: 0)
        albumScrollView.setContentOffset(point, animated: true)
        albumSegmentedControl.selectedSegmentIndex = sender.currentPage
        // 顯示對應的 View，並判斷頁數來顯示或隱藏 Button
        showView(at: sender.currentPage)
        buttonHiddenOrNot(at: sender.currentPage)
    }
    
    // Segmented Control 的動作
    @IBAction func albumSegmentedControlValueChange(_ sender: UISegmentedControl) {
        /// 取得選擇的分頁
        let index = sender.selectedSegmentIndex
        /// 設置 UIScrollView 的 contentOffset 為對應的位置
        let point = CGPoint(
            x: view.bounds.width * CGFloat(index),
            y: 0)
        // 捲動到目標位置
        albumScrollView.setContentOffset(point, animated: true)
        albumPageControl.currentPage = index
        // 顯示對應的 View，並判斷頁數來顯示或隱藏 Button
        showView(at: index)
        buttonHiddenOrNot(at: index)
    }
    // Previous Button 的動作
    @IBAction func previousButtonChangePage(_ sender: UIButton) {
        let currentPage = albumPageControl.currentPage
        /// 檢查是還有上一頁
        if currentPage > 0 {
            // 計算上一頁的位置
            let point = CGPoint(
                x: albumScrollView.bounds.width * CGFloat(currentPage - 1),
                y: 0)
            // 設置 UIScrollView 的 contentOffset 為上一頁的位置
            albumScrollView.setContentOffset(point, animated: true)
            // 更新 PageControl 和 SegmentedControl 的當前頁面
            albumPageControl.currentPage = currentPage - 1
            albumSegmentedControl.selectedSegmentIndex = currentPage - 1
            // 顯示上一頁的 view
            showView(at: currentPage - 1)
        }
    }
    // Next Button 的動作
    @IBAction func nextButtonChangePage(_ sender: UIButton) {
        let currentPage = albumPageControl.currentPage
        /// 檢查是否還有下一頁
        if currentPage < albumPageControl.numberOfPages - 1 {
            // 計算下一頁的位置
            let point = CGPoint(
                x: albumScrollView.bounds.width * CGFloat(currentPage + 1),
                y: 0)
            // 設置 UIScrollView 的 contentOffset 為下一頁的位置
            albumScrollView.setContentOffset(point, animated: true)
            // 更新 PageControl 和 SegmentedControl 的當前頁面
            albumPageControl.currentPage = currentPage + 1
            albumSegmentedControl.selectedSegmentIndex = currentPage + 1
            // 顯示下一頁的 view
            showView(at: currentPage + 1)
        }
    }
    // MARK: - 顯示或隱藏
    // view 的隱藏跟顯示
    func showView(at index: Int) {
        // 根據傳入的 index 來決定哪個 view 要顯示
        view01.isHidden = index != 0
        view02.isHidden = index != 1
        view03.isHidden = index != 2
    }
    // button 的隱藏跟顯示
    func buttonHiddenOrNot(at index: Int) {
        // 根據傳入的 index 來決定哪些 button 要隱藏
        previousButton.isHidden = index == 0
        nextButton.isHidden = index == albumPageControl.numberOfPages - 1
    }
}

