//
//  IncButton.swift
//  Counter
//
//  Created by Muharrem Demiray on 2017-02-10.
//  Copyright © 2017 Muharrem Demiray. All rights reserved.
//

import UIKit

class IncButton: UIButton {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        // thickness of your line
        let lineThick:CGFloat = 2.0

        
        // color of your line
        let lineColor: UIColor = UIColor.white
        
        let linePath = UIBezierPath()
        linePath.lineWidth = lineThick
        
        
        let centerX = bounds.width / 2
        let centerY = bounds.height / 2
        
        let marginForLines = min(bounds.width, bounds.height) * 0.2
        let radiusOfCircle = min(bounds.width, bounds.height)/2 - marginForLines/2
        
        
        
        // Perpendicular line
        linePath.move(to: CGPoint(x: centerX,  y: marginForLines ))
        linePath.addLine(to: CGPoint(x:centerX,y: bounds.height - marginForLines) )
        //set line color
        lineColor.setStroke()
        //draw the line
        linePath.stroke()
        
        
        
        // Horizantol Line
        linePath.move(to: CGPoint(x: marginForLines,  y: centerY ))
        linePath.addLine(to: CGPoint(x: bounds.width - marginForLines, y: centerY) )
        //set line color
        lineColor.setStroke()
        //draw the line
        linePath.stroke()
        
        
        //Circle
        let circle = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY),
                                  radius: radiusOfCircle,
                                  startAngle: 0.0,
                                  endAngle: CGFloat(2 * M_PI),
                                  clockwise: true)
        circle.lineWidth = lineThick
        lineColor.setStroke()
        circle.stroke()
        
        
        
        
        
        
    }
 

}
