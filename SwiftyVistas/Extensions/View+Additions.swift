//
//  View+Additions.swift
//  SwiftyVistas
//
//  Created by Tobias Löfstrand on 2019-08-26.
//  Copyright © 2019 Tobias Löfstrand. All rights reserved.
//

import SwiftUI

extension View {
  func flexible() -> some View {
     return frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
  }
}
