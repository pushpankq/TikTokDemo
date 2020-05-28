//
//  PlayerView.swift
//  TikTokDemo
//
//  Created by Puspank Kumar on 28/05/20.
//  Copyright © 2020 Puspank Kumar. All rights reserved.
//

import SwiftUI

struct PlayerView: View {
    
    @Binding var data: [Video]
    var body: some View {
        VStack(spacing: 0) {
            
                ForEach(0..<self.data.count){ i in
                    
                    ZStack {
                    Player(player: self.data[i].player)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .offset(y: -10)
                    
                    if self.data[i].replay {
                        Button(action: {
                            
                            // playing the video againg
                            self.data[i].replay = false
                            self.data[i].player.seek(to: .zero)
                            self.data[i].player.play()
                        }) {
                            Image(systemName: "goforward")
                            .resizable()
                            .frame(width: 55, height: 60)
                            .foregroundColor(.white)
                        }
                    }
                }
            }
        }
        .onAppear {
            self.data[0].player.play()
            self.data[0].player.actionAtItemEnd = .none
            NotificationCenter.default.addObserver(forName: Notification.Name.AVPlayerItemDidPlayToEndTime, object: self.data[0].player.currentItem, queue: .main) { (_) in
                
                // identify end of the video
                // enable replay button
                self.data[0].replay = true
            }
        }
    }
}
