//
//  SceneDelegate.swift
//  Words Plus
//
//  Created by Rafal Grodzinski on 07/06/2019.
//  Copyright © 2019 UnalignedByte. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = UIHostingController(rootView: MainView().environmentObject(WordsStore()))
            window?.makeKeyAndVisible()
        }
    }
}

