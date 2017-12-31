//
//  SearchViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/12/4.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
import os.log
class SearchViewController: UIViewController,UITextFieldDelegate {


    @IBOutlet weak var dormitory: UITextField!
    @IBOutlet weak var expressname: UITextField!
    @IBOutlet weak var searchbutton: UIButton!
    var search:Search?
    override func viewDidLoad() {
        super.viewDidLoad()
        dormitory.delegate = self
        expressname.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        dormitory.text=""
        expressname.text=""
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button=sender as? UIButton,button===searchbutton else {
            os_log("The search button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let nextpage=segue.destination as? ListTableViewController
        search=Search.init(dormitory: dormitory.text!, expressname: expressname.text!)
        nextpage?.searchget=search
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
