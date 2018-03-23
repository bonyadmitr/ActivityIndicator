//
//  ActivityIndicatorPresenter.swift
//  ActivityIndicator
//
//  Created by Bondar Yaroslav on 3/23/18.
//  Copyright © 2018 Bondar Yaroslav. All rights reserved.
//

import UIKit

protocol ActivityIndicatorPresenter {
    func present(activityIndicator: ActivityIndicator)
}
//extension UIViewController: ActivityIndicatorPresenter {
extension ActivityIndicatorPresenter where Self: UIViewController {
    func present(activityIndicator: ActivityIndicator) {
        activityIndicator.frame = view.bounds
        activityIndicator.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.addSubview(activityIndicator)
    }
}

protocol UIBlockable: ActivityIndicatorPresenter {
    var activityIndicator: ActivityIndicator { get }
    func showIndicator()
    func hideIndicator()
}
extension UIBlockable {
    func showIndicator() {
        activityIndicator.start(in: self)
    }
    
    func hideIndicator() {
        activityIndicator.stop()
    }
}

protocol ActivityIndicatorCounterController: class {
    var activityIndicatorCounter: ActivityIndicatorCounter { get }
    func showIndicator()
    func hideIndicator()
}

//extension ActivityIndicatorCounterController where Self: UIViewController {
////    func showIndicator() {
////        
////    }
////    
////    func hideIndicator() {
//////        hideSpiner()
////    }
//}
