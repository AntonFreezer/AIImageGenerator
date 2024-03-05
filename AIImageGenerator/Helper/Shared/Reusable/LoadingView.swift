//
//  LoadingView.swift
//  AIImageGenerator
//
//  Created by Anton Kholodkov on 05.03.2024.
//

import UIKit
import SnapKit

final class LoadingView: CustomView {
    let spinner = UIActivityIndicatorView(style: .large)
    
    override func configure() {
        spinner.color = .white
        spinner.hidesWhenStopped = true
        addSubview(spinner)
        
        spinner.snp.makeConstraints {
            $0.size.equalTo(90)
            $0.center.equalToSuperview()
        }
    }
}
