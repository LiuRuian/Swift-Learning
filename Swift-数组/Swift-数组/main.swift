//
//  main.swift
//  Swift-数组
//
//  Created by  baohukeji-5 on 14/12/19.
//  Copyright (c) 2014年 ruian. All rights reserved.
//

import Foundation

// 1. 初始化数组

var appleProduct: [String] = ["iphone","ipad"] // : [String] 可以不行,Swift会自动识别类型

let indextZero = appleProduct[0]  // 数组取值
println("indextZero =  \(indextZero)") // 打印: indextZero =  iphone

// 2. 数组的个数

var arrayCount = appleProduct.count
println("appProduct count =  \(arrayCount)")  // 打印: appProduct count =  2

// 3.  数组元素的最后追加
// 3.1 方法一 .append

appleProduct.append("iMac")
println("appleProduct = \(appleProduct)")   // 打印: appleProduct = [iphone, ipad, iMac]

// 3.2 方法二 用加法运算符(+=)

appleProduct += ["macBookAir","macBookPro"]
println("appleProduct = \(appleProduct)")   // 打印: appleProduct = [iphone, ipad, iMac, macBookAir, macBookPro]

// 4. 数组元素的插入

appleProduct.insert("iPod", atIndex: 0)     // 再数组的开始插入
println("appleProduct = \(appleProduct)")   // 打印: appleProduct = [iPod, iphone, ipad, iMac, macBookAir, macBookPro]

// 5. 修改数组中的元素

appleProduct[3] = "iTouch"
println("appleProduct = \(appleProduct)")  // 打印: appleProduct = [iPod, ipad, iTouch, macBookAir, macBookPro]

// 6. 数组元素的删除

let indexOne = appleProduct.removeAtIndex(1)   //删除数组索引1位置的元素
println("appleProduct = \(appleProduct)")   // 打印: appleProduct = [iPod, ipad, iTouch, macBookAir, macBookPro]
println("indexOne = \(indexOne)")           // 打印: indexOne = iphone //indexOne接收被删除的元素

appleProduct.removeLast() // 删除数组最后一个元素
println("appleProduct = \(appleProduct)")   // 打印: appleProduct = [iPod, ipad, iTouch, macBookAir]

//appleProduct.removeAll(keepCapacity: Bool())  // 删除数组中所有元素
//println("appleProduct = \(appleProduct) count =\(appleProduct.count)")// 打印 appleProduct = [] count =0


// 7.数组的遍历
// 7.1 快速便利方法1 "for in" 同OC快速便利方法

for value in appleProduct
{
    println("value = \(value)")
}

/* 打印
value = iPod
value = ipad
value = iTouch
value = macBookAir
*/


// 7.2 方法二 带索引的便利

for (index,value) in enumerate(appleProduct)
{
    println("index = \(index) value = \(value)")
}

/*打印

index = 0 value = iPod
index = 1 value = ipad
index = 2 value = iTouch
index = 3 value = macBookAir

*/

// 8. 使用构造方法创建特定数据类型的空数组
var iphoneType = [Int]()

println("iphoneType = \(iphoneType) and count = \(iphoneType.count)")
// 打印: iphoneType = [] and count = 0

// 9. Swift中的Array类型还提供一个可以创建特定大小并且所有数据都被默认的构造方法

var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
println("threeDoubles = \(threeDoubles)") // 打印: threeDoubles = [0.0, 0.0, 0.0]

// ￼￼￼￼因为Swift能自动推断数据类型,因此我们可以不用定义数据类型

var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.2)
println("anotherThreeDoubles = \(anotherThreeDoubles)") // 打印: anotherThreeDoubles = [2.2, 2.2, 2.2]

// 可以利用加法符合  + 将两个相同类型的数组相加

var sixDoubles = threeDoubles + anotherThreeDoubles
println("sixDoubles = \(sixDoubles)") // 打印: sixDoubles = [0.0, 0.0, 0.0, 2.2, 2.2, 2.2]











