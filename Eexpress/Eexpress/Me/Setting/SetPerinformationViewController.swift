//
//  SetPerinformationViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/12/4.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
import os.log
import Alamofire
class SetPerinformationViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var sex: UITextField!
    @IBOutlet weak var QQnum: UITextField!
    @IBOutlet weak var showerror: UILabel!
    @IBOutlet weak var confirmbutton: UIButton!
    var information:User?
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate=self
        sex.delegate=self
        QQnum.delegate=self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func confirmjump(_ sender: UIButton) {
        if name.text != "",sex.text != "",QQnum.text != ""{
            information=loaduser()
            information?.set_personinformation(name: name.text!, sex: sex.text!, QQ: QQnum.text!)
            saveinformation()
            let json_user=[
                "name":information?.name,
                "stunum":information?.stunum,
                "sex":information?.sex,
                "QQnum":information?.QQnum,
                "dormitory":information?.dormitory,
                "doornum":information?.doornum,
                "level":information?.level
            ]
             Alamofire.request("http://localhost:3000/user/setperinformation", method:.put, parameters:json_user, encoding: JSONEncoding.default, headers: nil)
            self.navigationController?.popViewController(animated: true)
        }else{
            showerror.text="信息不完整!"
            name.text=""
            sex.text=""
            QQnum.text=""
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
    private func saveinformation(){
        let isSuccessfullSaveInformation = NSKeyedArchiver.archiveRootObject(information, toFile: User.ArchiveURL.path)
        if isSuccessfullSaveInformation{
            os_log("information successful saved", log: OSLog.default, type: .debug)
        }else{
            os_log("Failed to save information...", log: OSLog.default, type: .error)
        }
    }
}

private func loaduser()->User?{
    return NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? User
}
