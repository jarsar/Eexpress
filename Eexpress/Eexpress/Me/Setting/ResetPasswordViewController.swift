//
//  ResetPasswordViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/12/4.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var oldpassword: UITextField!
    @IBOutlet weak var newpassword1: UITextField!
    @IBOutlet weak var newpassword2: UITextField!
    var password:Login?
    override func viewDidLoad() {
        super.viewDidLoad()
        oldpassword.delegate=self
        newpassword1.delegate=self
        newpassword2.delegate=self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmbutton(_ sender: UIButton) {
        let newpassword=newpassword1.text
        password?.set_password(password: newpassword!)
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
