//
//  HomeTransition.swift
//  AIImageGenerator
//
//  Created by Anton Kholodkov on 05.03.2024.
//

import Foundation

enum HomeTransition {
    case initialScreen
    case promptResultScreen
    
    var identifier: String { "\(self)" }
    
    func coordinatorFor<R: HomeRouter>(router: R) -> Coordinator {
        switch self {
        case .initialScreen:
            return HomeCoordinator(router: router)
        case .promptResultScreen:
            return PromptResultCoordinator(router: router)
        }
    }
}
