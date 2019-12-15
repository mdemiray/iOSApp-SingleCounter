//
//  NavButton.swift
//  Counter
//
//  Created by Muharrem Demiray on 2017-02-09.
//  Copyright © 2017 Muharrem Demiray. All rights reserved.
//

import UIKit

class NavButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func draw(_ rect: CGRect) {
        
        // thickness of your line
        let lineThick:CGFloat = 2.0
        
        // length of your line relative to your button
        let lineLenght:CGFloat = min(bounds.width, bounds.height) * 0.8
        
        // color of your line
        let lineColor: UIColor = UIColor.white
        
        // this will add small padding from button border to your first line and other lines
        let marginGap: CGFloat = 5.0
        
        // we need three line
        for line in 0...2 {
            // create path
            let linePath = UIBezierPath()
            linePath.lineWidth = lineThick
            
            //start point of line
//            linePath.moveToPoint(CGPoint(
//                x: bounds.width/2 - lineLenght/2,
//                y: 6.0 * CGFloat(line) + marginGap
//            ))
            
            linePath.move(to: CGPoint(
                x: bounds.width/2 - lineLenght/2,
                y: 6.0 * CGFloat(line) + marginGap
            ))
            
            //end point of line
//            linePath.addLineToPoint(CGPoint(
//                x: bounds.width/2 + lineLenght/2,
//                y: 6.0 * CGFloat(line) + marginGap
//            ))
            
            linePath.addLine(to: CGPoint(
                x: bounds.width/2 + lineLenght/2,
                y: 6.0 * CGFloat(line) + marginGap
            ))
            
            //set line color
            lineColor.setStroke()
            
            //draw the line
            linePath.stroke()
        }
        
        
    }


}
