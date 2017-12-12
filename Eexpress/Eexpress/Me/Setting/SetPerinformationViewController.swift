//
//  SetPerinformationViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/12/4.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
import os.log
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
            information=User()
            information?.set_personinformation(name: name.text!, sex: sex.text!, QQ: QQnum.text!)
            saveinformation()
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
