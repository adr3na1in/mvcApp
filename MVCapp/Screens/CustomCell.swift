//
//  CustomCell.swift
//  MVCapp
//
//  Created by Alex Ovi on 25.04.2022.
//
import UIKit

class CustomCell: UITableViewCell {
    static let idCell = "1234"
    private lazy var goodsName: UILabel = {
        let obj = UILabel()
        obj.font = .boldSystemFont(ofSize: 25)
        return obj
    }()
    
    private lazy var goodsPrice: UILabel = {
        let obj = UILabel()
        obj.font = .boldSystemFont(ofSize: 15)
        return obj
    }()
    
    
    
    func configCell(goodsName: String, goodsPrice: Int) {
        self.goodsName.text = "\(goodsName)"
        self.goodsPrice.text = "\(goodsPrice)"
        
        
    }
    func configView() {
        self.contentView.addSubview(self.goodsName)
        self.contentView.addSubview(self.goodsPrice)
        self.contentView.backgroundColor = .white
        
    
        
        
        self.goodsName.snp.makeConstraints { pin in
            pin.top.equalToSuperview().offset(5)
            pin.left.equalToSuperview().offset(20)
            pin.right.equalToSuperview().offset(-5)
            pin.bottom.equalTo(self.contentView.snp.centerY)
        }
        
        self.goodsPrice.snp.makeConstraints { pin in
            pin.left.right.equalTo(self.goodsName).offset(30)
            pin.top.equalTo(self.goodsName.snp.bottom).offset(5)
            pin.bottom.equalToSuperview().offset(-10)
        }
    }
    
}
