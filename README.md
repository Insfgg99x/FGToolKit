FGToolKit

**Swift便利工具集**

- [x] Timer + Block(iOS 10以下也可以直接将timer的事件回调到代码块里)
- [x] UIControl + Action(按钮事件直接回调到代码块里)
- [x] UIImage + Arrow(带箭头的图片有左边和右边)
- [x] Date + Format(格式化的时间字符串)
- [x] UIColor + Hex(16进制颜色、16进制字符串颜色)
- [x] UIImage + Circle(高性能圆形图片)
- [x] UIView + Action(像用UIButton一样去用UIView、UILabel等，直接将点击事件回调到代码块里)
- [x] String + Chinese(汉字转拼音、判断是否有汉字、汉字的首个大写字母)

后续会持续更新...

- Timer + Block
```
timer = Timer.fg_scheduledTimer(interval: 1, repeats: true, block: { (sender) in

})
```
- UIControl + Action
```
btn.handleClick(events: .touchUpInside, click: { (sender) in

})
```
- UIImage + Arrow 带尖角的图片，效果如下:

![](/imgs/arrow.png)
```
imageView1.image = image?.arrowed(.left, resizeTo: .init(width: 200, height: 100))
view.addSubview(imageView1)
```
- Date + Format
```
lb.text = Date.init(timeIntervalSinceNow: -48 * 3600).formatedTime//星期三18:14
```
- UIColor + Hex
```
lb.textColor = hexcolor(0xa115c6)
lb.hex = 0xf4f4f4//设置16进制背景颜色的简写
lb.textColor = UIColor.init(hex: 0x333333)
```
- UIImage + Circle 高性能圆形图片
```
imageView.image = image?.cirled()
```
- UIView + Action 像用UIButton一样去用UIView、UILabel等，直接将点击事件回调到代码块里
```
lb.addTap(handler: { (sender) in

})
```
- String + Chinese 中文转拼音
```
"你好".pinyin//nihao
"你好".firstLetter//H
"abc哈1x".hasChinese//true
```
- 示例（10-20个汉字的正则）
```
let reg = "[\\u4e00-\\u9fa5]{10,20}"
let predicate = NSPredicate.init(format: "SELF MATCHES %@", reg)
let result = predicate.evaluate(with: text)
```
**需要Xcode 9、Swift 4**
