//
//  SearchViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/12/4.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UITextFieldDelegate {


    @IBOutlet weak var dormitory: UITextField!
    @IBOutlet weak var expressname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        dormitory.delegate = self
        expressname.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func searchbutton(_ sender: UIButton) {
        var search=Search(dormitory: dormitory.text!,expressname: expressname.text!)

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
