//
//  SencodViewController.swift
//  PodDemoSwift
//
//  Created by 杨学武 on 2018/6/1.
//  Copyright © 2018年 leedian. All rights reserved.
//
import Alamofire
import UIKit
// pod 里面的外部暴露的时候 类 ,方法 要使用public修饰
public class SencodViewController: UIViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        //创建一个ContactAdd类型的按钮
        let button:UIButton = UIButton(type:.contactAdd)
        //设置按钮位置和大小
        button.frame=CGRect(x:200,y: 150,width: 100,height:30)
        //设置按钮文字
        button.setTitle("sencond", for:UIControlState.normal)
        
        button.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
        self.view.addSubview(button);
        
  //        加载资源文件夹的图片xcassets 资源
        let urlPath = Bundle(for: type(of: self)).url(forResource: "podlib.bundle", withExtension: nil)
        let mybundle = Bundle.init(url: urlPath!)
        let myimage = UIImage(named: "BG-1.png", in: mybundle, compatibleWith: nil)
        print(myimage!)
        let imageView = UIImageView(frame: CGRect(x:100,y:10,width:200, height:200))
        imageView.image = myimage
        self.view.addSubview(imageView)
        
        
//        let urlPath = Bundle(for: type(of: self)).url(forResource: "podlib.bundle", withExtension: nil)
//        let mybundle = Bundle.init(url: urlPath!)
//        let myimage = UIImage(named: "wilson.jpg", in: mybundle, compatibleWith: nil)
//        print(myimage!)
//        let imageView = UIImageView(frame: CGRect(x:100,y:10,width:200, height:200))
//        imageView.image = myimage
//        self.view.addSubview(imageView)
        
        
        //加载资源文件夹的xib文件
//        let urlPath = Bundle(for: type(of: self)).url(forResource: "podlib.bundle", withExtension: nil)
//        let mybundle = Bundle.init(url: urlPath!)
//        let nib =  UINib(nibName: "libView", bundle: mybundle)
//        let myUiView = nib.instantiate(withOwner: nil, options: nil)[0] as? UIView
//        self.view.addSubview(myUiView!)
        
       // getDataFromNet()
        // Do any additional setup after loading the view.
    }

    @objc func clickBtn() {
       dismiss(animated: true, completion: nil)
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getDataFromNet() {
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle: Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
}
