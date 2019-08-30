//
//  EpisodeSummaryView.swift
//  SwiftyVistas
//
//  Created by Tobias Löfstrand on 2019-06-08.
//  Copyright © 2019 Tobias Löfstrand. All rights reserved.
//

import SwiftUI

struct EpisodeSummaryView : View {
  @Binding var selectedEpisode: Episode
  @State var playbackError = false

  var body: some View {
    VStack(alignment: .leading) {
      ZStack(alignment: .bottomTrailing) {
        Image(selectedEpisode.image).resizable()
          .frame(minHeight: 250, idealHeight: 250, alignment: .top)
        CircleIconButton(imageSystemName: "play") {
          self.playbackError = true
        }
      }
      
      HStack(spacing: 20) {
        Text("★★★★★").padding(.trailing, 10).foregroundColor(.red)
        Text("2019").font(.callout)
        Text("4+").font(.callout)
        Text("1 season").font(.callout)
      }.padding([.leading, .trailing])

      HStack(spacing: 20) {
        Text("S\(selectedEpisode.season):E\(selectedEpisode.episode)").font(.headline)
        Text(selectedEpisode.title).font(.headline).padding(.leading, 20)
      }.padding([.leading, .trailing])

      VStack(alignment: .leading, spacing: 5) {
        Text(selectedEpisode.description).font(.callout).lineLimit(5)
        Text("Cast: Mother Nature").font(.callout).bold()
        Text("Creators: Tobias Löfstrand, Mother Nature").font(.callout).bold()
      }
      .padding([.leading, .trailing, .top])

    }
    .background(Color.black)
    .alert(isPresented: $playbackError) {
      Alert(title: Text("Alerts are"), message: Text("delightful"), dismissButton: .default(Text("Got it!")))
    }
  }
}

#if DEBUG
struct EpisodeSummaryView_Previews : PreviewProvider {
  @State private static var selectedEpisode: Episode = Episode(placeholderWithTitle: "Holuhraun")

  static var previews: some View {
    EpisodeSummaryView(selectedEpisode: $selectedEpisode)
      .background(Color.black)
      .previewLayout(.sizeThatFits)
      .edgesIgnoringSafeArea(.top)
      .colorScheme(.dark)
  }
}
#endif
