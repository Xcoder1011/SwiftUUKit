//
//  UUTableViewDelegate.swift
//  SwiftUUKit
//
//  Created by KUN on 2024/1/19.
//

import Foundation

class UUTableViewDelegate: NSObject { }

extension UUTableViewDelegate: UITableViewDelegate {
   
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
}
