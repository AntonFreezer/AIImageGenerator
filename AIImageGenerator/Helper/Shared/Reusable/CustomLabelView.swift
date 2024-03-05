//
//  CustomLabelView.swift
//  AIImageGenerator
//
//  Created by Anton Kholodkov on 05.03.2024.
//

import UIKit

final class CustomLabelView: CustomView {
    private let label = UILabel()
    
    override func configure() {
        addSubviews(label)
        label.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension CustomLabelView: Configurable {
    struct Model {
        let text: UILabel.Model
    }
    
    func update(with model: Model?) {
        guard let model else {
            return
        }
        label.update(with: model.text)
    }
}
