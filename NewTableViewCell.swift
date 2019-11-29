//
//  NewTableViewCell.swift
//  namucontera
//
//  Created by Mac on 19/10/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var label1: UILabel!
    
    
    @IBOutlet weak var label2: UILabel!
    
    
    @IBOutlet weak var label3: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
