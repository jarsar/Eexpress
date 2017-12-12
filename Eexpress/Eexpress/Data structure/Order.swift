//
//  Order.swift
//  Eexpress
//
//  Created by jarson on 2017/12/4.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
import os.log
class Order:NSObject,NSCoding{
    var name:String=""
    var stunum:String=""
    var QQ:String=""
    var dormitory:String=""
    var doornum:String=""
    var level:String=""
    var merchandise:String=""
    var expressname:String=""
    var shelves:String=""
    var expressnum:String=""
    var reward:String=""
    var freetimestart:String=""
    var freetimeend:String=""
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("orders")
    
    struct PropertyKey {
        static let name="name"
        static let stunum="stunum"
        static let QQ="QQ"
        static let dormitory="dormitory"
        static let doornum="doornum"
        static let level="level"
        static let merchandise="merchandise"
        static let expressname="expressname"
        static let shelves="shelves"
        static let expressnum="expressnum"
        static let reward="reward"
        static let freetimestart="freetimestart"
        static let freetimeend="freetimeend"
    }
    
    init?(name:String,stunum:String,QQ:String,dormitory:String,doornum:String,level:String,merchandise:String,expressname:String,shelves:String,expressnum:String,reward:String,freetimestart:String,freetimeend:String) {
        self.name=name
        self.stunum=stunum
        self.QQ=QQ
        self.dormitory=dormitory
        self.doornum=doornum
        self.level=level
        self.merchandise=merchandise
        self.expressname=expressname
        self.shelves=shelves
        self.expressnum=expressnum
        self.reward=reward
        self.freetimestart=freetimestart
        self.freetimeend=freetimeend
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(stunum, forKey: PropertyKey.stunum)
        aCoder.encode(QQ,forKey: PropertyKey.QQ)
        aCoder.encode(dormitory,forKey: PropertyKey.dormitory)
        aCoder.encode(doornum,forKey: PropertyKey.doornum)
        aCoder.encode(level, forKey: PropertyKey.level)
        aCoder.encode(merchandise, forKey: PropertyKey.merchandise)
        aCoder.encode(expressname, forKey: PropertyKey.expressname)
        aCoder.encode(shelves, forKey: PropertyKey.shelves)
        aCoder.encode(expressnum, forKey: PropertyKey.expressname)
        aCoder.encode(reward, forKey: PropertyKey.reward)
        aCoder.encode(freetimestart, forKey: PropertyKey.freetimestart)
        aCoder.encode(freetimeend, forKey: PropertyKey.freetimeend)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let stunum = aDecoder.decodeObject(forKey: PropertyKey.stunum) as? String else {
            os_log("Unable to decode the stunum for a Eexpress object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let name=aDecoder.decodeObject(forKey: PropertyKey.name) as? String
        let QQ=aDecoder.decodeObject(forKey: PropertyKey.QQ) as? String
        let dormitory=aDecoder.decodeObject(forKey: PropertyKey.dormitory) as? String
        let doornum=aDecoder.decodeObject(forKey: PropertyKey.doornum) as? String
        let level=aDecoder.decodeObject(forKey: PropertyKey.level) as? String
        let merchandise=aDecoder.decodeObject(forKey: PropertyKey.merchandise) as? String
        let expressname=aDecoder.decodeObject(forKey: PropertyKey.expressname) as? String
        let shelves=aDecoder.decodeObject(forKey: PropertyKey.shelves) as? String
        let expressnum=aDecoder.decodeObject(forKey: PropertyKey.expressnum) as? String
        let reward=aDecoder.decodeObject(forKey: PropertyKey.reward) as? String
        let freetimestart=aDecoder.decodeObject(forKey: PropertyKey.freetimestart) as? String
        let freetimeend=aDecoder.decodeObject(forKey: PropertyKey.freetimeend) as? String
        // Must call designated initializer.
        self.init(name: name!, stunum: stunum,QQ: QQ!,dormitory: dormitory!,doornum:doornum!, level: level!, merchandise: merchandise!, expressname: expressname!, shelves: shelves!, expressnum: expressnum!, reward: reward!, freetimestart: freetimestart!, freetimeend: freetimeend!)
    }
}
