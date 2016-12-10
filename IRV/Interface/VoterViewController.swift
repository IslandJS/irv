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
            performSegue(withIdentifier: SegueNames.createVoter, sender: nil)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // No idea, no problem
        guard let segueID = segue.identifier else { return }
        
        // Segue to ThingViewController
        if segueID == SegueNames.createVoter && segue.destination is ThingViewController {
                (segue.destination as? ThingViewController)?.thingType = ThingViewController.ThingType.candidate
        }
        
    }
    
    // MARK: - Actions
    
    @IBAction func showCreateAction() {
        performSegue(withIdentifier: SegueNames.createVoter, sender: nil)
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
