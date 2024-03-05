//
//  HomeFlow.swift
//  AIImageGenerator
//
//  Created by Anton Kholodkov on 05.03.2024.
//

import UIKit

final class HomeFlow: NavigationFlow {
    var navigationController = NavigationController()
}

extension HomeFlow: Coordinator {
    /// Application entry point
    func start() {
        process(route: .initialScreen)
        
    }
}

extension HomeFlow: HomeRouter {
    
    func exit() {
        // In this Router context - the only exit left is the main screen.
        // Logout - clean tokens - local cache - offline database if needed etc.
        //        process(route: .showOnboarding)
    }
    
    func process(route: HomeTransition) {
        let coordinator = route.coordinatorFor(router: self)
        
        coordinator.start()
        
        print(route.identifier)
    }
    
}


