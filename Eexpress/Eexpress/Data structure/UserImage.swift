//
//  UserImage.swift
//  Eexpress
//
//  Created by jarson on 2018/1/1.
//  Copyright © 2018年 jarson. All rights reserved.
//

import UIKit
import os.log
class UserImage:NSObject,NSCoding{
    var image:UIImage?
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("image")
    
    override init() {
        
    }
    init(image:UIImage){
        self.image=image
    }
    struct PropertyKey {
        static let image="image"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(image, forKey: PropertyKey.image)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let image = aDecoder.decodeObject(forKey: PropertyKey.image) as? UIImage else {
            os_log("Unable to decode the stunum for a Eexpress object.", log: OSLog.default, type: .debug)
            return nil
        }
        self.init(image:image)
    }
}

