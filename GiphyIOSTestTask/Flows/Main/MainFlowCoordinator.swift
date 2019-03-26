//
//  MainFlowCoordinator.swift
//
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit
import Core
import Swinject

enum MainFlowEvent: Event {
     case openBrowse
}

final class MainFlowCoordinator: EventNode, FlowCoordinator {
    
    weak var containerViewController: UIViewController?
    
    private let container: Container
    
    init(parent: EventNode, container: Container) {
        self.container = Container(parent: container) {
            MainFlowAssembly().assemble(container: $0)
        }
        super.init(parent: parent)
        
        addHandlers()
    }
    
    func createFlow() -> UIViewController {
        let controller: BrowseViewController = container.autoresolve(argument: self)
        
        return controller
    }
    
    private func addHandlers() {
        addHandler { [weak self] (event: MainFlowEvent) in
            guard self != nil else { return }
            switch event {
            case .openBrowse:
                break
            }
        }
    }
    
}
