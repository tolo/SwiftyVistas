//
//  FavoritesModel.swift
//  SwiftyVistas
//
//  Created by Tobias Löfstrand on 2019-06-09.
//  Copyright © 2019 Tobias Löfstrand. All rights reserved.
//

import SwiftUI
import Combine

class FavoritesModel: ObservableObject {
  let objectWillChange = PassthroughSubject<FavoritesModel, Never>()
  
  let show: Show

  init(show: Show) {
    self.show = show
  }
  
  @UserDefault("FavoriteEpisodes", defaultValue: [])
  private (set) var favoriteEpisodeIds: [String] {
    didSet {
      objectWillChange.send(self)
    }
  }

  var favoriteEpisodes: [Episode] {
    favoriteEpisodeIds.compactMap { epId in
      show.episodes.first { ep in ep.id == epId }
    }
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
