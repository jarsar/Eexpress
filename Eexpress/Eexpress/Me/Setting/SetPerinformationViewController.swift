//
//  SetPerinformationViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/12/4.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit

class SetPerinformationViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var sex: UITextField!
    @IBOutlet weak var QQnum: UITextField!
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
    

    @IBAction func confirmbutton(_ sender: UIButton) {
        information?.set_personinformation(name: name.text!, sex: sex.text!, QQ: QQnum.text!)
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
