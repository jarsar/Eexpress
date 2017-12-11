//
//  ReceiveTableViewCell.swift
//  Eexpress
//
//  Created by jarson on 2017/12/10.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit

class ReceiveTableViewCell: UITableViewCell {
    @IBOutlet weak var merchandise: UILabel!
    @IBOutlet weak var rname: UILabel!
    @IBOutlet weak var rstunum: UILabel!
    @IBOutlet weak var rQQ: UILabel!
    @IBOutlet weak var rdormitory: UILabel!
    @IBOutlet weak var rdoornum: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
