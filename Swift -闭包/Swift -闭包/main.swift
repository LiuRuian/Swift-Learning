//
//  main.swift
//  Swift -闭包
//
//  Created by  baohukeji-5 on 14/12/23.
//  Copyright (c) 2014年 ruian. All rights reserved.
//

import Foundation

/** 闭包 Closures

1. 闭包概念
闭包是功能性自包含模块,可以在代码中被传递和使用。 Swift 中的闭包与 C 和 Objective-C 中的 blocks 以及其他一些编程语言中的 lambdas 比较相似。

闭包可以捕获和存储其所在上下文中任意常量和变量的引用。
这就是所谓的闭合并包裹着这些常量和变量,俗称闭包。
Swift 会为您管理在捕获过程中涉及到的内存操作。

在函数章节中介绍的全局和嵌套函数实际上也是特殊的闭包,
闭包采取如下三种形式之一:

1. 全局函数是一个有名字但不会捕获任何值的闭包
2. 嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
3. 闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的没有名字的闭包

Swift 的闭包表达式拥有简洁的风格,并鼓励在常见场景中以实现语法优化,主要优化如下:
* 利用上下文推断参数和返回值类型
* 单表达式(single-expression)闭包可以省略 return 关键字 * 参数名称简写
* Trailing 闭包语法


2. 闭包表达式

嵌套函数是一种在较复杂函数中方便进行命名和定义自包含代码模块的方式。 
当然,有时 候撰写小巧的没有完整定义和命名的类函数结构也是很有用处的,
尤其是在处理一些函数并需要将另外一些函数作为该函数的参数时。

闭包表达式是一种利用简洁语法构建内联闭包的方式。 
闭包表达式提供了一些语法优化, 使得撰写闭包变得简单明了。
*/


// 3.sorted  排序函数

// 3.1 函数闭包排序
// 定义数组
var personName : [String]  = ["Lili","Kaiti","Anna","Bobo","Dali"]

// 定义排序函数
func sortName (s1 :String, s2 :String) ->Bool
{
    return s1 > s2
}

personName = sorted(personName,sortName)  // sorted(,) 第一个参数为数组,第二个参数为排序的方式函数
println(personName)   // 打印: [Lili, Kaiti, Dali, Bobo, Anna]   从大到小排序


// 3.2 闭包表达式语法
/* 闭包排序 */
personName = sorted(personName,{(s1: String,s2: String) -> Bool in return s1 < s2})
println(personName)   // 打印: [Anna, Bobo, Dali, Kaiti, Lili]   从小到大排序

// 3.3 根据上下文推断类型,
/* 省略参数的类型 */

personName = sorted(personName,{(s1,s2) -> Bool in return s1 > s2})   // 省略参数类型
println(personName)   // 打印: [Lili, Kaiti, Dali, Bobo, Anna]   从大到小排序

// 3.4 
/* 单行表达式闭包可以省略 return */
personName = sorted(personName,{(s1,s2) -> Bool in  s1 < s2})  // 省略return
println(personName)   // 打印: [Anna, Bobo, Dali, Kaiti, Lili]   从小到大排序

// 3.5  参数名简写
/* Swift 自动为内联函数提供了参数名称简写功能,您可以直接通过 $0,$1,$2 等名字来引用 的闭包的参数的值。*/
personName = sorted(personName,{ $0 < $1 }) // 省略参数,用$0 和$1 表示
println(personName)   // 打印: [Anna, Bobo, Dali, Kaiti, Lili]   从小到大排序

// 3.6  运算符函数
/*
Swift 的 String 类型定义
了关于大于号 (>) 的字符串实现,让其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值。
而这正好与 sort 函数的第二个参数需要的函数类型相符合。
因此,可以简单地传递一个大于号,Swift 可以自动推断出您想使用大于号的字符串函数实现:
*/

personName = sorted(personName, >) // 省略参数,用$0 和$1 表示
println(personName)   // 打印: [Lili, Kaiti, Dali, Bobo, Anna]   从大到小排序



// 4. Trailing(挂尾) 闭包
/*
如果您需要将一个很长的闭包表达式作为最后一个参数传递给函数,可以使用 trailing 闭包
来增强函数的可读性
*/


// 4.1 排序例子,转换为 Trailing(挂尾) 闭包
personName = sorted(personName){ $0 < $1 } // 将闭包{}的内容写在sorted外部
println(personName)   // 打印: [Anna, Bobo, Dali, Kaiti, Lili]   从小到大排序

/*

当闭包非常长以至于不能在一行中进行书写时,Trailing 闭包就变得非常有用
注意:如果函数只需要闭包表达式一个参数,当您使用 trailing 闭包时,您甚至可以把
() 省略掉。
*/


// 4.2  Trailing(挂尾)闭包 实例2
// 将数字用中文数输出
/*
当闭包非常长以至于不能在一行中进行书写时,Trailing 闭包就变得非常有用。
举例来说,Swift 的 Array 类型有一个 map 方法,其获取一个闭包表达式作为其唯一参数。 
数组中的每一个元素调用一次该闭包函数,并返回该元素所映射的值(也可以是不同类型的值)。
具体的映射方式和返回值类型由闭包来指定。
当提供供给数组闭包函数后,map 方法将返回一个新的数组,数组中包含了与原数组一一对
应的映射后的值
*/

var num = [10,21,43,56,78,99]

var dict = [
    
    0:"零",
    1:"一",
    2:"二",
    3:"三",
    4:"四",
    5:"五",
    6:"六",
    7:"七",
    8:"八",
    9:"九"
]

let strings = num.map{
        
        (var number) ->String in
        
        var output = ""
        while number > 0 {
        
        output = dict[number % 10]! + output
        number /= 10
        }
        
        return output
}

println(strings)  // 打印: [一零, 二一, 四三, 五六, 七八, 九九]

/*
注意:
字典 下标后跟着一个叹号 (!),因为字典下标返回一个可选值 (optional value),
表明即使该 key 不存在也不会查找失败。 
在上例中,它保证了 number % 10 可以总是作为一个 digitNames 字典的有效下标 key。 
因此叹号可以用于强展开 (force-unwrap) 存储在可选下标项中的 String 类型值。
*/

// 5. 捕获 (Caputure)
/*闭包可以在其定义的上下文中捕获常量或变量。 
即使定义这些常量和变量的原作用域已经 不存在,闭包仍然可以在闭包函数体内引用和修改这些值。
Swift 最简单的闭包形式是嵌套函数,也就是定义在其他函数体内的函数。 
嵌套函数可以捕 获其外部函数所有的参数以及定义的常量和变量。
*/

func repeatAdd(#num1 :Int) ->() ->Int
{
    var totalNum = 0
    func add() ->Int
    {
        totalNum += num1
        return totalNum
    }
    return add
}

let total = repeatAdd(num1 : 5)

println(total())  // 打印: 5
println(total())  // 打印: 10
println(total())  // 打印: 15
println(total())  // 打印: 20

  
/*
注意:
Swift 会决定捕获引用还是拷贝值。 
您不需要标注 num1 或者 totalNum 来声明 在嵌入的 add 函数中的使用方式。
Swift 同时也处理 runingTotal 变量的内存 管理操作,如果不再被 incrementor 函数使用,则会被清除。
*/

let total2 = repeatAdd(num1 : 2)

println(total2())  // 打印: 2
println(total2())  // 打印: 4
println(total2())  // 打印: 6
println(total2())  // 打印: 8

/* 
注意:
如果您闭包分配给一个类实例的属性,并且该闭包通过指向该实例或其成员来捕获了 该实例,
您将创建一个在闭包和实例间的强引用环。
Swift 使用捕获列表来打破这种强 引用环
*/



// 6. 闭包是引用类型

/*上面的例子中,total1 和 total2 是常量,但是这些常量指向的闭包
仍然可以增加其捕获的变量值。 
这是因为函数和闭包都是引用类型。

这也意味着如果您将闭包赋值给了两个不同的常量/变量,两个值都会指向同一个闭包:
*/

let total3 = total // 将total 赋值给 total3, 引用类型 total3 的指针指向 total
println(total3())  // 打印: 25  total 再次相加
