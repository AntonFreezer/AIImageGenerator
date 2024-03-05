//
//  HomeView.swift
//  iWeather
//
//  Created by Anton Kholodkov on 27.02.2024.
//

import UIKit

final class HomeView: CustomView {
    
    //MARK: - UI Components
    private let label: UILabel = {
        let label = UILabel(frame: .init(x: 100, y: 100, width: 100, height: 100))
        label.text = "Hello World"
        label.textColor = .blue
        return label
    }()
    
    //MARK: - Lifecycle & Setup
    
    override func configure() {
        setupView()
        setupLayout()
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(label)
        
    }
    
    private func setupLayout() {
    
    }
    
}
