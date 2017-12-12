//
//  ReceiveTableViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/12/6.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
import os.log
class ReceiveTableViewController: UITableViewController {

    var recs=[Receive]()
    var recds=[Receive]()
    var recd:Receive?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem=self.editButtonItem
        self.navigationItem.rightBarButtonItem?.title="确认收货"
        
        get_receivedlist()
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
        return recs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ReceiveTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ReceiveTableViewCell else {
            fatalError("The dequeued cell is not an instance of ReceiveTableViewCell.")
        }

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
            recd=recs[indexPath.row]
            recds.append(recd!)
            savereceived()
            recs.remove(at: indexPath.row)
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
            self.editButtonItem.title="确认收货"
        }
    }
    
    private func savereceived(){
        let isSuccessfulSaveReceived = NSKeyedArchiver.archiveRootObject(recds, toFile: Receive.UArchiveURL.path)
        if isSuccessfulSaveReceived{
            os_log("recds successfully saved.", log: OSLog.default, type: .debug)
        }else{
            os_log("Failed to save recds...", log: OSLog.default, type: .error)
        }
    }
    func get_receivedlist(){
        
    }
}
