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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Voter"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        if dataMan.currentVoter == nil {
            performSegue(withIdentifier: createVoterSegue, sender: nil)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func showCreateAction() {
        performSegue(withIdentifier: createVoterSegue, sender: nil)
    }
    
    // MARK: - Voters
    /*
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
    */
}
