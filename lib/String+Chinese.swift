//
//  String+Chinese.swift
//  FGToolKit
//
//  Created by xgf on 2018/1/26.
//  Copyright © 2018年 xgf. All rights reserved.
//

import Foundation

extension String {
    var pinyin:String? {
        get {
            let tmp = NSMutableString.init(string: self) as CFMutableString
            CFStringTransform(tmp, nil, kCFStringTransformMandarinLatin, false)
            CFStringTransform(tmp, nil, kCFStringTransformStripDiacritics, false)
            let ret = (tmp as String).lowercased()
            return ret
        }
    }
    var hasChinese:Bool {
        get {
            for ch in unicodeScalars {
                if (0x4e00 < ch.value  && ch.value < 0x9fff) {
                    return true
                }
            }
            return false
        }
    }
    var firstLetter:String? {
        get {
            guard let py = pinyin else {
                return nil
            }
            let index = py.index(py.startIndex, offsetBy: 1)
            return String(py[..<index]).uppercased()
        }
    }
}
