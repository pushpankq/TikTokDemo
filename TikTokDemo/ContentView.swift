//
//  ContentView.swift
//  TikTokDemo
//
//  Created by Puspank Kumar on 28/05/20.
//  Copyright © 2020 Puspank Kumar. All rights reserved.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class Host : UIHostingController<ContentView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}





