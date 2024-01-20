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
    
    // 设备的宽高
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    
    // 导航栏高度
    static let navigationBarHeight: CGFloat = 44.0
    
    // 状态栏高度
    static let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
    
    // 安全距离（iPhone X以上机型，需要在顶部和底部留出安全距离）
    static let safeAreaInsets: UIEdgeInsets = {
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
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
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
    
    static public func createTableView(frame: CGRect, style: UITableView.Style, delegate: UITableViewDelegate?, dataSource: UITableViewDataSource?) -> UITableView {
        let tableView = UITableView(frame: frame, style: style)
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        return tableView
    }
}
