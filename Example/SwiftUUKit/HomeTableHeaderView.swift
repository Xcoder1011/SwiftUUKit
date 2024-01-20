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
    
    private lazy var subBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Click", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .gray
        btn.addTarget(self, action: #selector(btnClick(_ :)), for: .touchUpInside)
        return btn
    }()
    
    override func makeUI() {
        contentView.backgroundColor = .cyan
        contentView.addSubview(subLabel)
        contentView.addSubview(subBtn)
        
        subLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.left.equalTo(10)
            make.right.equalTo(subBtn.snp.left).offset(-10)
        }
        subBtn.snp.makeConstraints { make in
            make.size.equalTo(CGSizeMake(60, 30))
            make.centerY.equalToSuperview()
            make.right.equalTo(-10)
        }
        super.makeUI()
    }
    
    @objc func btnClick(_ sender: UIButton) {
        if let delegate = sectionAdapter?.headerFooterDelegate, let data = sectionAdapter?.headerData {
            delegate.uu_tableView(self.tableView, in: self, eventData: data, actionType: 101)
        }
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
    
    private lazy var subBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Click", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .gray
        btn.addTarget(self, action: #selector(btnClick(_ :)), for: .touchUpInside)
        return btn
    }()
    
    override func makeUI() {
        contentView.backgroundColor = .yellow
        contentView.addSubview(subLabel)
        contentView.addSubview(subBtn)
        
        subLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.left.equalTo(10)
            make.right.equalTo(subBtn.snp.left).offset(-10)
        }
        subBtn.snp.makeConstraints { make in
            make.size.equalTo(CGSizeMake(60, 30))
            make.centerY.equalToSuperview()
            make.right.equalTo(-10)
        }
        super.makeUI()
    }
    
    @objc func btnClick(_ sender: UIButton) {
        if let delegate = sectionAdapter?.headerFooterDelegate, let data = sectionAdapter?.footerData {
            delegate.uu_tableView(self.tableView, in: self, eventData: data, actionType: 102)
        }
    }
    
    override func loadData(with sectionAdapter: UUSectionAdapter, for section: Int) {
        if let data = sectionAdapter.headerData {
            subLabel.text = "Section Footer -- \(data)"
        }
    }
}
