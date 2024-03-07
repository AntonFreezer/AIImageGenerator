//
//  ProfileViewController.swift
//  iWeather
//
//  Created by Anton Kholodkov on 29.02.2024.
//

import UIKit
import Kingfisher

class PromptResultViewController: UIViewController {
    
    var imageURL: String? = nil
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func viewDidLoad() {
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.kf.setImage(with: URL(string: imageURL ?? ""))
    }
}
