//
//  ViewController.swift
//  swift_day01
//
//  Created by lvAsia on 16/5/3.
//  Copyright © 2016年 answe lv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    var Counter = 0.0
    var Timer = NSTimer()
    var IsPalying = false
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        return UIStatusBarStyle.Default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = String(Counter)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    

    @IBAction func resetBtnAction(sender: AnyObject) {
        
        Timer.invalidate()
        IsPalying = false
        Counter = 0
        timeLabel.text = String(Counter)
        playBtn.enabled = true
        pauseBtn.enabled  = true
        
    }

    @IBAction func playBtnAction(sender: AnyObject) {
        
        if (IsPalying) {
            return
        }
        playBtn.enabled = false
        pauseBtn.enabled = true
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.UpdateTimer), userInfo: nil, repeats: true)
        IsPalying = true
        
        
    }
    @IBAction func pauseBtnAction(sender: AnyObject) {
        
        playBtn.enabled = true
        pauseBtn.enabled = false
        Timer.invalidate()
        IsPalying = false
        
    }
    
    func UpdateTimer() {
        Counter = Counter + 0.1
        timeLabel.text = String(format: "%.1f",Counter)
        
    }
}

