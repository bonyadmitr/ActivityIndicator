//
//  ViewController.swift
//  ActivityIndicator
//
//  Created by Bondar Yaroslav on 3/23/18.
//  Copyright © 2018 Bondar Yaroslav. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ActivityIndicatorCounterController, UIBlockable {
    
    lazy var activityIndicator: ActivityIndicator = ActivityIndicatorImp()
    lazy var activityIndicatorCounter = ActivityIndicatorCounter(controller: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatorCounter.start()
        activityIndicatorCounter.start()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in 
            self?.activityIndicatorCounter.stop()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in 
            self?.activityIndicatorCounter.stop()
            self?.activityIndicatorCounter.stop()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

