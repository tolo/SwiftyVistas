//
//  FavoritesModel.swift
//  SwiftyVistas
//
//  Created by Tobias Löfstrand on 2019-06-09.
//  Copyright © 2019 Tobias Löfstrand. All rights reserved.
//

import SwiftUI
import Combine

class FavoritesModel: BindableObject {
  let didChange = PassthroughSubject<FavoritesModel, Never>()

  let show: Show

  init(show: Show) {
    self.show = show
  }
  
  @UserDefault("FavoriteEpisodes", defaultValue: [])
  private (set) var favoriteEpisodeIds: [String] {
    didSet {
      didChange.send(self)
    }
  }

  var favoriteEpisodes: [Episode] {
    show.episodes.filter({ favoriteEpisodeIds.contains($0.id) })
  }

  func addFavorite(_ favorite: String) {
    if !favoriteEpisodeIds.contains(favorite) {
      favoriteEpisodeIds.append(favorite)
    }
  }

  func removeFavorites(_ indexSet: IndexSet) {
    indexSet.forEach { favoriteEpisodeIds.remove(at: $0) }
  }

  func removeFavorite(_ index: Int) {
    favoriteEpisodeIds.remove(at: index)
  }
}


@propertyWrapper
struct UserDefault<T> {
  let key: String
  let defaultValue: T

  var value: T {
    get {
      return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
    }
    set {
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }

  init(_ key: String, defaultValue: T) {
    UserDefaults.standard.register(defaults: [key: defaultValue])
    self.key = key
    self.defaultValue = defaultValue
  }
}
