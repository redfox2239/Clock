//
//  ViewController.swift
//  時計アプリ
//
//  Created by HARADA REO on 2015/10/27.
//  Copyright © 2015年 reo harada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clockLabel: UILabel!
    // タイマーを用意する
    var timer: NSTimer!
    @IBOutlet weak var clockImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 今の時間を取得
        let now = NSDate()
        // 翻訳者を用意する
        let formatter = NSDateFormatter()
        // 翻訳形式を決める
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        // 翻訳してもらう
        let nowTime = formatter.stringFromDate(now)
        
        // ラベルを変更
        self.clockLabel.text = nowTime
        
        // タイマーをセットする
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTime", userInfo: nil, repeats: true)
    }
    
    // updateTimeを呼ばれたらどうする？
    func updateTime() {
        // 今の時間を取得
        let now = NSDate()
        // 翻訳者を用意する
        let formatter = NSDateFormatter()
        // 翻訳形式を決める
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        // 翻訳してもらう
        let nowTime = formatter.stringFromDate(now)
        
        // ラベルを変更
        self.clockLabel.text = nowTime
        
        // 今の秒数を取得
        formatter.dateFormat = "ss"
        let nowSecond = formatter.stringFromDate(now)
        // 上の秒数×6xπ÷180で角度を出す
        // M_PIがDoubleで、nowSecondをDoubleに変換
        let angle = Double(nowSecond)! * 6 * M_PI / 180
        // 上の角度で画像を回転する
        self.clockImageView.transform = CGAffineTransformMakeRotation(CGFloat(angle))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapStartButton(sender: AnyObject) {
        // タイマーを再セットする
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTime", userInfo: nil, repeats: true)
    }

    
    @IBAction func tapStopButton(sender: AnyObject) {
        // タイマーを止める
        self.timer.invalidate()
    }
}

