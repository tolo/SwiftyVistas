//
//  EpisodeList.swift
//  SwiftyVistas
//
//  Created by Tobias Löfstrand on 2019-06-07.
//  Copyright © 2019 Tobias Löfstrand. All rights reserved.
//

import SwiftUI

struct EpisodeList: View {
  @State var episodes: [Episode]
  @Binding var selectedEpisode: Episode
//  var onDelete: ((IndexSet) -> Void)?

  var body: some View {
    List {
      ForEach(episodes) { e in
        Button(action: {
          self.$selectedEpisode.value = e
        }, label: {
          EpisodeListRow(item: e, isSelected: e == self.$selectedEpisode.value)
        })
      }
//      .onDelete(perform: onDelete)
    }
  }
}

struct FavoriteEpisodeList: View {
  @Binding var selectedEpisode: Episode
  var onDelete: (IndexSet) -> Void

  @EnvironmentObject private var favoritesModel: FavoritesModel

  var body: some View {
    List {
      ForEach(favoritesModel.favoriteEpisodes) { e in
        Button(action: {
          self.$selectedEpisode.value = e
        }, label: {
          EpisodeListRow(item: e, isSelected: e == self.$selectedEpisode.value)
        })
        }
        .onDelete(perform: onDelete)
    }
  }
}


private struct EpisodeListRow: View {
  let item: Episode
  let isSelected: Bool
  
  var body: some View {
    let gradient = LinearGradient(gradient: Gradient(colors: [.purple, .pink ,.orange]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 0))
    let imageElement = Image(item.image).resizable().frame(width: 120, height: 90)
    
    return HStack(spacing: 20) {
      if isSelected {
        imageElement.border(gradient, width: 4).cornerRadius(4)
      } else {
        imageElement.border(Color.clear, width: 4).cornerRadius(4)
      }
      
      VStack(alignment: .leading) {
        Text(item.title).bold()
        Text(item.length).font(.footnote)
      }
    }
  }
}


#if DEBUG
struct EpisodeList_Previews : PreviewProvider {
  @State private static var selectedEpisode: Episode = Episode(placeholderWithTitle: "Holuhraun")

  static var previews: some View {
//    EpisodeList(show: Show(placeholderWithTitle: "Iceland"), selectedEpisode: $selectedEpisode)
//      .colorScheme(.dark)
    EpisodeList(episodes: [Episode(placeholderWithTitle: "Holuhraun")], selectedEpisode: $selectedEpisode)
      .colorScheme(.dark)
  }
}
#endif
