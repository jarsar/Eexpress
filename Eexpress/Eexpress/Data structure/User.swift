//
//  User.swift
//  Eexpress
//
//  Created by jarson on 2017/12/4.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
import os.log
class User:NSObject,NSCoding{
    var name:String = ""
    var stunum:String=""
    var sex:String=""
    var QQnum:String=""
    var dormitory:String=""
    var doornum:String=""
    var level:String=""
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("user")
    
    override init() {
        
    }
    init(name:String,stunum:String,sex:String,QQ:String,dormitory:String,doornum:String,level:String){
        self.name=name
        self.stunum=stunum
        self.sex=sex
        self.QQnum=QQ
        self.dormitory=dormitory
        self.doornum=doornum
        self.level=level
    }
    //注册
    func set_userregister(name:String,stunum:String,sex:String,QQ:String,dormitory:String,doornum:String){
        self.name=name
        self.stunum=stunum
        self.sex=sex
        self.QQnum=QQ
        self.dormitory=dormitory
        self.doornum=doornum
    }
    //修改收货地址
    func set_shipaddress(dormitory:String,doornum:String){
        self.dormitory=dormitory
        self.doornum=doornum
    }
    //修改个人信息
    func set_personinformation(name:String,sex:String,QQ:String){
        self.name=name
        self.sex=sex
        self.QQnum=QQ
    }
    
    struct PropertyKey {
        static let name="name"
        static let stunum="stunum"
        static let sex="sex"
        static let QQ="QQ"
        static let dormitory="dormitory"
        static let doornum="doornum"
        static let level="level"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(stunum, forKey: PropertyKey.stunum)
        aCoder.encode(sex, forKey: PropertyKey.sex)
        aCoder.encode(QQnum, forKey: PropertyKey.QQ)
        aCoder.encode(dormitory, forKey: PropertyKey.dormitory)
        aCoder.encode(doornum, forKey: PropertyKey.doornum)
        aCoder.encode(level, forKey: PropertyKey.level)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let stunum = aDecoder.decodeObject(forKey: PropertyKey.stunum) as? String else {
            os_log("Unable to decode the stunum for a Eexpress object.", log: OSLog.default, type: .debug)
            return nil
        }
        let name=aDecoder.decodeObject(forKey: PropertyKey.name) as? String
        let sex=aDecoder.decodeObject(forKey: PropertyKey.sex) as? String
        let QQ=aDecoder.decodeObject(forKey: PropertyKey.QQ) as? String
        let dormitory=aDecoder.decodeObject(forKey: PropertyKey.dormitory) as? String
        let doornum=aDecoder.decodeObject(forKey: PropertyKey.doornum) as? String
        let level=aDecoder.decodeObject(forKey: PropertyKey.level) as? String
        self.init(name: name!, stunum: stunum, sex: sex!, QQ: QQ!, dormitory: dormitory!, doornum: doornum!, level: level!)
    }
}
