//
//  HomeTableHeaderView.swift
//  SwiftUUKit_Example
//
//  Created by KUN on 2024/1/20.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit
import SwiftUUKit

class HomeTableHeaderView: UUTableViewHeaderFooterView {
    
    private lazy var subLabel: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    override func makeUI() {
        contentView.backgroundColor = .cyan
        contentView.addSubview(subLabel)
        subLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 2, left: 10, bottom: 2, right: 10))
        }
        super.makeUI()
    }
    
    override func loadData(with sectionAdapter: UUSectionAdapter, for section: Int) {
        if let data = sectionAdapter.headerData {
            subLabel.text = "Section Header -- \(data)"
        }
    }
}


class HomeTableFooterView: UUTableViewHeaderFooterView {
    
    private lazy var subLabel: UILabel = {
        let label = UILabel(frame: CGRectZero)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    override func makeUI() {
        contentView.backgroundColor = .yellow
        contentView.addSubview(subLabel)
        subLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 2, left: 10, bottom: 2, right: 10))
        }
        super.makeUI()
    }
    
    override func loadData(with sectionAdapter: UUSectionAdapter, for section: Int) {
        if let data = sectionAdapter.headerData {
            subLabel.text = "Section Footer -- \(data)"
        }
    }
}
