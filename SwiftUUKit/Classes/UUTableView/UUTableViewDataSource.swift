//
//  UUTableViewDataSource.swift
//  SwiftUUKit
//
//  Created by KUN on 2024/1/19.
//

import Foundation

class UUTableViewDataSource: NSObject {
    fileprivate var sectionAdapters: [UUSectionAdapter] = []
    fileprivate var sectionIndexTitles: [String] = []
    
    func insert(_ section: UUSectionAdapter, at index: Int) {
        sectionAdapters.insert(section, at: index)
    }
    
    func add(_ sections: [UUSectionAdapter]) {
        sectionAdapters.append(contentsOf: sections)
    }
    
    func remove(_ sectionAdapter: UUSectionAdapter) {
        sectionAdapters.removeAll { $0 === sectionAdapter}
    }
    
    func removeAllSections() {
        sectionAdapters.removeAll()
    }
    
    func allSections() -> [UUSectionAdapter] {
        return sectionAdapters
    }
    
    /// 右侧索引
    func configSectionIndexTitles(_ titles: [String]) {
        sectionIndexTitles.removeAll()
        sectionIndexTitles.append(contentsOf: titles)
    }
}


extension UUTableViewDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionAdapters.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section < sectionAdapters.count {
            let adapter = sectionAdapters[section]
            return adapter.cellAdapters.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let adapter = sectionAdapters[indexPath.section]
        let cellAdapter = adapter.cellAdapters[indexPath.row]
        return tableView.dequeueReusableCustomTableViewCell(with: cellAdapter, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let adapter = sectionAdapters[section]
        return adapter.titleForHeader
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let adapter = sectionAdapters[section]
        return adapter.titleForFooter
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if sectionIndexTitles.count > 0 {
            return sectionIndexTitles
        }
        return nil
    }
}
