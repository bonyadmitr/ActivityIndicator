//
//  ActivityIndicatorImp.swift
//  ActivityIndicator
//
//  Created by Bondar Yaroslav on 3/23/18.
//  Copyright © 2018 Bondar Yaroslav. All rights reserved.
//

import UIKit

final class ActivityIndicatorImp: ActivityIndicator {
    
    private let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = center
        addSubview(activityIndicator)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activityIndicator.center = center
    }
    
    override func start(in presenter: ActivityIndicatorPresenter) {
        activityIndicator.startAnimating()
        presenter.present(activityIndicator: self)
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    override func stop() { 
        activityIndicator.stopAnimating();
        UIApplication.shared.endIgnoringInteractionEvents();
    }
}
