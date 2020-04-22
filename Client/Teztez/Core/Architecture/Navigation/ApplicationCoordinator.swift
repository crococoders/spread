//
//  ApplicationCoordinator.swift
//  Teztez
//
//  Created by Almas Zainoldin on 4/18/20.
//  Copyright © 2020 crococoders. All rights reserved.
//

import Foundation

public final class ApplicationCoordinator: ParentCoordinator {
    private let instructor: ApplicationLaunchInstructor
    private let coordinatorFactory: CoordinatorFactory

    init(instructor: ApplicationLaunchInstructor,
         router: Router,
         coordinatorFactory: CoordinatorFactory) {
        self.instructor = instructor
        self.coordinatorFactory = coordinatorFactory
        super.init(router: router)
    }

    public override func start() {
        runMainTabBarFlow()
    }

    private func runMainTabBarFlow() {
        let coordinator = coordinatorFactory.makeMainTabBarCoordinator(router: router)
        addDependency(coordinator)
        coordinator.start()
    }
}
