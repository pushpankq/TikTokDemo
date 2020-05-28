//
//  Video.swift
//  TikTokDemo
//
//  Created by Puspank Kumar on 28/05/20.
//  Copyright © 2020 Puspank Kumar. All rights reserved.
//

import SwiftUI
import AVKit

struct Video: Identifiable {
    var id: Int
    var player: AVPlayer
    var replay: Bool
}
