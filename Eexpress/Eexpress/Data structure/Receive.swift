//
//  Receive.swift
//  Eexpress
//
//  Created by jarson on 2017/12/4.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit
import os.log
class Receive:NSObject,NSCoding{
    
    var merchandise:String=""
    
    var oname:String=""
    var ostunum:String=""
    var oQQ:String=""
    var odormitory:String=""
    var odoornum:String=""
    var olevel:String=""
    
    var rname:String=""
    var rstunum:String=""
    var rQQ:String=""
    var rdormitory:String=""
    var rdoornum:String=""
    var rlevel:String=""
    
    static let UDocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let UArchiveURL = UDocumentsDirectory.appendingPathComponent("ureceives")
    static let OArchiveURL = UDocumentsDirectory.appendingPathComponent("oreceives")
    
    override init() {
        
    }
    init?(merchandise:String,oname:String,ostunum:String,oQQ:String,odormitory:String,odoornum:String,olevel:String,rname:String,rstunum:String,rQQ:String,rdormitory:String,rdoornum:String,rlevel:String){
        self.merchandise=merchandise
        
        self.oname=oname
        self.ostunum=ostunum
        self.oQQ=oQQ
        self.odormitory=odormitory
        self.odoornum=odoornum
        self.olevel=olevel
        
        self.rname=rname
        self.rstunum=rstunum
        self.rQQ=rQQ
        self.rdormitory=rdormitory
        self.rdoornum=rdoornum
        self.rlevel=rlevel
    }
    
    struct PropertyKey {
        static let merchandise = "merchandise"
        
        static let oname = "oname"
        static let ostunum = "ostunum"
        static let oQQ = "oQQ"
        static let odormitory = "odormitory"
        static let odoornum = "odoornum"
        static let olevel = "olevel"
        
        static let rname = "rname"
        static let rstunum = "rstunum"
        static let rQQ = "rQQ"
        static let rdormitory = "rdormitory"
        static let rdoornum = "rdoornum"
        static let rlevel = "rlevel"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(merchandise, forKey: PropertyKey.merchandise)
        
        aCoder.encode(oname, forKey: PropertyKey.oname)
        aCoder.encode(ostunum, forKey: PropertyKey.ostunum)
        aCoder.encode(oQQ, forKey: PropertyKey.oQQ)
        aCoder.encode(odormitory, forKey: PropertyKey.odormitory)
        aCoder.encode(odoornum, forKey: PropertyKey.odoornum)
        aCoder.encode(olevel, forKey: PropertyKey.olevel)
        
        aCoder.encode(rname, forKey: PropertyKey.rname)
        aCoder.encode(rstunum, forKey: PropertyKey.rname)
        aCoder.encode(rQQ, forKey: PropertyKey.rQQ)
        aCoder.encode(rdormitory, forKey: PropertyKey.rdormitory)
        aCoder.encode(rdoornum, forKey: PropertyKey.odoornum)
        aCoder.encode(rlevel, forKey: PropertyKey.rlevel)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let ostunum = aDecoder.decodeObject(forKey: PropertyKey.ostunum) as? String else {
            os_log("Unable to decode the ostunum for a Eexpress object.", log: OSLog.default, type: .debug)
            return nil
        }
        let oname=aDecoder.decodeObject(forKey: PropertyKey.oname) as? String
        let oQQ=aDecoder.decodeObject(forKey: PropertyKey.oQQ) as? String
        let odormitory=aDecoder.decodeObject(forKey: PropertyKey.odormitory) as? String
        let odoornum=aDecoder.decodeObject(forKey: PropertyKey.odoornum) as? String
        let olevel=aDecoder.decodeObject(forKey: PropertyKey.olevel) as? String
        
        guard let rstunum = aDecoder.decodeObject(forKey: PropertyKey.rstunum) as? String else {
            os_log("Unable to decode the ostunum for a Eexpress object.", log: OSLog.default, type: .debug)
            return nil
        }
        let rname=aDecoder.decodeObject(forKey: PropertyKey.rname) as? String
        let rQQ=aDecoder.decodeObject(forKey: PropertyKey.rQQ) as? String
        let rdormitory=aDecoder.decodeObject(forKey: PropertyKey.rdormitory) as? String
        let rdoornum=aDecoder.decodeObject(forKey: PropertyKey.rdoornum) as? String
        let rlevel=aDecoder.decodeObject(forKey: PropertyKey.rlevel) as? String
        
        let merchandise=aDecoder.decodeObject(forKey: PropertyKey.merchandise) as? String
        
        self.init(merchandise: merchandise!, oname: oname!, ostunum: ostunum, oQQ: oQQ!, odormitory: odormitory!, odoornum: odoornum!, olevel: olevel!, rname: rname!, rstunum: rstunum, rQQ: rQQ!, rdormitory: rdormitory!, rdoornum: rdoornum!, rlevel: rlevel!)
    }
}
