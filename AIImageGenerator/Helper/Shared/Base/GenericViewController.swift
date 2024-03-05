//
//  GenericViewController.swift
//  AIImageGenerator
//
//  Created by Anton Kholodkov on 05.03.2024.
//

import UIKit

class GenericViewController<T: UIView>: UIViewController {
    
    //MARK: - Properties
    let loadingView = LoadingView()
    let errorView = ErrorView()
    
    public var rootView: T { return view as! T }
    
    //MARK: - Lifecycle && Setup
    override public func loadView() {
        self.view = T()
    }
    
}
