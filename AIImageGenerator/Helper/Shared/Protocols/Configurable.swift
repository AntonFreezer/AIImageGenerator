//
//  Configurable.swift
//  AIImageGenerator
//
//  Created by Anton Kholodkov on 05.03.2024.
//

import UIKit

protocol Configurable: UIView {
    associatedtype Model
    
    func update(with model: Model?)
}
