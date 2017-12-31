//
//  BusinessTableViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/12/6.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
import Alamofire
import os.log
class BusinessTableViewController: UITableViewController {

    var buss=[Receive]()
    var user:User?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.rightBarButtonItem=self.editButtonItem
        self.navigationItem.rightBarButtonItem?.title="确认交货"
        //        if let savedbusiness=loadbusiness(){
        //            buss+=savedbusiness
        //        }
        get_buss()
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
        return buss.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier="BusinessTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BusinessTableViewCell else{
            fatalError("The dequeued cell is not an instance of BusinessTableViewCell.")
        }
        
        let bus=self.buss[indexPath.row]
        cell.merchandise.text=bus.merchandise
        cell.oname.text=bus.oname
        cell.ostunum.text=bus.ostunum
        cell.oQQ.text=bus.oQQ
        cell.odormitory.text=bus.odormitory
        cell.odoornum.text=bus.odoornum
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var bus=buss[indexPath.row]
            let json_evaluation=[
                "merchandise":bus.merchandise,
                "name":bus.oname,
                "stunum":bus.rstunum,
                "anotherstunum":bus.ostunum,
                "level":bus.olevel
            ]
            
            let json_merchandise=[
                "merchandise":bus.merchandise,
                "ostunum":bus.ostunum,
                "rstunum":bus.rstunum
            ]
            Alamofire.request("http://localhost:3000/evaluation", method: .post, parameters: json_evaluation, encoding: JSONEncoding.default, headers: nil)
            Alamofire.request("http://localhost:3000/business/delete", method: .post, parameters: json_merchandise, encoding: JSONEncoding.default, headers: nil)
            buss.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

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
    private func get_buss(){
        user=loaduser()
        let json_stunum=[
            "stunum":user?.stunum
        ]
        Alamofire.request("http://localhost:3000/business",parameters: json_stunum).validate().responseJSON{
            response in switch response.result.isSuccess{
            case true:
                if let value=response.value{
                    var json=JSON(value)
                    print(json.count)
                    for i in 0..<json.count{
                        let getbuss=Receive.init(merchandise: json[i]["merchandise"].string!, oname: json[i]["oname"].string!, ostunum: json[i]["ostunum"].string!, oQQ: json[i]["oQQnum"].string!, odormitory: json[i]["odormitory"].string!, odoornum: json[i]["odoornum"].string!, olevel: json[i]["olevel"].string!, rname: json[i]["rname"].string!, rstunum: json[i]["rstunum"].string!, rQQ: json[i]["rQQnum"].string!, rdormitory: json[i]["rdormitory"].string!, rdoornum: json[i]["rdoornum"].string!, rlevel: json[i]["rlevel"].string!)
                        self.buss.append(getbuss!)
                    }
                    self.tableView.reloadData()
                    os_log("getorder successfully saved.", log: OSLog.default, type: .debug)
                }
            case false:
                os_log("Failed to get user order...", log: OSLog.default, type: .error)
            }
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if(self.isEditing){
            self.editButtonItem.title="完成"
        }else{
            self.editButtonItem.title="确认交货"
        }
    }
    
    private func loadbusiness()->[Receive]?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: Receive.OArchiveURL.path) as? [Receive]
    }
    
    private func loaduser()->User?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? User
    }
}
