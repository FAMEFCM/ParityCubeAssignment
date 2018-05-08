//
//  TriangleView.swift
//  ParityCubeTest
//
//  Created by Mahima Gupta on 5/8/18.
//  Copyright © 2018 Kartik Gupta. All rights reserved.
//

import UIKit
class TriangleView : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
//
//    override func draw(_ rect: CGRect) {
//
//        guard let context = UIGraphicsGetCurrentContext() else { return }
//
//        context.beginPath()
//        context.move(to: CGPoint(x: rect.minX, y: rect.maxY))
//        context.addLine(to: CGPoint(x: rect.maxY, y: rect.maxX))
//        context.addLine(to: CGPoint(x: rect.minY, y: (rect.maxX / 2.0)))
//        context.closePath()
//
//        context.setFillColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 0.60)
//        context.fillPath()
//    }
//
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.beginPath()
        ctx?.move(to: CGPoint(x: rect.minX, y: rect.minY))
        // top left
        ctx?.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        // mid right
        ctx?.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        // bottom left
        ctx?.closePath()
        ctx?.setFillColor(UIColor.clear.cgColor)
        ctx?.fillPath()
    }
}
