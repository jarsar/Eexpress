//
//  LoginViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/11/8.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
class LoginViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var stunum: UITextField!

    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        stunum.delegate=self
        password.delegate=self
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginbutton(_ sender: UIButton) {
        var login=Login(stunum: stunum.text!,password: password.text!)
//        print(login.toJSONString()!)
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
