//
//  ProfileCoordinator.swift
//  iWeather
//
//  Created by Anton Kholodkov on 29.02.2024.
//

import UIKit

final class PromptResultCoordinator<R: Routable> {
    let router: R

    init(router: R) {
        self.router = router
    }

    private lazy var primaryViewController: UIViewController = {
        let viewController = PromptResultViewController()
        return viewController
    }()
}

extension PromptResultCoordinator: Coordinator {
    func start() {
        router.navigationController.topViewController?.present(primaryViewController, animated: true)
    }
}
