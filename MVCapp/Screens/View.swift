//
//  View.swift
//  MVCapp
//
//  Created by Alex Ovi on 26.04.2022.
//

import Foundation
import UIKit


final class View: UIView  {
    private weak var controller: MainViewController?
    
    
    private lazy var searchView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var textSearch: UITextField = {
        let txt = UITextField()
        txt.font = .boldSystemFont(ofSize: 16)
        txt.textColor = .black
        txt.addTarget(self, action: #selector(self.editedTextField), for: .editingChanged)
        return txt
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.setTitle("Поиск", for: .normal)
        return button
    }()
    
    private lazy var goodsTable: UITableView = {
        let table = UITableView()
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.idCell)
        table.backgroundColor = UIColor(white: 1, alpha: 5)
        table.layer.cornerRadius = 25
        table.dataSource = self.controller
        table.delegate = self.controller
        return table
    }()
    
}

private extension View {
    
    func setupConstraints() {
        setupSearchViewConstraints()
        setupSearchButtonConstrains()
        setupTextSearchConstrains()
        setupGoodsTableConstrains()
    }
    
    func setupSearchViewConstraints() {
        self.searchView.snp.makeConstraints { pin in
            pin.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            pin.height.equalTo(50)
            pin.left.equalTo(self).offset(30)
            pin.width.equalTo(250)
            
        }
    }
    
    func setupSearchButtonConstrains() {
        self.searchButton.snp.makeConstraints { pin in
            pin.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            pin.height.equalTo(50)
            pin.left.equalTo(searchView.snp.right).offset(20)
            pin.right.equalTo(self).inset(10)
        }
    }
    
    func setupTextSearchConstrains() {
        self.textSearch.snp.makeConstraints { pin in
            pin.top.equalTo(searchView)
            pin.height.equalTo(searchView)
            pin.left.equalTo(searchView).offset(10)
            pin.width.equalTo(searchView).inset(10)
            
        }
    }
    
    func setupGoodsTableConstrains() {
        self.goodsTable.snp.makeConstraints { pin in
            pin.top.equalTo(self.safeAreaLayoutGuide).offset(100)
            pin.bottom.equalTo(self).offset(-50)
            pin.left.equalTo(self).offset(30)
            pin.right.equalTo(self).offset(-30)
        }
    }
    
    
    func setupViews() {
        self.addSubview(self.searchView)
        self.addSubview(self.searchButton)
        self.addSubview(self.goodsTable)
        self.addSubview(self.textSearch)
    }
    
    @objc func editedTextField() {
        self.controller?.signalEditedTextField(self.textSearch.text)
    }
    
}


extension View {
    func configView(controller: MainViewController) {
        self.controller = controller
        self.setupViews()
        self.setupConstraints()
        self.backgroundColor = .systemTeal
        
    }
    
    func update() {
        self.goodsTable.reloadData()
    }
    
}
