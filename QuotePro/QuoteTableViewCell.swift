//
//  QuoteTableViewCell.swift
//  QuotePro
//
//  Created by Hyung Jip Moon on 2017-03-21.
//  Copyright © 2017 leomoon. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    // MARK: Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
