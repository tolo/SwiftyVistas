//
//  CircleIconButton.swift
//  SwiftyVistas
//
//  Created by Tobias Löfstrand on 2019-08-26.
//  Copyright © 2019 Tobias Löfstrand. All rights reserved.
//

import SwiftUI

struct CircleIconButton: View {
  var imageSystemName: String
  var action: () -> Void

  var body: some View {
    Button(action: {
      self.action()
    }, label: {
      ZStack(alignment: .center) {
        Circle().foregroundColor(Color.black.opacity(0.5))
        Image(systemName: imageSystemName).foregroundColor(Color.white).padding(EdgeInsets(top: 12, leading: 13, bottom: 12, trailing: 11))
        Circle().stroke(Color.white)
        }.fixedSize().padding()
    })
  }
}

#if DEBUG
struct CircleIconButton_Previews : PreviewProvider {
    static var previews: some View {
      CircleIconButton(imageSystemName: "play") {}
    }
}
#endif
