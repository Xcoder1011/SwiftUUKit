//
//  UUTableViewDelegate.swift
//  SwiftUUKit
//
//  Created by KUN on 2024/1/19.
//

import Foundation

class UUTableViewDelegate: NSObject {
    var targets: NSPointerArray = NSPointerArray(options: .weakMemory)
}

extension UUTableViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) as? UUCustomTableViewCell, let delegate = cell.cellAdapter?.cellDelegate {
            delegate.uu_tableView(tableView, didSelect: cell)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section < tableView.uu_allSections().count {
            let adapter = tableView.uu_allSections()[indexPath.section]
            let cellAdapter = adapter.cellAdapters[indexPath.row]
            return cellAdapter.cellHeight
        }
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section < tableView.uu_allSections().count {
            let adapter = tableView.uu_allSections()[section]
            return adapter.headerHeight
        }
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section < tableView.uu_allSections().count {
            let adapter = tableView.uu_allSections()[section]
            return adapter.footerHeight
        }
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section < tableView.uu_allSections().count {
            let adapter = tableView.uu_allSections()[indexPath.section]
            let cellAdapter = adapter.cellAdapters[indexPath.row]
            return cellAdapter.cellHeight
        }
        return 60
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        if section < tableView.uu_allSections().count {
            let adapter = tableView.uu_allSections()[section]
            return adapter.headerHeight
        }
        return 45
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        if section < tableView.uu_allSections().count {
            let adapter = tableView.uu_allSections()[section]
            return adapter.footerHeight
        }
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section < tableView.uu_allSections().count {
            let adapter = tableView.uu_allSections()[section]
            if let header = adapter.headerView {
                return header
            }
            return tableView.dequeueReusableHeaderView(with: adapter, for: section)
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section < tableView.uu_allSections().count {
            let adapter = tableView.uu_allSections()[section]
            if let header = adapter.footerView {
                return header
            }
            return tableView.dequeueReusableFooterView(with: adapter, for: section)
        }
        return nil
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        weakTargetExec(#selector(UITableViewDelegate.scrollViewDidScroll(_:))) { target in
            target.scrollViewDidScroll?(scrollView)
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        weakTargetExec(#selector(UITableViewDelegate.scrollViewWillBeginDragging(_:))) { target in
            target.scrollViewWillBeginDragging?(scrollView)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        weakTargetExec(#selector(UITableViewDelegate.scrollViewDidEndDragging(_:willDecelerate:))) { target in
            target.scrollViewDidEndDragging?(scrollView, willDecelerate: decelerate)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        weakTargetExec(#selector(UITableViewDelegate.scrollViewDidEndDecelerating(_:))) { target in
            target.scrollViewDidEndDecelerating?(scrollView)
        }
    }
    
    
    private func weakTargetExec(_ aSelector: Selector, complete: ((UITableViewDelegate)->())?) {
        if targets.count > 0 {
            /// 遍历之前清除野指针
            targets.compact()
            for i in 0 ..< targets.count {
                if let targetPtr = targets.pointer(at: i) {
                    if let target = Unmanaged<NSObject>.fromOpaque(targetPtr).takeUnretainedValue() as? UITableViewDelegate, target.responds(to: aSelector) {
                        if let complete = complete {
                            complete(target)
                        }
                    }
                }
            }
        }
    }
}
