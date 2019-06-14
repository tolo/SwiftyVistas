//
//  LoadingView.swift
//  SwiftyVistas
//
//  Created by Tobias Löfstrand on 2019-06-09.
//  Copyright © 2019 Tobias Löfstrand. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
  @State var rotation: Double = 0

  var body: some View {
    let gradient = AngularGradient(gradient: Gradient(colors: [.black, .white]), center: UnitPoint(x: 0.5, y: 0.5))

    return VStack {
      VStack {
        Spacer()
        HStack {
          Spacer()
          ZStack {
            Image("holuhraun").resizable()
              .aspectRatio(3.0 / 2.0, contentMode: .fit)
              .frame(maxHeight: 150, alignment: .center)
              .clipShape(Circle())

            Circle().fill(gradient)
              .frame(width: 150, height: 150, alignment: .center)
              .blendMode(.multiply)
              .rotationEffect(.degrees(rotation))
          }
          Spacer()
        }
        Spacer()
      }
    }
    .onAppear() {
      withAnimation(.basic(duration: 2.0)) {
        self.rotation = 1080
      }
    }
    .transition(.opacity)
  }
}

#if DEBUG
struct LoadingView_Previews : PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
#endif
