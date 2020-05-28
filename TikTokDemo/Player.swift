//
//  Player.swift
//  TikTokDemo
//
//  Created by Puspank Kumar on 28/05/20.
//  Copyright © 2020 Puspank Kumar. All rights reserved.
//

import SwiftUI
import AVKit

struct Player: UIViewControllerRepresentable {
    var player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let view = AVPlayerViewController()
        view.player = player
        view.showsPlaybackControls = false
        view.videoGravity = .resizeAspectFill
        return view
        
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}

