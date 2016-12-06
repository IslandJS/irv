//
//  VoterViewController.swift
//  IRV
//
//  Created by Bill Anderson on 11/26/16.
//  Copyright © 2016 Bill Anderson. All rights reserved.
//

import UIKit

class VoterViewController: IRVViewController {
    
    // MARK: - Properties
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voterLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Voter"
        
        titleLabel.textColor = UIColor.irvRed
        voterLabel.textColor = UIColor.irvBlue
        
        listVoters()
    }
    
    // MARK: - Actions
    
    @IBAction func addAction(_ sender: Any) {
        addVoters()
    }
    
    @IBAction func listAction(_ sender: Any) {
        listVoters()
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        deleteVoters()
    }
    
    // MARK: - Voters
    
    func deleteVoters() {
        dataMan.deleteAllVoters {
            self.listVoters()
        }
    }
    
    func addVoters() {
        
        dataMan.getAllVoters { voters in
            
            guard voters.count == 0 else { return }
            
            let voterNames = ["Bill Anderson",
                              "Kimberly Anderson",
                              "Steven Hoover",
                              "Samantha Anderson",
                              "Simba"]
            
            self.dataMan.addVoters(nameStrings: voterNames) {
                self.listVoters()
            }
            
        }
        
    }
    
    func listVoters() {
        
        dataMan.getAllVoters { voters in
            
            var voterString = ""
            for voter in voters {
                voterString += "\(voter.voterName!) - \(voter.voterUUID!)\r"
            }
            
            OperationQueue.main.addOperation {
                self.voterLabel.text = voterString
            }
            
        }
        
    }
    
}
