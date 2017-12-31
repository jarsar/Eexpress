//
//  HomeViewController.swift
//  Eexpress
//
//  Created by jarson on 2017/11/7.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem=self.editButtonItem
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        rightBarButtonshow()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func rightBarButtonshow(){
        if(self.is_login())!{
            self.editButtonItem.title="已登录"
        }else{
            self.editButtonItem.title="注册"
        }
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if(self.isEditing){
            let nextview=self.storyboard?.instantiateViewController(withIdentifier: "RegisteredViewController")
            self.navigationController!.pushViewController(nextview!, animated: true)
        }
    }
    
    private func is_login()->Bool?{
        if let login=loadlogin(){
            return true
        }
        return false
    }
    
    private func loadlogin()->Login?{
        return NSKeyedUnarchiver.unarchiveObject(withFile: Login.ArchiveURL.path) as? Login
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
