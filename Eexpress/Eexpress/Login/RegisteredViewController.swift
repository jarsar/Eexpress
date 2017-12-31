//
//  RegisteredViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/11/21.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
import os.log
import Alamofire
class RegisteredViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var usernum: UITextField!
    @IBOutlet weak var sex: UITextField!
    @IBOutlet weak var QQ: UITextField!
    @IBOutlet weak var dormitory: UITextField!
    @IBOutlet weak var doornum: UITextField!
    @IBOutlet weak var userpassword1st: UITextField!
    @IBOutlet weak var userpassword2nd: UITextField!
    @IBOutlet weak var information: UILabel!
    @IBOutlet weak var confirm: UIButton!

    var num="a"
    var password1="b"
    var password2="c"
    var user:User?
    var login:Login?
    var dakeychain = DAKeychain.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernum.delegate=self
        userpassword1st.delegate=self
        userpassword2nd.delegate=self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func ConfirmPassword(_ sender: UIButton) {
        num=usernum.text!
        password1=userpassword1st.text!
        password2=userpassword2nd.text!
        user=User.init(name: username.text!, stunum: usernum.text!, sex:sex.text!,QQ: QQ.text!, dormitory: dormitory.text!, doornum: doornum.text!,level: "2.5")
        if (password1==password2 && password1 != ""){
            login=Login.init(stunum: usernum.text!, password: password1)
            saveUser()
            let json_login=[
                "stunum":usernum.text!,
                "password":password1
            ]
            let json_user=[
                "name":username.text!,
                "stunum":usernum.text!,
                "sex":sex.text!,
                "QQnum":QQ.text!,
                "dormitory":dormitory.text!,
                "doornum":doornum.text!,
                "level":"2.5"
            ]
            Alamofire.request("http://localhost:3000/login", method:.post, parameters:json_login, encoding: JSONEncoding.default, headers: nil)
            Alamofire.request("http://localhost:3000/user", method:.post, parameters:json_user, encoding: JSONEncoding.default, headers: nil)
            self.navigationController?.popViewController(animated: true)
        }
        else{
            information.text="密码输入有误,请再次输入"
            userpassword1st.text=""
            userpassword2nd.text=""
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//        let nextpage=segue.destination as? HomeViewController
//        nextpage?.editButtonItem.title="已登录"
//    }
    
    private func saveUser(){
        let isSuccessfulSaveUser = NSKeyedArchiver.archiveRootObject(user, toFile: User.ArchiveURL.path)
        if isSuccessfulSaveUser {
            os_log("user successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save user...", log: OSLog.default, type: .error)
        }
        let isSuccessfulSaveLogin = NSKeyedArchiver.archiveRootObject(login, toFile: Login.ArchiveURL.path)
        if isSuccessfulSaveLogin {
            os_log("login successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save login...", log: OSLog.default, type: .error)
        }
    }
}
