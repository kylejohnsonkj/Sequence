//
//  Layout.swift
//  Chain Five
//
//  Created by Kyle Johnson on 1/2/18.
//  Copyright © 2018 Kyle Johnson. All rights reserved.
//

import UIKit

/// Everything needed for my custom layout.
class Layout {
    
    // primary scale indicators
    var iPad = false
    var cardSize: CGFloat
    var push: CGFloat
    
    // margins (based off primary)
    var leftMargin: CGFloat
    var topMargin: CGFloat
    var btmMargin: CGFloat
    var centerY: CGFloat
    
    // secondary scale indicators
    var scale: CGFloat
    var stroke: CGFloat
    var offset: CGFloat
    var imgSize: CGFloat
    var textPadding: CGFloat
    var distance: CGFloat
    
    // widths (based off secondary)
    var titleWidth: CGFloat
    var titleHeight: CGFloat
    var itemWidth: CGFloat
    var highlight: CGFloat
    
    // shared instance for multiple classes
    public class var shared: Layout {
        struct Static {
            static let instance = Layout()
        }
        return Static.instance
    }
    
    init() {
        let bounds = UIScreen.main.bounds
        
        // determine if iPad or not
        if bounds.width > CGFloat(414) {
            // it's an iPad, adapt for different aspect ratio
            iPad = true
            cardSize = bounds.width / 14
            push = cardSize * 0.73
        } else {
            iPad = false
            cardSize = bounds.width / 10.7
            push = cardSize * 0.63
        }
        
        leftMargin = bounds.midX - (cardSize * 5)
        topMargin = bounds.midY - (cardSize * 5) - push
        btmMargin = bounds.midY + (cardSize * 5) - push
        centerY = bounds.midY - push
        
        if iPad {
            scale = 3
            stroke = 2
            offset = cardSize / 2
            imgSize = cardSize * 2
        } else {
            scale = 2
            stroke = 1
            offset = cardSize / 4
            imgSize = cardSize * 2.25
        }
        
        textPadding = cardSize / 10
        distance = cardSize
        titleWidth = bounds.width / scale
        
        // screens smaller than 4 inches
        if bounds.height < CGFloat(568) {
            distance = cardSize / 2
            titleWidth = titleWidth * 0.9
        }
        
        titleHeight = titleWidth * 0.21
        itemWidth = titleWidth / 1.5
        highlight = cardSize / 12
    }
}

