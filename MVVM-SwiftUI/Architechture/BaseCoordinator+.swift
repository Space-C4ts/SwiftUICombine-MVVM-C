//
//  BaseCoordinator+.swift
//  MVVM-SwiftUI
//
//  Created by Anantachai Kulson on 17/10/2563 BE.
//

import SwiftUI

struct ContentViewType {
     var view: AnyView
}

enum CoordinatorTransitionType {
    case push
    case modal
    case rootWindow
}

extension BaseCoordinator {
    func transition(to destinationView: ContentViewType) {
        switch transitionType {
        case .push:
            let view = destinationView.view
            let controller = UIHostingController(rootView: view)
            navigationController.navigationController?.pushViewController(controller, animated: true)
        case .modal:
            let view = destinationView.view
            let controller = UIHostingController(rootView: view)
            let baseViewController = UIHostingController(rootView: baseContentView.view)
            baseViewController.present(controller, animated: true, completion: nil)
        case .rootWindow:
            let view = destinationView.view
            let controller = UIHostingController(rootView: view)
            window.rootViewController = controller
            window.makeKeyAndVisible()
        }
    }
}
