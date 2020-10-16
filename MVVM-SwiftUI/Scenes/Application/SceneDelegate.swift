//
//  SceneDelegate.swift
//  MVVM-SwiftUI
//
//  Created by Anantachai Kulson on 17/10/2563 BE.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator!
    private var cancellables: Set<AnyCancellable> = []
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        window = UIWindow()
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            appCoordinator = AppCoordinator(window: self.window!)
            appCoordinator.start().sink { (_) in
            } receiveValue: { () in
            }.store(in: &cancellables)
        }
        
    }
}
