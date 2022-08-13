//
//  ViewController.swift
//  MVCapp
//
//  Created by Alex Ovi on 25.04.2022.
//

import UIKit
import SnapKit

final class MainViewController:  UIViewController {
    
    private let customView = View()
    private let model = Model()
    private var goods = [Good]()
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goods = self.model.getGoods()
        self.view = self.customView
        self.customView.configView(controller: self)
        
    }
    
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.goods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.idCell, for: indexPath) as? CustomCell else { return UITableViewCell() }
        cell.configView()
        cell.configCell(goodsName: self.goods[indexPath.row].name, goodsPrice: self.goods[indexPath.row].price)
        return cell
    }
    
    
}

extension MainViewController {
    func signalEditedTextField(_ text: String?) {
        guard let text = text else {return}
        if text.isEmpty {
            self.goods = self.model.getGoods()
            self.customView.update()

        } else {
        self.goods = self.model.getGoods(by: text)
        self.customView.update()
        }
    }
}
