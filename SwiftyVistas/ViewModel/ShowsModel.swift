//
//  ShowsListViewModel.swift
//  SwiftyVistas
//
//  Created by Tobias Löfstrand on 2019-06-08.
//  Copyright © 2019 Tobias Löfstrand. All rights reserved.
//

import Combine
import SwiftUI

class ShowsModel: BindableObject {
  let didChange = PassthroughSubject<ShowsModel, Never>()

  private (set) var isLoading: Bool = false

  private (set) var shows: [Show] = []

  func fetchShows() {
    isLoading = true
    didChange.send(self)

    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      self.isLoading = false
      self.shows = Show.loadDefault()
      self.didChange.send(self)
    }
  }
}
