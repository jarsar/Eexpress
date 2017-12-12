//
//  OrderViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/11/8.
//  Copyright © 2017年 jarson. All rights reserved.
//
import UIKit
import os.log
class OrderViewController: UIViewController ,UITextFieldDelegate{

    var user:User?
    var order:Order?
    @IBOutlet weak var merchandise: UITextField!
    @IBOutlet weak var expressname: UITextField!
    @IBOutlet weak var shelves: UITextField!
    @IBOutlet weak var expressnum: UITextField!
    @IBOutlet weak var reward: UITextField!
    @IBOutlet weak var freetimestart: UITextField!
    @IBOutlet weak var freetimeend: UITextField!
    @IBOutlet weak var confirmbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        merchandise.delegate=self
        expressname.delegate=self
        shelves.delegate=self
        expressnum.delegate=self
        reward.delegate=self
        freetimestart.delegate=self
        freetimeend.delegate=self
        user=loaduser()
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIButton,button===confirmbutton else {
            os_log("The confirm button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let nextpage=segue.destination as? PickTableViewController
        order=Order.init(name: (user?.name)!, stunum: (user?.stunum)!,QQ:(user?.QQ)!,dormitory:(user?.dormitory)!,doornum:(user?.doornum)!, level: (user?.level)!, merchandise: merchandise.text!, expressname: expressname.text!, shelves: shelves.text!, expressnum: expressnum.text!, reward: reward.text!, freetimestart: freetimestart.text!, freetimeend: freetimeend.text!)
        nextpage?.picks.append(order!)
    }
    
    private func loaduser()->User?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? User
    }
}
