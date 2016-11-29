//
//  DataManager+Voter.swift
//  IRV
//
//  Created by William Anderson on 11/28/16.
//  Copyright © 2016 Bill Anderson. All rights reserved.
//

import Foundation
import CoreData

extension DataManager {
    
    func deleteAllVoters() {
        
        persistentContainer.performBackgroundTask { context in
            
            let request: NSFetchRequest<IRVVoter> = IRVVoter.fetchRequest()
            do {
                let searchResults = try context.fetch(request)
                searchResults.forEach { context.delete($0) }
            } catch {
                print("Error with request: \(error)")
            }
            self.save(context: context)
            
        }
        
    }
    
    func addVoter(nameString: String) {
        
        let context = self.persistentContainer.newBackgroundContext()
        context.performAndWait {
            
            let voter = IRVVoter(context: context)
            voter.voterName = nameString
            self.save(context: context)
            
        }
        
    }
    
    func getAllVoters() -> [IRVVoter] {
        
        persistentContainer.performBackgroundTask { context in
            var voterArray = [IRVVoter]()
            let request: NSFetchRequest<IRVVoter> = IRVVoter.fetchRequest()
            do {
                let searchResults = try context.fetch(request)
                voterArray = searchResults
            } catch {
                print("Error with request: \(error)")
            }
            
        }
        
    }
    
    
}
