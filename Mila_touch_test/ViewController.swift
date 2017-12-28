//
//  ViewController.swift
//  Mila_touch_test
//
//  Created by 蔡孟軒 on 2017/11/14.
//  Copyright © 2017年 Mila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tt: Date = Date()
    var TT = String()
    
    //檔名
    var ttfilename: Date = Date()
    var TTFileName = String()
    
    //原資料
    //var nameArray = Array<String>()
    var valueArray = Array<String>()
    //var valueArray = Double[]
    
    //time字串
    var timestring = String()
    //是否存取
    var rememberData = false
    //存取時間
    var rememtime = false
    //手勢次數
    var dotimes = 1
    
    //@IBOutlet weak var captureMessage: UITextField!
    
  
    var captureMessage: UITextView!
   
    
    var isOver = false
    
    @IBOutlet weak var messageLable: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    

    

    @IBAction func makeGesture(_ sender: UIButton) {
        
        let inputName =  inputTextField.text!
        inputTextField.text="" //clear,textfield
        
        print("inputname = \(inputName)")
        //nameArray.append(inputname)
        
        if inputName == "" {
            // either nmaeis empty
            messageLable.text = "Please make sure that your name!!"
        }else{
             messageLable.text = "Hello \(inputName), Star your multiple touches!!"
            }
            
            
         rememberData = true
        
        //重新計算資料
        valueArray.removeAll()
        
        //檔名
        ttfilename = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        TTFileName = formatter.string(from: ttfilename)
        print(TTFileName) //Record time
        
    }
    
    
    
    
 override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
override func viewDidLoad() {
        self.view.isMultipleTouchEnabled = true
        super.viewDidLoad()
        //inputTextField.becomeFirstResponder() //push keyboard on
        // Do any additional setup after loading the view, typically from a nib.
    
        // 使用 UITextView(frame:) 建立一個 UITextView
        //captureMessage = UITextView(
        //frame: CGRect(x: 0, y: 0, width: 700, height: 100))
        // 背景顏色
        //captureMessage.backgroundColor = UIColor.darkGray
        // 文字顏色
        //captureMessage.textColor = UIColor.white
        // 文字字型及大小
        //captureMessage.font = UIFont(name: "Helvetica-Light", size: 20)
        // 文字向左對齊
        //captureMessage.textAlignment = .left
        // 適用的鍵盤樣式 這邊選擇預設的
        //captureMessage.keyboardType = .default
        // 鍵盤上的 return 鍵樣式 這邊選擇預設的
        //captureMessage.returnKeyType = .default
    
        // 取得螢幕的尺寸
        //let fullScreenSize = UIScreen.main.bounds.size
    
        // 設置於畫面的中間偏上位置
         //captureMessage.center = CGPoint(
        //x: fullScreenSize.width * 0.5,
        //y: fullScreenSize.height * 0.25)
    
        // 加入畫面
        //self.view.addSubview(captureMessage)
    
    }

    
    var fingers = [String?](repeating: nil, count:5)
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         if rememberData == true{
            
        super.touchesBegan(touches, with: event)
        for touch in touches{
            let point = touch.location(in: self.view)
            for (index,finger)  in fingers.enumerated() {
                if finger == nil {
                    fingers[index] = String(format: "%p", touch)
                    print("finger \(index+1): x=\(point.x) , y=\(point.y)")
                    
                    //valueArray.append(String(describing: point.x))
                    //valueArray.append(String(describing: point.y))
                    
                    let fingerCouter = "finger \(index+1)"
                    
                    var coordinateDict:[String:[CGFloat]] = [fingerCouter:[point.x,point.y]]
                    dump(coordinateDict)
                    
                    //let ponintValue = coordinateDict
                    //valueArray.append(String(describing: ponintValue))
                    //print(valueArray)
                    //captureMessage.text = String(describing:  valueArray)
                    //captureMessage.text = String(describing: coordinateDict)
                    
                    
                    break
                }
            }
        }
        
    }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         if rememberData == true{
        super.touchesMoved(touches, with: event)
        for touch in touches {
            let point = touch.location(in: self.view)
            for (index,finger) in fingers.enumerated() {
                if let finger = finger, finger == String(format: "%p", touch) {
                    print("finger \(index+1): x=\(point.x) , y=\(point.y)")
                    
                    valueArray.append(String(describing: point.x))
                    valueArray.append(String(describing: point.y))
                    /*for element in valueArray {
                     print(element, terminator: " ")
                     }*/
                    
                    let fingerCouter = "finger \(index+1)"
                    
                    var coordinateDict:[String:[CGFloat]] = [fingerCouter:[point.x,point.y]]
                    dump(coordinateDict)
                    
                    let ponintValue = coordinateDict
                    //valueArray.append(String(describing: ponintValue))
                    //print(valueArray)
                    
                    //captureMessage.text = String(describing:  valueArray)
                    //captureMessage.text = String(describing: coordinateDict)
                    
                    break
                    
                }
            }
        }
        
    }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if rememberData == true{
        
        super.touchesEnded(touches, with: event)
        for touch in touches {
            for (index,finger) in fingers.enumerated() {
                if let finger = finger, finger == String(format: "%p", touch) {
                    fingers[index] = nil
                    break
                }
            }
        }
        print("event end!")
        //captureMessage.text="" //clear,textfield
        rememberData = false
        return messageLable.text = "event end! Get one records"
        //return rememberData = false
     }
     
    }
    
    
    override func touchesCancelled(_ touches: Set<UITouch>?, with event: UIEvent?) {
        super.touchesCancelled(touches!, with: event)
        guard let touches = touches else {
            return
        }
        touchesEnded(touches, with: event)
    }
    
   
}





