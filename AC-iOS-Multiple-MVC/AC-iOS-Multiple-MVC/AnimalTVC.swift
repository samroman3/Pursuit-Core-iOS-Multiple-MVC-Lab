//
//  AnimalTVC.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Sam Roman on 8/13/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class AnimalTVC: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBOutlet weak var imageOut: UIImageView!
    
    
    @IBOutlet weak var labelName: UILabel!
    
    
    @IBOutlet weak var originLabel: UILabel!
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
