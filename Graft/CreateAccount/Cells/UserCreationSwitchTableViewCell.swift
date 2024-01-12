//
//  UserCreationSwitchTableViewCell.swift
//  Graft
//
//  Created by Zach Eidenberger on 1/12/24.
//

import UIKit

class UserCreationSwitchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionSwitch: UISwitch!
    
    var hostVC: OnboardingUserCreationViewController?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
