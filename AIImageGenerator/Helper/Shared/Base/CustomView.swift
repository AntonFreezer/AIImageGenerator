//
//  CustomView.swift
//  AIImageGenerator
//
//  Created by Anton Kholodkov on 05.03.2024.
//

import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() { }
}
