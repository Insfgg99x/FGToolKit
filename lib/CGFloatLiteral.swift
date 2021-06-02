//
//  CGFloatLiteral.swift
//  ClouderWork
//
//  Created by xgf on 2020/11/23.
//  Copyright © 2020 https://www.clouderwork.com. All rights reserved.
//

import Foundation
import CoreGraphics

/*
 let value = 15.f
 value is a CGFloat now.
 */
public extension IntegerLiteralType {
    var f: CGFloat {
        return CGFloat(self)
    }
}

public extension FloatLiteralType {
    var f: CGFloat {
        return CGFloat(self)
    }
}

public extension Int64 {
    var f: CGFloat {
        return CGFloat(self)
    }
}

public extension String {
    var f: Float {
        let scanner = Scanner.init(string: self)
        var ret: Float = 0
        scanner.scanFloat(&ret)
        return ret
    }
}

public extension String {
    var ff: Float {
        let d = NSDecimalNumber.init(string: self)
        return d.floatValue
    }
}
///钱字符串（元）转长整型（分）
public extension String {
    var cent: Int64 {
        if isEmpty {
            return 0
        }
        let d1 = NSDecimalNumber.init(string: self)
        let d2 = NSDecimalNumber.init(string: "100")
        let d3 = d1.multiplying(by: d2)
        let value = d3.int64Value
        return value
    }
}
