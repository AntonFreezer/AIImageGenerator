//
//  BasicViewModelType.swift
//  AIImageGenerator
//
//  Created by Anton Kholodkov on 05.03.2024.
//

import Foundation

protocol BasicViewModelType {
    associatedtype Router
    var router: Router { get }
}
