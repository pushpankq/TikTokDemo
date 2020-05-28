//
//  PlayerScrollView.swift
//  TikTokDemo
//
//  Created by Puspank Kumar on 28/05/20.
//  Copyright © 2020 Puspank Kumar. All rights reserved.
//

import SwiftUI

struct PlayerScrollView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return PlayerScrollView.Coordinator(parent1: self)
    }
    
    @Binding var data: [Video]
    
    func makeUIView(context: Context) -> UIScrollView {
        let view = UIScrollView()
        let childView = UIHostingController(rootView: PlayerView(data: $data))
        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        view.addSubview(childView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        
        for i in 0..<uiView.subviews.count {
            uiView.subviews[i].frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
        }
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
       
        var parent: PlayerScrollView
        var index = 0
        
        init(parent1: PlayerScrollView) {
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let currentindex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
            
            if index != currentindex {
                index = currentindex
                
                for i in 0..<parent.data.count {
                    
                    // pausing all other video
                    parent.data[i].player.seek(to: .zero)
                    parent.data[i].player.pause()
                }
                
                // playing next video
                parent.data[index].player.play()
                parent.data[index].player.actionAtItemEnd = .none
                NotificationCenter.default.addObserver(forName: Notification.Name.AVPlayerItemDidPlayToEndTime, object: parent.data[index].player.currentItem, queue: .main) { (_) in
                    
                    // identify end of the video
                    // enable replay button
                    self.parent.data[self.index].replay = true
                }
            }
            print(index)
        }
    }
}
