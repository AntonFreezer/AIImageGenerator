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
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        
        searchBar.placeholder = String(localized: "Type your prompt")
        searchBar.barTintColor = .white
        
        searchBar.showsCancelButton = true
        searchBar.autocorrectionType = .default
        searchBar.autocapitalizationType = .none
        
        return searchBar
    }()
    
    //MARK: - Lifecycle & Setup
    override func configure() {
        setupView()
        setupLayout()
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubviews(label, searchBar)
        
    }
    
    private func setupLayout() {
        
        searchBar.snp.makeConstraints { make in
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(keyboardLayoutGuide.snp.top)
        }
    }
    
}
