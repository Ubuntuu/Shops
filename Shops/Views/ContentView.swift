//
//  ContentView.swift
//  Shops
//
//  Created by Tommy Troest on 27/11/2019.
//  Copyright © 2019 Tommy Troest. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        MapView()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
