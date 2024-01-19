//
//  UUKitTool.swift
//  SwiftUUKit
//
//  Created by KUN on 2024/1/19.
//

import Foundation

open class UUKitTool {
    
    static public func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    static func classNameAsString(_ anyClass: AnyClass) -> String {
        let fullClassName = NSStringFromClass(anyClass)
        let classNameComponents = fullClassName.components(separatedBy: ".")
        return classNameComponents.last ?? fullClassName
    }
}
