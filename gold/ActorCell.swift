//
//  ActorCell.swift
//  gold
//
//  Created by Admin on 23/7/2562 BE.
//  Copyright © 2562 Kate. All rights reserved.
//


import UIKit

class ActorCell: UITableViewCell {
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var DOBLbl: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
