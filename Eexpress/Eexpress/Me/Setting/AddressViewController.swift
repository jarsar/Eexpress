//
//  AddressViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/12/4.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var dormitory: UITextField!
    @IBOutlet weak var doornum: UITextField!
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
    
    @IBAction func confirmbutton(_ sender: UIButton) {
        address?.set_shipaddress(dormitory: dormitory.text!, doornum: doornum.text!)
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
