//
//  UserCreationTableViewCell.swift
//  Graft
//
//  Created by Zach Eidenberger on 1/12/24.
//

import UIKit

class UserCreationTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField?
    var delegate: QuestionCellDelegate?
    var question: OnboardingQuestion? {
        didSet {
            textField?.placeholder = question?.questionString
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        textField?.delegate = self
    }
    
    
    @IBAction func textFieldTextDidChange(_ sender: Any) {
        delegate?.didUpdateAnswer(id: question?.questionID ?? "", boolAnswer: nil, stringAnswer: textField?.text, intAnswer: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
