//
//  ContentView.swift
//  SwiftyVistas
//
//  Created by Tobias Löfstrand on 2019-06-09.
//  Copyright © 2019 Tobias Löfstrand. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
