//
//  UITableView+UUCustomTableViewCell.swift
//  SwiftUUKit
//
//  Created by KUN on 2024/1/19.
//

import Foundation

protocol UUReusableView {
    static var reuseIdentifier: String { get }
}

extension UUReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: UUReusableView {
    
}

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableCustomTableViewCell<T: UUCustomTableViewCell>(with cellAdapter: UUCellAdapter, for indexPath: IndexPath) -> T {
        let reuseIdentifier = cellAdapter.reuseIdentifier ?? T.reuseIdentifier
        guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue customTableViewCell with identifier: \(reuseIdentifier)")
        }
        cell.cellAdapter = cellAdapter
        cell.indexPath = indexPath
        cell.loadData(with: cellAdapter, for: indexPath)
        return cell
    }
    
    public func uu_registerClassForCell(_ cellClass: AnyClass){
        let className = UUKitTool.classNameAsString(cellClass)
        register(cellClass, forCellReuseIdentifier: className)
    }
    
    public func uu_registerNibForCell(_ cellClass: AnyClass){
        let className = UUKitTool.classNameAsString(cellClass)
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }
}
