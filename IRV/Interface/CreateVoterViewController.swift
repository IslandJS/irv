//
//  CreateVoterViewController.swift
//  IRV
//
//  Created by Bill Anderson on 12/5/16.
//  Copyright © 2016 Bill Anderson. All rights reserved.
//

import UIKit

class CreateVoterViewController: IRVViewController {
    
    // MARK: - Enum
    
    enum ThingType {
        case voter
        case candidate
    }
    
    // MARK: - Properties
    
    // MARK: - Outlets
    
    @IBOutlet weak var voterImageView: UIImageView!
    @IBOutlet weak var voterNameTextField: UITextField!
    @IBOutlet weak var voterStateTextView: UITextView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Update UI
        voterImageView.addOutline(cornerRadius: 4.0)
        voterNameTextField.addOutline(cornerRadius: 4.0)
        voterStateTextView.addOutline(width: 0.0, cornerRadius: 4.0)
        
    }
    
    
    // MARK: - Actions
    
    @IBAction func dismissAction() {
        dismiss(animated: true, completion: nil)
    }
    
}
