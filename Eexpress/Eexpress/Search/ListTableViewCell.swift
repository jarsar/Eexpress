//
//  ListTableViewCell.swift
//  Eexpress
//
//  Created by jarson on 2017/12/6.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var merchandise: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var stunum: UILabel!
    @IBOutlet weak var expressname: UILabel!
    @IBOutlet weak var shelves: UILabel!
    @IBOutlet weak var expressnum: UILabel!
    @IBOutlet weak var reward: UILabel!
    @IBOutlet weak var freetimestart: UILabel!
    @IBOutlet weak var freetimeend: UILabel!
    
    var flag=false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
