//
//  PickTableViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/12/6.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
import os.log
import Alamofire
class PickTableViewController: UITableViewController {

    var picks=[Order]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        if let savedpicks=loadpicks(){
//            picks += savedpicks
//        }
        get_userorder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return picks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier="PickTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PickTableViewCell else{
            fatalError("The dequeued cell is not an instance of PickTableViewCell.")
        }

        // Configure the cell...
        let pick=picks[indexPath.row]
        
        cell.merchandise.text=pick.merchandise
        cell.expressname.text=pick.expressname
        cell.shelves.text=pick.shelves
        cell.expressnum.text=pick.expressnum
        cell.reward.text=pick.reward
        cell.freetimestart.text=pick.freetimestart
        cell.freetimeend.text=pick.freetimeend
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    private func get_userorder(){
        var user=loaduser()
        let json_user=[
            "name":user?.name,
            "stunum":user?.stunum,
            "sex":user?.sex,
            "QQnum":user?.QQnum,
            "dormitory":user?.dormitory,
            "doornum":user?.doornum,
            "level":user?.level
        ]
//        let url = URL(string:"http://localhost:3000/order")
        Alamofire.request("http://localhost:3000/order",parameters: json_user).validate().responseJSON{
            response in switch response.result.isSuccess{
            case true:
                if let value=response.value{
                    let json=JSON(value)
                    for i in 0..<json.count{
                        var getpick=Order.init(name: json[i]["name"].string!, stunum: json[i]["stunum"].string!, QQ: json[i]["QQnum"].string!, dormitory: json[i]["dormitory"].string!, doornum: json[i]["doornum"].string!, level: json[i]["level"].string!, merchandise: json[i]["merchandise"].string!, expressname: json[i]["expressname"].string!, shelves: json[i]["shelves"].string!, expressnum: json[i]["expressnum"].string!, reward: json[i]["reward"].string!, freetimestart: json[i]["freetimestart"].string!, freetimeend: json[i]["freetimeend"].string!)
                        if self.picks.contains(getpick!)==false{
                            self.picks.append(getpick!)
                        }
                    }
                    self.tableView.reloadData()
                    self.saveOrder()
                    os_log("getorder successfully saved.", log: OSLog.default, type: .debug)
                }
            case false:
                os_log("Failed to get user order...", log: OSLog.default, type: .error)
            }
        }
//        Alamofire.request(url!).validate().responseJSON{
//            response in switch response.result.isSuccess{
//            case true:
//                if let value=response.value{
//                    let json=JSON(value)
//                    print(json.count)
//                    for i in 0..<json.count{
//                        if json[i]["stunum"].string==user?.stunum{
//                            var getpick=Order.init(name: json[i]["name"].string!, stunum: json[i]["stunum"].string!, QQ: json[i]["QQnum"].string!, dormitory: json[i]["dormitory"].string!, doornum: json[i]["doornum"].string!, level: json[i]["level"].string!, merchandise: json[i]["merchandise"].string!, expressname: json[i]["expressname"].string!, shelves: json[i]["shelves"].string!, expressnum: json[i]["expressnum"].string!, reward: json[i]["reward"].string!, freetimestart: json[i]["freetimestart"].string!, freetimeend: json[i]["freetimeend"].string!)
//                            if self.picks.contains(getpick!)==false{
//                                self.picks.append(getpick!)
//                            }
//                        }
//                    }
//                    self.tableView.reloadData()
//                    self.saveOrder()
//                os_log("getorder successfully saved.", log: OSLog.default, type: .debug)
//                }
//            case false:
//                os_log("Failed to get user order...", log: OSLog.default, type: .error)
//            }
//        }
    }
    
    private func saveOrder(){
        let isSuccessfulSaveOrder = NSKeyedArchiver.archiveRootObject(picks, toFile: Order.ArchiveURL.path)
        if isSuccessfulSaveOrder{
            os_log("picks successfully saved.", log: OSLog.default, type: .debug)
        }else{
            os_log("Failed to save picks...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadpicks()->[Order]?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: Order.ArchiveURL.path) as? [Order]
    }
    private func loaduser()->User?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? User
    }
}
