//
//  ErrorPresentable.swift
//  AIImageGenerator
//
//  Created by Anton Kholodkov on 05.03.2024.
//

import UIKit

protocol ErrorPresentable {
    func showError(
        _ title: String,
        message: String?,
        actionTitle: String?,
        action: ((UIView) -> Void)?,
        actionTitle2: String?,
        action2: ((UIView) -> Void)?
    )
    
    func hideError()
}

