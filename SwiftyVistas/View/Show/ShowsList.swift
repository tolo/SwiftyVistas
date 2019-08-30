//
//  ShowsList.swift
//  SwiftyVistas
//
//  Created by Tobias Löfstrand on 2019-06-07.
//  Copyright © 2019 Tobias Löfstrand. All rights reserved.
//

import SwiftUI
import Combine

struct ShowsList : View {
  @EnvironmentObject private var showListModel: ShowsModel

  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        Text("SwiftyVistas").font(.custom("AvenirNext-Heavy", size: 36)).bold().padding(.top, 22).padding(.leading, 32)
        if showListModel.isLoading {
          LoadingView().padding([.bottom], 88).flexible()
        } else {
          List(showListModel.shows) { (s: Show) in
            NavigationLink(destination:
              ShowDetail(show: s, selectedEpisode: s.episodes[0])
                .environmentObject(FavoritesModel(show: s))
            ) {
                ShowListRow(item: s)
            }.accentColor(Color.white)
          }.padding([.top], 22)
        }
      }
        .navigationBarTitle(Text(""))
        .navigationBarHidden(true)
    }
      .background(Color.black)
      .onAppear() {
        self.showListModel.fetchShows()
      }
  }
}

private struct ShowListRow: View {
  let item: Show

  var body: some View {
    let gradient = LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.5), Color.black.opacity(0.5)]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 0))

    return HStack(spacing: 20) {
      Image(item.image).resizable()
        .frame(width: 120, height: 90)
        .border(gradient, width: 4).cornerRadius(4)
      VStack(alignment: .leading) {
        Text(item.title).bold()
        Text(item.description).font(.footnote)
      }
    }.padding([.top, .bottom], 20)
  }
}

#if DEBUG
struct ShowsList_Previews : PreviewProvider {
    static var previews: some View {
      ShowsList()
        .environmentObject(ShowsModel())
    }
}
#endif
