//
//  DemoViewController.swift
//  FGToolKit
//
//  Created by xgf on 2018/1/26.
//  Copyright © 2018年 xgf. All rights reserved.
//

import UIKit

enum DemoType : Int {
    case unknow = -1
    case timer
    case control
    case arrow
    case format
    case hex
    case cirle
    case action
    case chinese
}

class DemoViewController: UIViewController {
    
    var type:DemoType = .unknow
    private var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    private func createUI() {
        view.backgroundColor = .white
        switch type {
        case .timer:
            let lb = UILabel.init(frame: .init(x: 50, y: 200, width: view.bounds.size.width - 100, height: 80))
            lb.textColor = .black
            lb.textAlignment = .center
            lb.font = .systemFont(ofSize: 40)
            view.addSubview(lb)
            let fmt = DateFormatter.init()
            fmt.dateFormat = "HH:mm:ss"
            lb.text = fmt.string(from: Date.init())
            timer = Timer.fg_scheduledTimer(interval: 1, repeats: true, block: { (sender) in
                lb.text = fmt.string(from: Date.init())
            })
            break
        case .control:
            let btn = UIButton.init(frame: .init(x: (view.bounds.size.width - 60)/2, y: 200, width: 60, height: 40))
            btn.setTitleColor(.blue, for: .normal)
            btn.setTitle("点 我", for: .normal)
            btn.titleLabel?.font = .systemFont(ofSize: 20)
            view.addSubview(btn)
            weak var wkself = self
            btn.handleClick(events: .touchUpInside, click: { (sender) in
                let alert = UIAlertController.init(title: "嘿嘿", message: "你点了我", preferredStyle: .alert)
                let ok = UIAlertAction.init(title: "知道了", style: .default, handler: nil)
                alert.addAction(ok)
                wkself?.present(alert, animated: true, completion: nil)
            })
            break
        case .arrow:
            let imageView1 = UIImageView.init(frame: .init(x: (view.bounds.size.width - 200)/2, y: 100, width: 200, height: 100))
            let image = UIImage.init(named: "test")
            imageView1.image = image?.arrowed(.left, resizeTo: .init(width: 200, height: 100))
            view.addSubview(imageView1)
            
            let imageView2 = UIImageView.init(frame: .init(x: (view.bounds.size.width - 200)/2, y: 250, width: 200, height: 100))
            imageView2.image = image?.arrowed(.right, resizeTo: .init(width: 200, height: 100))
            view.addSubview(imageView2)
            break
        case .format:
            let lb = UILabel.init(frame: .init(x: 50, y: 200, width: view.bounds.size.width - 100, height: 80))
            lb.textColor = .black
            lb.textAlignment = .center
            lb.font = .systemFont(ofSize: 30)
            view.addSubview(lb)
            lb.text = Date.init(timeIntervalSinceNow: -48 * 3600).formatedTime
            break
        case .hex:
            let lb = UILabel.init(frame: .init(x: 50, y: 200, width: view.bounds.size.width - 100, height: 80))
            lb.textColor = hexcolor(0xa115c6)
            lb.hex = 0xf4f4f4
            lb.textAlignment = .center
            lb.font = .systemFont(ofSize: 40)
            view.addSubview(lb)
            let fmt = DateFormatter.init()
            fmt.dateFormat = "HH:mm:ss"
            lb.text = fmt.string(from: Date.init())
            timer = Timer.fg_scheduledTimer(interval: 1, repeats: true, block: { (sender) in
                lb.text = fmt.string(from: Date.init())
                lb.textColor = UIColor.init(hex: UInt(arc4random_uniform(0xffffff) + 1))
                lb.hex = UInt(arc4random_uniform(0xffffff) + 1)
            })
            break
        case .cirle:
            let imageView = UIImageView.init(frame: .init(x: (view.bounds.size.width - 200)/2, y: 200, width: 200, height: 200))
            let image = UIImage.init(named: "test")
            imageView.image = image?.cirled()
            view.addSubview(imageView)
            break
        case .action:
            let lb = UILabel.init(frame: .init(x: (view.bounds.size.width - 200)/2, y: 200, width: 200, height: 40))
            lb.layer.cornerRadius = 8
            lb.clipsToBounds = true
            lb.textColor = .black
            lb.textAlignment = .center
            lb.text = "我是文本，点我"
            lb.font = .systemFont(ofSize: 15)
            view.addSubview(lb)
            weak var wkself = self
            lb.addTap(handler: { (sender) in
                let alert = UIAlertController.init(title: "嘿嘿", message: "你点了我", preferredStyle: .alert)
                let ok = UIAlertAction.init(title: "知道了", style: .default, handler: nil)
                alert.addAction(ok)
                wkself?.present(alert, animated: true, completion: nil)
            })
            break
        case .chinese:
            let lb = UILabel.init(frame: .init(x: (view.bounds.size.width - 200)/2, y: 200, width: 200, height: 40))
            lb.layer.cornerRadius = 8
            lb.clipsToBounds = true
            lb.textAlignment = .center
            lb.textColor = .black
            lb.text = "点我转拼音"
            lb.font = .systemFont(ofSize: 15)
            view.addSubview(lb)
            weak var wklb = lb
            lb.addTap(handler: { (sender) in
                wklb?.text = wklb?.text?.pinyin
            })
            break
        default:
            break
        }
    }
    deinit {
        if timer != nil {
            timer?.invalidate()
        }
    }
}
