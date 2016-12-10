//
//  ThingViewController.swift
//  IRV
//
//  Created by William Anderson on 12/9/16.
//  Copyright © 2016 Bill Anderson. All rights reserved.
//

import UIKit

class ThingViewController: IRVViewController {
    
    // MARK: - Enum
    
    enum ThingType {
        case voter
        case candidate
    }
    
    // MARK: - Properties
    
    var thingType = ThingType.voter
    var candidateThing: IRVCandidate?
    var voterThing: IRVVoter?
    var noThing: Bool {
        return (voterThing == nil) && (candidateThing == nil)
    }
    
    
    // MARK: - Outlets
    @IBOutlet weak var thingLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Update UI
        var thingLabelString = ""
        switch thingType {
        case .candidate:
            thingLabelString = "Candidate"
        case .voter:
            thingLabelString = "Voter"
        }
        
        if noThing { thingLabelString = "Create " + thingLabelString }
        thingLabel.text = thingLabelString
        
    }
    
    // MARK: - Actions
    
    @IBAction func dismissAction() {
        dismiss(animated: true, completion: nil)
    }
    
}
