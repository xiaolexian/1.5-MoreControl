//
//  ViewController.swift
//  1.5-MoreControl
//
//  Created by liudeng on 16/2/23.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var accountTextFiled: UITextField!
    @IBOutlet weak var pwdTextFiled: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var sliderNum: UILabel!
    
      override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置默认身高数值
        sliderNum.text = "80"
  
    }
    
    
    // 滑竿数值改变时调用此方法
    @IBAction func sliderValueChanged(sender: UISlider) {
        let sliderStr = String(format: "%.0f", sender.value) // 取的滑竿滑动时的实时值并赋值给显示身高文本
        sliderNum.text = sliderStr
    }
    
         @IBAction func login(sender: AnyObject) {
        
        // 0.获得账号输入框内的内容
        let getAccountStr = accountTextFiled.text!
        
        // 1.获取密码输入框内的内容
        let getPWDStr = pwdTextFiled.text!

        // 2.获取身高单位厘米
        let getBabyHeightStr = sliderNum.text!
        
        // 3.获取性别(用了三目运算符进行判断)
        let getSegmentedContent = segmentControl.selectedSegmentIndex == 1 ? "小美女" : "小帅哥"

        // 4.获取是否5~6岁(用了三目运算符进行判断)
        let swithStr = mySwitch.on ? "是" : "否"

         // 5.获取宝宝生日
        let dateFormater = NSDateFormatter()    // 实例化日期格式对象
        dateFormater.dateFormat = "yyyy-MM-dd"  // 具体格式yyyy:代表年份,MM:代表月份,dd:代表天,当然还有小时:HH, 分钟:mm,秒:ss(注意大小写)
        let getDateContent = dateFormater.stringFromDate(myDatePicker.date)
        
        
        // 6.添加弹框用来显示登录信息
        // 6.1 添加弹框控制器
        let alertController = UIAlertController(title: "登录结果", message: "账号:\(getAccountStr)\n 密码:\(getPWDStr)\n 身高: \(getBabyHeightStr)cm \n  性别: \(getSegmentedContent)\n 是否5~6岁: \(swithStr) \n宝宝生日: \(getDateContent)", preferredStyle: .Alert)
        // 6.2 实例化确定按钮,并在alertController添加确定按钮
        let commitBtn = UIAlertAction(title: "确定", style: .Default, handler: nil)
         alertController.addAction(commitBtn)
        // 6.3 用模态的方式弹出控制器
        presentViewController(alertController, animated: true, completion: nil)


        print("点击我了")
    }
   
    @IBAction func backgroundTap(sender: UIControl) {
        accountTextFiled.resignFirstResponder()
        pwdTextFiled.resignFirstResponder()
    }
 
}

