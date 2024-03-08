//
//  HomeView.swift
//  iWeather
//
//  Created by Anton Kholodkov on 27.02.2024.
//

import UIKit

final class HomeView: CustomView {
    
    // MARK: - Properties
    private var searchButtonAction: ((String) -> Void)? = nil

    // MARK: - UI Components
    let searchBar = UISearchBar()
    
    lazy var searchButton: UIButton = {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle & Setup
    override func configure() {
        setupSearchBar()
        setupView()
        setupLayout()
    }

    private func setupSearchBar() {
        searchBar.placeholder = String(localized: "Type your prompt")
        searchBar.backgroundImage = UIImage()
        
//        searchBar.searchTextField.backgroundColor = .white
//        searchBar.searchTextField.layer.borderWidth = 2.0
//        searchBar.searchTextField.layer.cornerRadius = 10.0
    }

    private func setupView() {
        backgroundColor = .white
        addSubview(searchBar)
    }

    private func setupLayout() {
        searchBar.snp.makeConstraints { make in
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(keyboardLayoutGuide.snp.top)
        }
    }
    
    //MARK: - Selectors
    @objc func buttonAction() {
        searchButtonAction?(searchBar.searchTextField.text ?? "")
    }
}

//MARK: - Public
extension HomeView {
    public func showKeyboard() {
        searchBar.becomeFirstResponder()
    }
    
    public func hideKeyboard() {
        searchBar.resignFirstResponder()
    }
}

//MARK: - Configurable
extension HomeView: Configurable {
    struct Model {
        let image: UIImage?
        let title: String?
        let action: ((String) -> Void)?
    }
    
    func update(with model: Model?) {
        
        searchButton.setImage(model?.image, for: .normal)
        searchButton.titleLabel?.text = model?.title
        searchButtonAction = model?.action
        
        if model != nil {
            let textField = searchBar.searchTextField
            textField.rightView = searchButton
            textField.rightViewMode = .always
        }
    }
}
