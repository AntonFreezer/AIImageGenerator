//
//  ProfileCoordinator.swift
//  iWeather
//
//  Created by Anton Kholodkov on 29.02.2024.
//

import UIKit

final class PromptResultCoordinator<R: Routable> {
    let router: R
    let imageURL: String

    init(router: R, imageURL: String) {
        self.router = router
        self.imageURL = imageURL
    }

    private lazy var primaryViewController: UIViewController = {
        let viewController = PromptResultViewController()
        viewController.imageURL = imageURL
        viewController.modalTransitionStyle = .coverVertical
        viewController.modalPresentationStyle = .fullScreen
        return viewController
    }()
}

extension PromptResultCoordinator: Coordinator {
    func start() {
        router.navigationController.topViewController?.present(primaryViewController, animated: true)
    }
}
