//
//  Shaoe.swift
//  Profile
//
//  Created by Paul Inventado on 4/14/22.
//

import Foundation
import SwiftUI

/*
 struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX / 2, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: 0))
        return path        
    }
}
 */

// TODO: Model 2 - Create  your own custom shape
struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX / 2, y: 0))
        //point between top and right
        path.addLine(to: CGPoint(x: rect.maxX / 1.7, y: rect.maxY / 3))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 2))
        //point between right and bottom right
        path.addLine(to: CGPoint(x: rect.maxX / 1.5, y: rect.maxY / 1.5))
        path.addLine(to: CGPoint(x: rect.maxX / 1.5, y: rect.maxY))
        //point between bottom right and bottom left
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: rect.maxY / 1.5))
        path.addLine(to: CGPoint(x: rect.maxX / 3.5, y: rect.maxY))
        //point between bottom left and left
        path.addLine(to: CGPoint(x: rect.maxX / 3.5, y: rect.maxY / 1.5))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY / 2))
        //point between left and top
        path.addLine(to: CGPoint(x: rect.maxX / 2.7, y: rect.maxY / 3))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: 0))
        
        return path
    }
}
