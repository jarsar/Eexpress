//
//  AddressViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/12/4.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
import os.log
class AddressViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var dormitory: UITextField!
    @IBOutlet weak var doornum: UITextField!
    @IBOutlet weak var showerror: UILabel!
    @IBOutlet weak var confirmbutton: UIButton!
    var address:User?
    override func viewDidLoad() {
        super.viewDidLoad()
        dormitory.delegate=self
        doornum.delegate=self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func saveaddress(){
        let isSuccessfulSaveAddress=NSKeyedArchiver.archiveRootObject(address, toFile: User.ArchiveURL.path)
        if isSuccessfulSaveAddress{
            os_log("address successful saved.", log:OSLog.default,type:.debug)
        }else{
            os_log("Failed to save address...", log: OSLog.default, type: .error)
        }
    }
    @IBAction func confirmjump(_ sender: UIButton) {
        if dormitory.text != "",doornum.text != ""{
            address=User()
            address?.set_shipaddress(dormitory: dormitory.text!, doornum: doornum.text!)
            saveaddress()
            self.navigationController?.popViewController(animated: true)
        }else{
            showerror.text="地址不完整!"
            dormitory.text=""
            doornum.text=""
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
