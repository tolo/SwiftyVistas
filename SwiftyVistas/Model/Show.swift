//
//  Show.swift
//  SwiftyVistas
//
//  Created by Tobias Löfstrand on 2019-06-07.
//  Copyright © 2019 Tobias Löfstrand. All rights reserved.
//

import SwiftUI

struct Show: Codable, Identifiable, Hashable {
  let showId: String
  let title: String
  let description: String
  let image: String

  var episodes: [Episode] = []
  
  typealias ID = String
  var id: String { showId }
  
  static func loadDefault() -> [Show] {
    do {
      let data = try Data(contentsOf: Bundle.main.url(forResource: "shows", withExtension: "json")!)
      return try JSONDecoder().decode([Show].self, from: data)
    } catch _ {
      return [Show(showId: "?", title: "Error", description: "", image: "holuhraun")]
    }
  }
}

extension Show {
  init(placeholderWithTitle title: String, description: String = "<n/a>") {
    self.init(showId: "is", title: title, description: description, image: "holuhraun")
  }
}
