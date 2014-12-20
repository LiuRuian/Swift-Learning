//
//  main.swift
//  Swift-可选 optionals
//
//  Created by  baohukeji-5 on 14/12/20.
//  Copyright (c) 2014年 ruian. All rights reserved.
//

import Foundation

/**

使用可选(optionals)来处理可能缺失的情况
可选表示:

有值,等于x
没有值   nil

Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中,nil 是一个指向 不存在对象的指针。在 Swift 中,nil 不是指针——它是一个确定的值,用来表示值缺失。
任何类型的可选都可以被设置为 nil,不只是对象类型。

**/

// 1. 可选类型在定义的名称后面加 ?
let num = "123"
let num2 :Int? = num.toInt()  // toInt() 转换整数的方法
println("num2 = \(num2)")     // 打印: num2 = Optional(123)  // 转换成功
println("num2 = \(num2!)")    // 打印: num2 = 123  可选类型使用许带 !


let num3 = "GO"
let num4 :Int? = num3.toInt()   // 不加 ? 会编译失败
println("num4 = \(num4)")     // 打印: num4 = nil   //转换失败,字符串不能转换为整型

if  num4 != nil{
    println("转换成功")
}else
{
    println("转换失败")   // 打印: 转换失败
}

// 2. 可选绑定(optional binding
/*
使用可选绑定(optional binding)来判断可选是否包含值,如果包含就把值赋给一个临时
常量或者变量。可选绑定可以用在 if 和 while 语句中来对可选的值进行判断并把值赋给一 个常量或者变量。
*/


if let bindingNum = num2
{
    println("绑定存在")  // 打印: 绑定存在

}else
{
    println("绑定不存在")
}

// 也可以

if let bindingNum2 = num3.toInt()
{
    println("绑定存在")
}else
{
    println("绑定不存在")  // 打印: 绑定不存在
}



