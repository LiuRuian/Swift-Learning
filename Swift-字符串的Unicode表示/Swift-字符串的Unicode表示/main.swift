//
//  main.swift
//  Swift-字符串的Unicode表示
//
//  Created by  baohukeji-5 on 14/12/20.
//  Copyright (c) 2014年 ruian. All rights reserved.
//

import Foundation

/* 字符串字面量可以包含以下特殊字符:

   1.转义特殊字符 
   \0 (空字符)、
   \\(反斜线)、
   \t (水平制表符)、
   \n (换行符)、
   \r (回车符)、
   \" (双 引号)、
   \' (单引号)。
*/

//  1. 转义字符
let iPhone = "\"iPhone6 Plus\""
println("\(iPhone)")  //打印: "iPhone6 Plus"

// 2. dollarSign、blackHeart 和sparklingHeart 常量演示了三种不同格式的 Unicode 标量:

let dollarSign = "\u{24}"
println("\(dollarSign)")    // 打印: $ , Unicode scalar U+0024

let blackHeart = "\u{2665}"
println("\(blackHeart)")    // 打印: ♥ , Unicode scalar U+2665

let sparklingHeart = "\u{1F496}" // 打印: 💖 , Unicode scalar U+F496
println("\(sparklingHeart)")






















