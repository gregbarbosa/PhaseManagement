//
//  TableViewCell.swift
//  PhaseMGMT
//
//  Created by Developer on 10/23/14.
//  Copyright (c) 2014 gregbarbosa. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        artistImageView.contentMode = UIViewContentMode.Center
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
