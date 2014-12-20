//
//  main.swift
//  Swift-字符串和字符
//
//  Created by  baohukeji-5 on 14/12/20.
//  Copyright (c) 2014年 ruian. All rights reserved.
//

import Foundation

// 1. 创建字符串
let appleProduct = "iPhone"

// 2. 初始化空字符
// 2.1 方法1
let emptyString = ""

// 2.2 方法2 String()构造方法
let anotherEmptyString = String()  // 这两个字符串都为空,并且两者等价

// 3. 判断字符串是否为空
if emptyString.isEmpty
{
    println("emptyString is empty") // 打印: emptyString is empty
}

// 4. 字符串的改变,声明为var才能改变,声明let不能改变,改变会编译错误

var iPhone = "iPhone6 "
iPhone += "Plus"
println("\(iPhone)")   // 打印: iPhone6 Plus

// 5. 字符串插入
let num1 = 4
let total = "\(num1) * 2.5 = \(Double(num1) * 2.5)" // swift中只用相同类型的数据才能进行运算
println("\(total)") // 打印:4 * 2.5 = 10.0

// 6. 字符串长度,countElements()函数

let count = countElements(iPhone)
println("count = \(count)")       // 打印: count = 12

// 7. 字符串

let anotheriPhone = "iPhone6 Plus"

if iPhone == anotheriPhone
{
    println("两个字符串相等")   // 打印:两个字符串相等
}

// 8. 字符串前缀和后缀 hasPrefix/hasSuffix
// 两个方法均需要以字符串作为参数传入并返回Boolean值。两个方法均执行基本字符串和前缀/后缀字符串之间逐个字符的比较操作。

let iPhoneProuducts = ["iphone4",
                       "iphone5",
                       "iphone6",
                       "ipad4",
                       "ipadmini4",
                        "mac4"
]

var iPreCount: Int = 0
var fourSuffCount: Int = 0

for scene in iPhoneProuducts
{
    // 判断数组元素首字母是否为 i
    if scene.hasPrefix("i")
    {
        iPreCount++
    }
    // 判断数组元素首字母是否为 4
    if scene.hasSuffix("4")
    {
        fourSuffCount++
    }
}

println("iPreCount = \(iPreCount)")         // 打印: iPreCount = 5
println("fourSuffCount = \(fourSuffCount)") // 打印: fourSuffCount = 4


// 9. 字符串大小写字母

let 小写 = iPhone.lowercaseString
let 大写 = iPhone.uppercaseString

println("\(小写)")  // 打印 : iphone6 plus
println("\(大写)")  // 打印 : IPHONE6 PLUS

// 10.使用字符(Characters)

for c in iPhone
{
    println(c)
}

/* 打印
i
P
h
o
n
e
6
*/


