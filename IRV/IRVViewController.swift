//
//  IRVViewController.swift
//  IRV
//
//  Created by Bill Anderson on 11/26/16.
//  Copyright © 2016 Bill Anderson. All rights reserved.
//

import UIKit

class IRVViewController: UIViewController {
    
    
    // MARK: - Properties
    
    // MARK: - Outlets
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}





