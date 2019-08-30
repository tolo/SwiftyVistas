//
//  SceneDelegate.swift
//  SwiftyVistas
//
//  Created by Tobias Löfstrand on 2019-06-05.
//  Copyright © 2019 Tobias Löfstrand. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = scene as? UIWindowScene else { return }

    UINavigationBar.appearance().tintColor = .white

    let rootView = ShowsList()
      .environmentObject(ShowsModel())
      .colorScheme(.dark)
    
    let window = UIWindow(windowScene: windowScene)
    window.rootViewController = UIHostingController(rootView: rootView)
    self.window = window
    window.rootViewController?.view.backgroundColor = .black
    window.makeKeyAndVisible()
  }
}
