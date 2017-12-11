//
//  EvaluationTableViewCell.swift
//  Eexpress
//
//  Created by jarson on 2017/12/10.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit

class EvaluationTableViewCell: UITableViewCell {

    @IBOutlet weak var merchandise: UILabel!
    @IBOutlet weak var rname: UILabel!
    @IBOutlet weak var rlevel: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
