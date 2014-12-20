//
//  main.swift
//  Swift- 元组(tuples)
//
//  Created by  baohukeji-5 on 14/12/20.
//  Copyright (c) 2014年 ruian. All rights reserved.
//

import Foundation

/**元组

元组(tuples)把多个值组合成一个复合值。
元组内的值可以使任意类型,并不要求是相同类型。

*注意:元组在临时组织值的时候很有用,但是并不适合创建复杂的数据结构。如果你的数
据结构并不是临时使用,请使用类或者结构体而不是元组.

**/

/*
 (404, "Not Found") 描述HTTP请求后返回的状态码(status code)和状态信息(status message)
*/

// 1. 定义一个元组,,可以创建任意类型的元组如:(Int,Int,Int), (Int,Bool)等

let http404Error = (404,"Not Fond") // 此元组类型(Int,String)

// 2. 可以把元组的内容分解成单独的常量或者变量

let (statusCode, statusMessage) = http404Error

println("statusCode = \(statusCode)")       // 打印: statusCode = 404
println("statusMessage = \(statusMessage)") // 打印: statusMessage = Not Fond

// 3. 如果你只需要一部分元组值,分解的时候可以把要忽略的部分用下划线(_)标记:

let (onlystatusCode,_) = http404Error
println("onlystatusCode = \(onlystatusCode)") // 打印: onlystatusCode = 404

// 4. 可以通过下标来访问元组中的单个元素,下标从0开始:
println("statusCode = \(http404Error.0)")       // 打印: statusCode = 404
println("statusMessage = \(http404Error.1)")    // 打印: statusMessage = Not Fond


// 5. 定义元组并给元组内元素命名,并且可以通过元素名称获取元素的值,作为函数返回值时,元组非常有用
let http200Status = (statusCode2 : 200, statusMessage2 :"OK")

println("statusCode2 = \(http200Status.statusCode2)")       // 打印: statusCode = 200
println("statusMessage2 = \(http200Status.statusMessage2)") // 打印:statusMessage = Not Fond = OK



