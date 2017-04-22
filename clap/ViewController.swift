//
//  ViewController.swift
//  clap
//
//  Created by 樋口大樹 on 2017/04/21.
//  Copyright © 2017年 樋口大樹. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var clapPickerView: UIPickerView!
    var audioPlayer : AVAudioPlayer!
    var soundCount : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let soundFilePath = Bundle.main.path(forResource: "clap", ofType: "wav")
        let fileURL = URL(fileURLWithPath: soundFilePath!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
        }catch{
            print("音楽ファイルが読み込めませんでした")
        }
        
        clapPickerView.delegate = self
        clapPickerView.dataSource = self
        
    }
    
    @IBAction func playButton(){
    audioPlayer.numberOfLoops = soundCount
    audioPlayer.play()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //いくつカテゴリーを持つか
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //いくつ選択肢をつくるか
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    //選択肢に何を表示していくか１
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row+1)回"
    }
    
    func pickerView(_ pickreView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        soundCount = row
    }

}

