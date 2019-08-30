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

    return
      VStack {
        Spacer()
        HStack {
          Spacer()
          ZStack {
            Image("holuhraun").resizable()
              .aspectRatio(3.0 / 2.0, contentMode: .fit)
              .clipShape(Circle())
            Circle().fill(gradient)
              .blendMode(.multiply)
              .rotationEffect(.degrees(rotation))
          }.frame(width: 150, height: 150, alignment: .center)
          Spacer()
        }
        Spacer()
      }
      .onAppear() {
        withAnimation(.linear(duration: 2.0)) {
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
