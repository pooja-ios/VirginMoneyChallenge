//
//  ItemTableCell.swift
//  VirginMoneyChallenge
//
//  Created by pooja sharma on 13/02/21.
//

import UIKit

class ItemTableCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var disclosureIcon: UIImageView!
    
    var hideDisclosureIcon: Bool = false {
        didSet {
            disclosureIcon.isHidden = hideDisclosureIcon
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var subtitle: String? {
        didSet {
            subtitleLabel.text = subtitle
        }
    }
    
    var attrubutedSubtitle: NSAttributedString? {
        didSet {
            subtitleLabel.attributedText = attrubutedSubtitle
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textColor = BRAND_COLOR
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = ""
        subtitleLabel.text = ""
    }
}
