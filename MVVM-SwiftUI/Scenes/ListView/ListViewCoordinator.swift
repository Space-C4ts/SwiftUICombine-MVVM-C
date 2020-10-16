//
//  ListViewCoordinator.swift
//  MVVM-SwiftUI
//
//  Created by Anantachai Kulson on 17/10/2563 BE.
//

import Foundation
import Combine
import SwiftUI

protocol ListViewCoordinatorParamType {
    
}

class ListViewCoordinator: BaseCoordinator<Void>, ListViewCoordinatorParamType {
    
    override func start() -> AnyPublisher<Void, Error> {
        let window = self.window
        let viewModel = ListViewViewModel()
        let view = ListView().environmentObject(viewModel)
        transition(to: ContentViewType(view: AnyView(view)))
        return Empty().eraseToAnyPublisher()
    }
}
