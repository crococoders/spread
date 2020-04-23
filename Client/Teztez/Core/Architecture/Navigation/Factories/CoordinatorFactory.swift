//
//  CoordinatorFactory.swift
//  Teztez
//
//  Created by Almas Zainoldin on 4/18/20.
//  Copyright © 2020 crococoders. All rights reserved.
//

import Foundation

final class CoordinatorFactory {
    func makeMainTabBarCoordinator(router: Router) -> Coordinator {
        let tabBarController = TabBarController()
        let coordinator = TabBarCoordinator(tabBarPresentable: tabBarController, router: router, coordinatorFactory: CoordinatorFactory())
        return coordinator
    }

    func makeActivitiesCoordiantor(navigationController: CoordinatorNavigationController) -> Coordinator {
        let coordinator = ActivitiesCoordinator(moduleFactory: ModuleFactory.shared,
                                                router: Router(rootController: navigationController))
        return coordinator
    }
}
