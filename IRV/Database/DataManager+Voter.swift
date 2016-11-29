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
    
    func addVoter(nameString: String) {
        
        persistentContainer.performBackgroundTask { context in
            
            // Add a voter
            let voter = IRVVoter(context: context)
            
            voter.voterName = nameString
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
            
        }
        
    }
    
//    func listVoters() -> [IRVVoter]? {
//        
//        persistentContainer.performBackgroundTask { context in
//            
//            // Get and print all voters
//            let request: NSFetchRequest<IRVVoter> = IRVVoter.fetchRequest()
//            do {
//                let searchResults = try context.fetch(request)
//                return searchResults
//            } catch {
//                return nil
//                print("Error with request: \(error)")
//            }
//            
//        }
//        
//    }
    
    
}
