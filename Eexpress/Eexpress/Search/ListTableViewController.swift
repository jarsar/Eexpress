//
//  ListTableViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/12/6.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
import os.log
class ListTableViewController: UITableViewController {

    var lists=[Order]()
    var busslist=[Receive]()
    var receivelists=[Order]()
    var searchget:Search?
    var buss:Receive?
    var user:User?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem=self.editButtonItem
        self.navigationItem.rightBarButtonItem?.title="接单"
        user=loaduser()
        get_searchlist()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return lists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ListTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ListTableViewCell else {
            fatalError("The dequeued cell is not an instance of ListTableViewCell.")
        }
        
        let list=lists[indexPath.row]
        cell.name.text=list.name
        cell.level.text=list.level
        cell.stunum.text=list.stunum
        cell.expressnum.text=list.expressnum
        cell.shelves.text=list.shelves
        cell.expressnum.text=list.expressname
        cell.reward.text=list.reward
        cell.freetimestart.text=list.freetimestart
        cell.freetimeend.text=list.freetimeend
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
            // Delete the row from the data source
            let merchandise=lists[indexPath.row].merchandise
            let oname=lists[indexPath.row].name
            let ostunum=lists[indexPath.row].stunum
            let oQQ=lists[indexPath.row].QQ
            let odormitory=lists[indexPath.row].dormitory
            let odoornum=lists[indexPath.row].doornum
            let olevel=lists[indexPath.row].level
            
            let rname=user?.name
            let rstunum=user?.stunum
            let rQQ=user?.QQ
            let rdormitory=user?.dormitory
            let rdoornum=user?.doornum
            let rlevel=user?.level
            
            buss=Receive.init(merchandise: merchandise, oname: oname, ostunum: ostunum, oQQ: oQQ, odormitory: odormitory, odoornum: odoornum, olevel: olevel, rname: rname!, rstunum: rstunum!, rQQ: rQQ!, rdormitory: rdormitory!, rdoornum: rdoornum!, rlevel: rlevel!)
            busslist.append(buss!)
            savebusinsee()
            lists.remove(at: indexPath.row)
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
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if(self.isEditing){
            self.editButtonItem.title="完成"
        }else{
            self.editButtonItem.title="接单"
        }
    }
    func get_searchlist(){
        
    }
    private func savebusinsee(){
        let isSuccessfulSaveBusinsee = NSKeyedArchiver.archiveRootObject(busslist, toFile: Receive.OArchiveURL.path)
        if isSuccessfulSaveBusinsee{
            os_log("business successfully saved.", log: OSLog.default, type: .debug)
        }else{
            os_log("Failed to save business...", log: OSLog.default, type: .error)
        }
    }
    
    private func loaduser()->User?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? User
    }
}
