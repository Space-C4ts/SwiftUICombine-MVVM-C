//
//  BaseCoordinator.swift
//  MVVM-SwiftUI
//
//  Created by Anantachai Kulson on 16/10/2563 BE.
//

import Foundation
import Combine
import SwiftUI

class BaseCoordinator<ResultType> {
    
    typealias CoordinationResultType = ResultType
    private var cancellables: Set<AnyCancellable> = []
    public var childCoordinator = [UUID:Any]()
    private let indentifier = UUID()
    internal let window: UIWindow
    internal let baseContentView: ContentViewType
    internal let transitionType: CoordinatorTransitionType
    internal let animated: Bool
    
    var navigationController: UINavigationController! {
        window.rootViewController as? UINavigationController
    }
    
    init(window: UIWindow,
         baseContentView: ContentViewType = ContentViewType(view: AnyView(ListView().environmentObject(ListViewViewModel()))),
         transitionType: CoordinatorTransitionType = .rootWindow, animated: Bool = true) {
        self.window = window
        self.baseContentView = baseContentView
        self.transitionType = transitionType
        self.animated = animated
    }
    
    private func store<T>(coordinator: BaseCoordinator<T>) {
        childCoordinator[coordinator.indentifier] = coordinator
    }
    
    func free<T>(coordinator: BaseCoordinator<T>) {
        childCoordinator[coordinator.indentifier] = nil
    }
    
    func coordinate<T>(to coordinator: BaseCoordinator<T>) -> AnyPublisher<T, Error>{
        store(coordinator: coordinator)
        free(coordinator: coordinator)
        return coordinator.start()
    }
    
    func start() -> AnyPublisher<ResultType, Error> {
        fatalError("Start method should be implement")
    }
    
    func navigateToTarget<T>(target: BaseCoordinator<T>) -> AnyPublisher<T, Error> {
        return coordinate(to: target)
    }
}

