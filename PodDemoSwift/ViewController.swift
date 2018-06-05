//
//  ViewController.swift
//  PodDemoSwift
// MVVM的优缺点
// 使用MVVM会轻微的增加代码量，但总体上减少了代码的复杂性
//
//
//  ViewController.swift 主要负责数据的绑定
//  View 和ViewController 不能直接引用model  而是引用viewModel[(视图模型)
//
//  ViewController尽量不涉及业务逻辑  让ViewModel做业务逻辑相关的事情
//  ViewController 只是做中间人 接收view的事件调用ViewModel的方法 响应ViewModel的变化
//  Created by 杨学武 on 2018/5/29.
//  Created by 杨学武 on 2018/6/1.
//  Copyright © 2018年 leedian. All rights reserved.
//

import UIKit
//import Person
import podlib  // 引入自定义的pod库
//import Alamofire
class ViewController: UIViewController,ViewModelDelegate {
 
    
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var viewModel: ViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        viewModel.delegate = self

        userNameField.addTarget(self, action: #selector(userNameChanged), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(passwordChanged), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(LoginBtn), for: .touchUpInside)
        
        
        
//        let button:UIButton = UIButton(type:.contactAdd)   //创建一个ContactAdd类型的按钮
//        button.frame=CGRect(x:10,y: 150,width: 100,height:30)  //设置按钮位置和大小
//        button.setTitle("按钮", for:UIControlState.normal) //设置按钮文字
//        button.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
//        self.view.addSubview(button);
    }
    
//    @objc func clickBtn() {
//        print("click ")
//        let sencod = SencodViewController()
//        self.present(sencod, animated: true, completion: nil)
//    }

    
    @objc func LoginBtn() {
        viewModel.login()
//        print("wilson login")
//
     //   getDataFromNet()
        
        
    }
    
    

    func reloadViews() {
        userNameField.layer.borderColor = viewModel.userNameBorderColor?.cgColor
        userNameField.layer.borderWidth = 3
        passwordField.layer.borderColor = viewModel.passwordBorderColor?.cgColor
        passwordField.layer.borderWidth = 3
        loginButton.isEnabled = viewModel.loginButtonEnable
    }
    
    func alertInfo() {
        
    }
    
    func moveToHomeScreen() {
        print("跳转")
        let sencod = SencodViewController()
        self.present(sencod, animated: true, completion: nil)
    }
    
    //MARK: Action
    @objc dynamic func userNameChanged() {
        viewModel.userNameDidChange(text: userNameField.text)
    }
    
    @objc dynamic func passwordChanged() {
        viewModel.passwordDidChange(text: passwordField.text)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

