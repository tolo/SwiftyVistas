//
//  UserDefaultPropertyWrapper.swift
//  SwiftyVistas
//
//  Created by Tobias Löfstrand on 2019-08-26.
//  Copyright © 2019 Tobias Löfstrand. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
  let key: String
  let defaultValue: T

  var wrappedValue: T {
    get {
      return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
    }
    set {
      UserDefaults.standard.set(newValue, forKey: key)
      UserDefaults.standard.synchronize()
    }
  }

  init(_ key: String, defaultValue: T) {
    UserDefaults.standard.register(defaults: [key: defaultValue])
    self.key = key
    self.defaultValue = defaultValue
  }
}
