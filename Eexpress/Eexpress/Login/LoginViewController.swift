//
//  LoginViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/11/8.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
import Alamofire
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
        let json_login=[
            "stunum":stunum.text!,
            "password":password.text!
        ]
        Alamofire.request("http://localhost:3000/login", method:.post, parameters:json_login, encoding: JSONEncoding.default, headers: nil)
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
