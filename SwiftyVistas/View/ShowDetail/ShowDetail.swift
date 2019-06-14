//
//  ShowDetailView.swift
//  SwiftyVistas
//
//  Created by Tobias Löfstrand on 2019-06-09.
//  Copyright © 2019 Tobias Löfstrand. All rights reserved.
//

import SwiftUI

struct ShowDetail: View {
  @State var show: Show
  @EnvironmentObject private var favoritesModel: FavoritesModel

  @State var tabIndex: Int = 0
  @State var selectedEpisode: Episode

  var body: some View {
    VStack(alignment: .leading) {
      EpisodeSummaryView(selectedEpisode: $selectedEpisode)

      HStack(spacing: 30) {
        ActionButton(title: "My List", icon: "plus", alertMessage: "Favorite added",
                     action: { self.favoritesModel.addFavorite(self.selectedEpisode.id) })
        ActionButton(title: "Share", icon: "square.and.arrow.up", alertMessage: "Sharing is caring!",
                     action: {} )
        }.padding([.leading, .trailing, .top])

      HStack(spacing: 0) {
        TabButton(binding: $tabIndex, index: 0, title: "EPISODES")
        TabButton(binding: $tabIndex, index: 1, title: "MY LIST (\(favoritesModel.favoriteEpisodes.count))")
        Spacer()
      }.padding([.vertical], 20)

      if tabIndex == 0 {
        EpisodeList(episodes: show.episodes, selectedEpisode: $selectedEpisode)
      } else {
        FavoriteEpisodeList(selectedEpisode: $selectedEpisode, onDelete: { self.favoritesModel.removeFavorites($0) })
        .environmentObject(favoritesModel)
      }
    }
    .background(Color.black)
    .edgesIgnoringSafeArea(.top)
  }
}

private struct ActionButton: View {
  let title: String
  let icon: String
  let alertMessage: String
  let action: () -> Void

  @State var showAlert = false

  var body: some View {
    Button(action: {
      self.showAlert = true
    }) {
      VStack(spacing: 16) {
        Image(systemName: icon).imageScale(.large)
        Text(title).font(.footnote)
        }.foregroundColor(.white)
    }.presentation($showAlert) {
      Alert(title: Text(alertMessage), dismissButton: .default(Text("👍")) {
        self.action()
      })
    }
  }
}

private struct TabButton: View {
  let binding: Binding<Int>
  let index: Int
  let title: String

  var body: some View {
    Button(action: {
      self.binding.value = self.index
    }) {
      VStack {
        Rectangle().frame(minWidth: 0, minHeight: 3, maxHeight: 3, alignment: .leading)
          .foregroundColor(binding.value == index ? .red : .clear)
        Text(title).font(.footnote).bold().foregroundColor(.white).padding([.leading, .trailing])
      }
    }
  }
}

#if DEBUG
struct ShowDetail_Previews : PreviewProvider {
    static var previews: some View {
      ShowDetail(show: Show(placeholderWithTitle: "Iceland"),
                 selectedEpisode: Episode(placeholderWithTitle: "Holuharaun"))
    }
}
#endif
