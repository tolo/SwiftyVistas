//
//  ShowsListViewModel.swift
//  SwiftyVistas
//
//  Created by Tobias Löfstrand on 2019-06-08.
//  Copyright © 2019 Tobias Löfstrand. All rights reserved.
//

import Combine
import SwiftUI

class ShowsModel: ObservableObject {
  @Published var isLoading: Bool = false
  @Published var shows: [Show] = []

  func fetchShows() {
    isLoading = true

    // Simulate loading of data over network
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      self.isLoading = false
      self.shows = Show.loadDefault()
    }
  }
}
