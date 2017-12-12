//
//  Login.swift
//  Eexpress
//
//  Created by jarson on 2017/12/4.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
import os.log
class Login:NSObject,NSCoding{
    var stunum:String=""
    var password:String=""
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("login")
    
    override init() {
        
    }
    init?(stunum:String,password:String) {
        self.stunum=stunum
        self.password=password
    }
    
    func set_login(stunum:String,password:String){
        self.stunum=stunum
        self.password=password
    }
    
    func set_password(password:String){
            self.password=password
    }
    
    struct PropertyKey{
        static let stunum="stunum"
        static let password="password"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(stunum,forKey:PropertyKey.stunum)
        aCoder.encode(password,forKey:PropertyKey.password)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let stunum = aDecoder.decodeObject(forKey: PropertyKey.stunum) as? String else {
            os_log("Unable to decode the stunum for a Eexpress object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let password = aDecoder.decodeObject(forKey: PropertyKey.password) as? String else {
            os_log("Unable to decode the password for a Eexpress object.", log: OSLog.default, type: .debug)
            return nil
        }
        self.init(stunum: stunum, password: password)
    }
}
