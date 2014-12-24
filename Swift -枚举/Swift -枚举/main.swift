//
//  main.swift
//  Swift -枚举
//
//  Created by  baohukeji-5 on 14/12/24.
//  Copyright (c) 2014年 ruian. All rights reserved.
//

import Foundation

// 1. 枚举定义, case 关键词表明新的一行成员值将被定义
// 枚举语法(Enumeration Syntax)

enum CompassPoint{
    case North
    case South
    case East
    case West
}
// 枚举的使用
var direction = CompassPoint.North
// 重新赋值
direction = .South


// 2.多个成员值可以出现在同一行上,用逗号隔开
// 匹配枚举值和 Switch 语句
enum Product{
    case iPhone,iPad,mac,iPod,iTouch
}

var name = Product.iPhone
name = .iTouch

switch name {
    
case .iPhone:
    println("iphone")
case .iPad:
    println("iPad")   // 打印: iPad
case .mac:
    println("mac")
case .iPod:
    println("iPod")
default:
    println("没有值")
    
}


// 3.关联值(Associated Values)
enum Barcode
{
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}

var code = Barcode.UPCA(5,6666, 8888, 7)
code = .QRCode("二维码")

switch code{
    case .UPCA(let num1, let num2, let num3, let num4):
        println("code = \(num1),\(num2),\(num3),\(num4)")
        
    case .QRCode(let string):
        println("code = \(string)")  // 打印: 二维码

}

/*￼
如果一个枚举成员的所有关联值被提取为常量,或者它们全部被提取为变量,
为了简洁,你 可以只放置一个 var 或者 let 标注在成员名称前￼￼￼
*/
code = .UPCA(3,4444,5555,66)

switch code{
case let .UPCA(num1,num2,num3,num4):
    println("code = \(num1),\(num2),\(num3),\(num4)")  // 打印: code = 3,4444,5555,66
    
case let  .QRCode(string):
    println("code = \(string)")
    
}

// 4. 原始值(Raw Values)
//作为关联值的替代,枚举成员可以被默认值(称为原始值)预先填充,
// 其中这些原始值具有相同的类型。

 enum Planet: Int {
   case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn,Uranus, Neptune
}

// 当整型值被用于原始值,如果其他枚举成员没有值时,它们会自动递增。
// 自动递增意味着 Planet.Venus 的原始值是 2,依次类推。

// 使用枚举成员的 rawValue 方法可以访问该枚举成员的原始值:

let earthsOrder = Planet.Neptune.rawValue
println(earthsOrder)   // 打印: 8


//￼使用枚举的 rawValue 方法来试图找到具有特定原始值的枚举成员。

let value = Planet(rawValue: 3)
println(value)   // 打印: Optional((Enum Value)) 返回可选值,可能为空

/*并非所有可能的 Int 值都可以找到一个匹配的行星。
正因为如此,rawValue: 方法可以返回一个可选的枚举成员。
在上面的例子中,possiblePlanet 是 Planet?类型,或“可选的
Planet”。*/


if let value2 = Planet(rawValue: 9){
    
    switch value2 {
    case .Venus:
        println("Venus")
    default :
        println("没有匹配")
    
    
    }
}else{
    
    println("没有值")  // 打印: 没有值
}









