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
    var question: OnboardingQuestion? {
        didSet {
            
        }
    }
    var delegate: QuestionCellDelegate?
    var hostVC: OnboardingUserCreationViewController?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func didToggleSwitch(_ sender: Any) {
        delegate?.didUpdateAnswer(id: question?.questionID ?? "", boolAnswer: questionSwitch.isOn, stringAnswer: nil, intAnswer: nil)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
