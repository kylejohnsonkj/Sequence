//
//  Layout.swift
//  Chain Five
//
//  Created by Kyle Johnson on 1/2/18.
//  Copyright © 2018 Kyle Johnson. All rights reserved.
//

import UIKit

class Layout {
    
    // main scale indicators
    var iPad = false
    var cardSize: CGFloat
    
    // margins
    var leftMargin: CGFloat
    var topMargin: CGFloat
    var btmMargin: CGFloat
    
    // other scale indiactors
    var scale: CGFloat
    var offset: CGFloat
    var textPadding: CGFloat
    var imgSize: CGFloat
    var stroke: CGFloat
    
    // scale dependent
    var titleWidth: CGFloat
    var titleHeight: CGFloat
    var itemWidth: CGFloat
    
    init() {
        let view = UIApplication.shared.keyWindow!
        
        // determine if iPad or not and set scale
        if (UIApplication.shared.keyWindow?.bounds.width)! > CGFloat(414) {
            // it's an iPad, adapt for different aspect ratio
            iPad = true
            cardSize = view.bounds.width / 14
        } else {
            iPad = false
            cardSize = view.bounds.width / 10.7
        }
        
        leftMargin = view.frame.midX - (self.cardSize * 5)
        topMargin = view.frame.midY - (self.cardSize * 5) - cardSize / 2
        btmMargin = view.frame.midY + (self.cardSize * 5) - cardSize / 2

        if iPad {
            stroke = 2
            offset = cardSize / 3
            textPadding = 10
            imgSize = cardSize * 2
            scale = 3
        } else {
            scale = 2
            offset = cardSize / 6
            textPadding = 0
            imgSize = cardSize * 2.25
            stroke = 1
        }
        
        titleWidth = view.bounds.width / scale
        titleHeight = titleWidth * 0.2
        itemWidth = titleWidth / 1.5
    }
}