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
    
    // MARK: - TypeAlias
    
    typealias voterClosure = ([IRVVoter]) -> (Void)
    
    // MARK: - Voters
    
    func deleteAllVoters(completion: @escaping voidClosure) {
        
        persistentContainer.performBackgroundTask { context in
            context.performAndWait {
                
                let request: NSFetchRequest<IRVVoter> = IRVVoter.fetchRequest()
                do {
                    let searchResults = try context.fetch(request)
                    
                    searchResults.forEach { voter in
                        context.delete(voter)
                    }
                } catch {
                    print("Error with request: \(error)")
                }
                self.save(context: context)
                
            }
            completion()
        }
        
    }
    
    func addVoter(nameString: String, completion: @escaping voidClosure) {
        addVoters(nameStrings: [nameString], completion: completion)
    }
    
    func addVoters(nameStrings: [String], completion: @escaping voidClosure) {
        
        persistentContainer.performBackgroundTask { context in
            context.performAndWait {
                
                nameStrings.forEach({ (nameString) in
                    let voter = IRVVoter(context: context)
                    voter.voterName = nameString
                    voter.voterUUID = UUID().uuidString
                })
                
                self.save(context: context)
                
            }
            completion()
        }
        
    }
    
    func getAllVoters(completion: @escaping voterClosure) {
        
        persistentContainer.performBackgroundTask { context in
            
            let request: NSFetchRequest<IRVVoter> = IRVVoter.fetchRequest()
            let descriptor = NSSortDescriptor(key: "voterName", ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))
            request.sortDescriptors = [descriptor]
            do {
                let searchResults = try context.fetch(request)
                completion(searchResults)
            } catch {
                print("Error with request: \(error)")
                completion([IRVVoter]())
            }
            
        }
        
    }
    
}
