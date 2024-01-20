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

extension UITableViewCell: UUReusableView { }
extension UITableViewHeaderFooterView: UUReusableView { }

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
        cell.tableView = self
        cell.loadData(with: cellAdapter, for: indexPath)
        return cell
    }
    
    func dequeueReusableHeaderView<T: UUTableViewHeaderFooterView>(with sectionAdapter: UUSectionAdapter, for section: Int) -> T {
        let reuseIdentifier = sectionAdapter.reuseHeaderIdentifier ?? T.reuseIdentifier
        guard let header = dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? T else {
            fatalError("Could not dequeue reusableHeaderView with identifier: \(reuseIdentifier)")
        }
        
        header.sectionAdapter = sectionAdapter
        header.section = section
        header.tableView = self
        header.loadData(with: sectionAdapter, for: section)
        return header
    }
    
    func dequeueReusableFooterView<T: UUTableViewHeaderFooterView>(with sectionAdapter: UUSectionAdapter, for section: Int) -> T {
        let reuseIdentifier = sectionAdapter.reuseFooterIdentifier ?? T.reuseIdentifier
        guard let footer = dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? T else {
            fatalError("Could not dequeue reusablerFooterView with identifier: \(reuseIdentifier)")
        }
        
        footer.sectionAdapter = sectionAdapter
        footer.section = section
        footer.tableView = self
        footer.loadData(with: sectionAdapter, for: section)
        return footer
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
    
    public func uu_registerClassForHeaderFooter(_ aClass: AnyClass){
        let className = UUKitTool.classNameAsString(aClass)
        register(aClass, forHeaderFooterViewReuseIdentifier: className)
    }
    
    public func uu_registerNibForHeaderFooter(_ aClass: AnyClass){
        let className = UUKitTool.classNameAsString(aClass)
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: className)
    }
}
