//
//  BusinessTableViewCell.swift
//  Eexpress
//
//  Created by jarson on 2017/12/10.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit

class BusinessTableViewCell: UITableViewCell {

    @IBOutlet weak var merchandise: UILabel!
    @IBOutlet weak var oname: UILabel!
    @IBOutlet weak var ostunum: UILabel!
    @IBOutlet weak var oQQ: UILabel!
    @IBOutlet weak var odormitory: UILabel!
    @IBOutlet weak var odoornum: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
