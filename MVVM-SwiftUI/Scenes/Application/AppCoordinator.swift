//
//  AppCoordinator.swift
//  MVVM-SwiftUI
//
//  Created by Anantachai Kulson on 17/10/2563 BE.
//

import Foundation
import Combine
import SwiftUI

class AppCoordinator: BaseCoordinator<Void> {
    
    override func start() -> AnyPublisher<Void, Error> {
        let window = self.window
        return coordinate(to: ListViewCoordinator(window: window))
    }
    
}
