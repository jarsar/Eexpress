//
//  ResetPasswordViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/12/4.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
import os.log
import Alamofire
class ResetPasswordViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var oldpassword: UITextField!
    @IBOutlet weak var newpassword1: UITextField!
    @IBOutlet weak var newpassword2: UITextField!
    @IBOutlet weak var showerror: UILabel!
    @IBOutlet weak var confirmbutton: UIButton!
    var password:Login?
    var oldlogin:Login?
    override func viewDidLoad() {
        super.viewDidLoad()
        oldpassword.delegate=self
        newpassword1.delegate=self
        newpassword2.delegate=self
        oldlogin=loadpassword()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func judgepassword(){
        if oldpassword.text==oldlogin?.password{
            if newpassword1.text == newpassword2.text{
                password=loadpassword()
                password?.set_password(password: newpassword1.text!)
                savepassword()
                let json_login=[
                    "stunum":password?.stunum,
                    "password":password?.password
                ]
                 Alamofire.request("http://localhost:3000/login/resetpassword", method:.put, parameters:json_login, encoding: JSONEncoding.default, headers: nil)
                self.navigationController?.popViewController(animated: true)
            }else{
                showerror.text="两次密码不一致!"
                oldpassword.text=""
                newpassword1.text=""
                newpassword2.text=""
            }
        }else{
            self.showerror.text="旧密码输入错误!"
            oldpassword.text=""
            newpassword1.text=""
            newpassword2.text=""
        }
    }
    
    @IBAction func confirmjump(_ sender: Any) {
        judgepassword()
    }
    
    private func savepassword(){
        let isSUccessfullSavePassword=NSKeyedArchiver.archiveRootObject(password, toFile: Login.ArchiveURL.path)
        if isSUccessfullSavePassword{
            os_log("password successful saved.", log:OSLog.default,type:.debug)
        }else{
            os_log("Failed to save password...", log: OSLog.default, type: .error)
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
    private func loadpassword()->Login?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: Login.ArchiveURL.path) as? Login
    }
}
