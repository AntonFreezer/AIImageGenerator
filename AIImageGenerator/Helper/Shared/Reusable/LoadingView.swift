//
//  LoadingView.swift
//  AIImageGenerator
//
//  Created by Anton Kholodkov on 05.03.2024.
//

import UIKit
import Lottie
import SnapKit

final class LoadingView: CustomView {
    
    //MARK: - Properties
    var etaSeconds: String? {
        didSet {
            let labelText = (etaSeconds != "0")
            ? "Estimated time: \(etaSeconds ?? "0") sec"
            : "We need a little bit more time..."
            etaLabel.update(with: .init(
                text: labelText,
                font: .poppinsMedium(ofSize: 36),
                textColor: .black,
                numberOfLines: 0,
                alignment: .center)
            )
            
            etaLabel.isHidden = (etaSeconds == nil)
        }
    }
    
    //MARK: - UI Components
    private let etaLabel = UILabel()
    let animationView = LottieAnimationView()
    
    //MARK: - Lifecycle
    override func configure() {
        
        
        addSubviews(animationView, etaLabel)
        
        etaLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(readableContentGuide)
            make.top.equalTo(readableContentGuide).offset(50)
        }
        
        animationView.snp.makeConstraints {
            $0.size.equalTo(380)
            $0.center.equalToSuperview()
        }
        
        animationView.animation = .filepath(Bundle.main.path(forResource: "loading", ofType: "json") ?? "")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
    }
}
