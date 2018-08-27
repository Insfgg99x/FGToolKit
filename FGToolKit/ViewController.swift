//
//  ViewController.swift
//  FGToolKit
//
//  Created by xgf on 2018/1/26.
//  Copyright © 2018年 xgf. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        createUI()
    }
    private func setup() {
        title = "FGToolKitExample"
        array = ["Timer + Block",
                 "UIControl + Action",
                 "UIImage + Arrow",
                 "Date + Format",
                 "UIColor + Hex",
                 "UIImage + Circle",
                 "UIView + Action",
                 "String + Chinese",
                 "FGWebImage",
                 "ImageCropView",
                 "Maker",
                 "UITextField + ToolBar"]
    }
    private func createUI() {
        let tb = UITableView.init(frame: view.bounds, style: .plain)
        tb.rowHeight = 40
        tb.tableFooterView = UIView.init()
        tb.delegate = self
        tb.dataSource = self
        view.addSubview(tb)
    }
}
//MARK: -
//MARK: UITalbeView
extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cid")
        if(cell == nil) {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cid")
            cell?.selectionStyle = .none
            cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        }
        let name = array[indexPath.row]
        cell?.textLabel?.text = name
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = array[indexPath.row]
        let vc = DemoViewController()
        vc.title = name
        vc.type = DemoType(rawValue: indexPath.row)!
        navigationController?.pushViewController(vc, animated: true)
    }
}

