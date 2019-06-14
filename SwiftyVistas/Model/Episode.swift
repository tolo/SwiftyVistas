//
//  Episode.swift
//  SwiftyVistas
//
//  Created by Tobias Löfstrand on 2019-06-05.
//  Copyright © 2019 Tobias Löfstrand. All rights reserved.
//

import SwiftUI
import Foundation

struct Episode: Codable, Identifiable, Hashable {
  let episode: Int
  let season: Int
  let showId: String
  let title: String
  let description: String
  let image: String
  let length: String

  typealias ID = String
  var id: String { "\(showId)-E\(episode)S\(season)" }
  
  static func loadDefault() -> [Episode] {
    do {
      let data = try Data(contentsOf: Bundle.main.url(forResource: "episodes", withExtension: "json")!)
      return try JSONDecoder().decode([Episode].self, from: data)
    } catch _ {
      return [Episode(placeholderWithTitle: "Error")]
    }
  }
}

extension Episode {
  init(placeholderWithTitle title: String, description: String = "<n/a>") {
    self.init(episode: 1, season: 1, showId: "1", title: title, description: description, image: "holuhraun", length: "")
  }
}
