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
    
    static public func classNameAsString(_ anyClass: AnyClass) -> String {
        let fullClassName = NSStringFromClass(anyClass)
        let classNameComponents = fullClassName.components(separatedBy: ".")
        return classNameComponents.last ?? fullClassName
    }
    
    // 设备的宽高
    static public let width = UIScreen.main.bounds.size.width
    static public let height = UIScreen.main.bounds.size.height
    
    // 导航栏高度
    static public let navigationBarHeight: CGFloat = 44.0
    
    // 状态栏高度
    static public let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
    
    // 状态栏高度 + 导航栏高度
    static public let navStatusHeight: CGFloat = statusBarHeight + navigationBarHeight
    
    static public let safeAreaBottomHeight: CGFloat = statusBarHeight > 20 ? 34.0 : 0.0
    
    // 安全距离（iPhone X以上机型，需要在顶部和底部留出安全距离）
    static public let safeAreaInsets: UIEdgeInsets = {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets ?? .zero
        } else {
            return .zero
        }
    }()
}

extension UUKitTool {
    
    static public func createButton(title: String, frame: CGRect, target: Any?, action: Selector?) -> UIButton {
        let button = UIButton(frame: frame)
        button.setTitle(title, for: .normal)
        if let target = target, let action = action {
            button.addTarget(target, action: action, for: .touchUpInside)
        }
        return button
    }
    
    static public func createLabel(text: String, frame: CGRect, font: UIFont, textColor: UIColor) -> UILabel {
        let label = UILabel(frame: frame)
        label.text = text
        label.font = font
        label.textColor = textColor
        return label
    }
    
    static public func createTableView(frame: CGRect, style: UITableView.Style) -> UITableView {
        let view = UITableView(frame: frame, style: style)
        view.sectionHeaderHeight = 0
        view.sectionFooterHeight = 0
        view.separatorStyle = .none
        view.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        if #available(iOS 15.0, *) {
            view.sectionHeaderTopPadding
            = 0
        }
        if #available(iOS 11.0, *) {
            view.estimatedRowHeight = 0
            view.estimatedSectionFooterHeight = 0
            view.estimatedSectionHeaderHeight = 0
            view.contentInsetAdjustmentBehavior = .never
        }
        view.keyboardDismissMode = .onDrag
        return view
    }
}
