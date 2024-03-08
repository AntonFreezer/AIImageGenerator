//
//  ErrorView.swift
//  AIImageGenerator
//
//  Created by Anton Kholodkov on 05.03.2024.
//

import UIKit

final class ErrorView: CustomView {
    
    //MARK: - Properties
    var title: String = "" {
        didSet {
            titleLabel.update(
                with: .init(
                    text: title,
                    font: .boldSystemFont(ofSize: 16),
                    textColor: .black,
                    numberOfLines: 2,
                    alignment: .center
                )
            )
        }
    }
    
    var message: String? {
        didSet {
            messageLabel.update(
                with: .init(
                    text: message ?? "",
                    font: .italicSystemFont(ofSize: 14),
                    textColor: .black,
                    numberOfLines: 3,
                    alignment: .center
                )
            )
            messageLabel.isHidden = message == nil
        }
    }
    
    var actionTitle: String? {
        didSet {
            actionButton.setTitle(actionTitle, for: .normal)
        }
    }
    
    var action: ((UIView) -> Void)? {
        didSet {
            actionButton.isHidden = action == nil
        }
    }
    
    var actionTitle2: String? {
        didSet {
            actionButton2.setTitle(actionTitle2, for: .normal)
        }
    }
    
    var action2: ((UIView) -> Void)? {
        didSet {
            actionButton2.isHidden = action2 == nil
        }
    }
    
    //MARK: - UI Components
    private let titleLabel = UILabel()
    private let messageLabel = UILabel()
    private let actionButton = UIButton(type: .system)
    private let actionButton2 = UIButton(type: .system)
    
    
    //MARK: - Setup & Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        addSubviews(titleLabel, messageLabel, actionButton, actionButton2)
        
        // first action
        actionButton.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .purple
        configuration.baseForegroundColor = .white
        configuration.titleAlignment = .center
        configuration.contentInsets = .init(top: 8, leading: 16, bottom: 8, trailing: 16)
        actionButton.configuration = configuration
        
        //second action
        actionButton2.addTarget(self, action: #selector(didTapActionButton2), for: .touchUpInside)
        var configuration2 = UIButton.Configuration.filled()
        configuration2.baseBackgroundColor = .darkGray
        configuration2.baseForegroundColor = .white
        configuration2.titleAlignment = .center
        configuration2.contentInsets = .init(top: 8, leading: 16, bottom: 8, trailing: 16)
        actionButton2.configuration = configuration2
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        actionButton.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        actionButton2.snp.makeConstraints { make in
            make.top.equalTo(actionButton.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.lessThanOrEqualToSuperview().inset(16)
        }
    }
    
    //MARK: - Button Actions
    @objc private func didTapActionButton() {
        action?(self)
    }
    
    @objc private func didTapActionButton2() {
        action2?(self)
    }
}
