//
//  UITableView+UU.swift
//  SwiftUUKit
//
//  Created by KUN on 2024/1/19.
//

import Foundation

extension UITableView {
    
    private struct AssociatedKeys {
        static var uu_dataSourceKey: UInt8 = 0
        static var uu_delegateKey: UInt8 = 0
    }
    
    weak var uu_dataSource: UUTableViewDataSource? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.uu_dataSourceKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.dataSource = newValue
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.uu_dataSourceKey) as? UUTableViewDataSource
        }
    }
    
    weak var uu_delegate: UUTableViewDelegate? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.uu_delegateKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.delegate = newValue
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.uu_delegateKey) as? UUTableViewDelegate
        }
    }
    
    public func uu_createDataSource() {
        let dataSource = UUTableViewDataSource()
        self.uu_dataSource = dataSource
    }
    
    public func uu_createDelegate() {
        let delegate = UUTableViewDelegate()
        self.uu_delegate = delegate
    }
    
    public func uu_createDelegateAndOtherTargets(_ targets: [AnyObject]?) {
        uu_createDelegate()
        if let targets = targets, !targets.isEmpty {
            let array = NSPointerArray(options: [])
            targets.enumerated().forEach { (index, target) in
                /// 使用 Unmanaged 类来管理内存
                /// 将目标对象转换为 Unmanaged<AnyObject> 类型
                array.addPointer(Unmanaged.passUnretained(target).toOpaque())
            }
            self.uu_delegate?.targets = array
        }
    }
    
    public func uu_insert(_ section: UUSectionAdapter, at index: Int) {
        self.uu_dataSource?.insert(section, at: index)
    }
    
    public func uu_add(_ sections: [UUSectionAdapter]) {
        self.uu_dataSource?.add(sections)
    }
    
    public func uu_remove(_ sectionAdapter: UUSectionAdapter) {
        self.uu_dataSource?.remove(sectionAdapter)
    }
    
    public func uu_removeAllSections() {
        self.uu_dataSource?.removeAllSections()
    }
    
    public func uu_allSections() -> [UUSectionAdapter] {
        return self.uu_dataSource?.allSections() ?? []
    }
}
