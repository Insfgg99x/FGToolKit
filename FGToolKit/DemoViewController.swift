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
    case webimage
    case crop
    case make
    case toolbar
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
        case .webimage:
            let url = "http://upload-images.jianshu.io/upload_images/937405-e91a649f7a7df2a0.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
            let imv = UIImageView.init(frame: .init(x: (view.bounds.size.width - 200)/2, y: 200, width: 200, height: 200))
            view.addSubview(imv)
            imv.fg_setImageWithUrl(url, nil)
            break
        case .crop:
            let imv = UIImageView.init(frame: .init(x: (view.bounds.size.width - 300)/2, y: 200, width: 300, height: 100))
            imv.backgroundColor = hexcolor(0xf4f4f4)
            view.addSubview(imv)
            let tipLb = Maker.makeLb(text: "点击裁剪图片",
                                     aligment: .center,
                                     font: UIFont.systemFont(ofSize: 16),
                                     textColor: hexcolor(0x333333),
                                     numberOfLines: 1)
            imv.addSubview(tipLb)
            tipLb.snp.makeConstraints({ (make) in
                make.edges.equalTo(imv)
            })
            imv.addTap(handler: { (sender) in
                sender.view?.isUserInteractionEnabled = false
                let image = UIImage.init(named: "skate.jpg")!
                let cropView = ImageCropView.init(frame: UIScreen.main.bounds, image: image, mode: 3.0/1.0, hanlder: { (cropedImage) in
                    (sender.view as! UIImageView).image = cropedImage
                })
                let window = UIApplication.shared.keyWindow
                window?.addSubview(cropView)
                sender.view?.isUserInteractionEnabled = true
            })
            break
        case .make:
            let lb = Maker.makeLb(text: nil,
                                  aligment: .center,
                                  font: UIFont.systemFont(ofSize: 16),
                                  textColor: hexcolor(0x666666),
                                  numberOfLines: 0)
            view.addSubview(lb)
            lb.snp.makeConstraints({ (make) in
                make.left.equalToSuperview().offset(100)
                make.right.equalToSuperview().offset(-100)
                make.top.equalToSuperview().offset(200)
                make.height.equalTo(100)
            })
            
            let p1 = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 16),NSAttributedStringKey.foregroundColor:hexcolor(0x666666)]
            let p2 = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 20),NSAttributedStringKey.foregroundColor:UIColor.red]
            
            let attributeText = Maker.makeAttributeText(prefix: ("我是通过Maker一句话快速创建的控件，以及通过Maker快速创建的属性文本。\n欢迎使用 ",p1), suffix: ("FGToolKit",p2))
            
            lb.attributedText = attributeText
            break
        case .toolbar:
            let tf = UITextField.init(frame: .init(x: 0, y: 0, width: 300, height: 40))
            tf.borderStyle = .roundedRect
            view.addSubview(tf)
            tf.center = view.center
            //一行代码开启辅助输入视图
            tf.enableToolBar()
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
