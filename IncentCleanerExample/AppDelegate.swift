//
//  AppDelegate.swift
//  IncentCleanerExample
//
//  Created by Appbooster on 05/09/2019.
//  Copyright © 2019 Appbooster. All rights reserved.
//

import UIKit
import IncentCleaner

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    // 1
    IncentCleaner.doIfNonIncent(type: .initial, desc: "Some analytics service initialization") {
      // Some analytics service initialization
    }

    // 2
    IncentCleaner.doIfNonIncent {
      // Track app launch to some analytics service
    }

    DispatchQueue.global(qos: .background).async {

      // Getting info needed to initialize some analytics service

      DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {

        // 3
        IncentCleaner.doIfNonIncent(type: .pre, desc: "User properties setting") {
          // Set user properties to some analytics service
        }

        IncentCleaner.activate()

        // The order of execution will be the following: 1 3 2

      }
    }

    return true
  }

}

