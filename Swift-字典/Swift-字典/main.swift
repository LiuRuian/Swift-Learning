//
//  main.swift
//  Swift-字典
//
//  Created by  baohukeji-5 on 14/12/20.
//  Copyright (c) 2014年 ruian. All rights reserved.
//

import Foundation

// 1. 创建字典, Dictionary[String: String] 字典的键和值都是String类型
var appleProuduct : [String: String] = ["iPhone":"iPhone6","mac":"macBookPro"];

//[String: String] 可以省略,Swift会自动识别类型


// 2.  读取和修改字典 “Accessing and Modifying a Dictionary”
// 2.1 获取字典键值对的个数

println("appleProduct = \(appleProuduct.count)") // 打印: appleProduct = 2

// 2.2 添加新的键值项
appleProuduct["iPad"] = "iPadMini"
println("appleProduct = \(appleProuduct.count)") // 打印: appleProduct = 3

// 2.3 通过key对字典内的值进行修改
appleProuduct["iPad"] = "newPad"

// 2.4 另一种修改值的方法updateValue(forKey:),可取出修改前的value

if let oldValue = appleProuduct.updateValue("iPhone6 Plus", forKey: "iPhone")
{
    println("oldValue = \(oldValue)")    // 打印: oldValue = iPhone6
}

// 2.5 通过key取出value,使用一个没有值的键这种情 况是有可能发生的,可选类型返回这个键存在的相关值,否则就返回 nil

if let value = appleProuduct["mac"]
{
    println("value = \(value)")            // 打印: oldValue = macBookPro
    
}else
{
    println("value = nil")
}

// 2.6 可以使用下标语法来通过给某个键的对应值赋值为 nil 来从字典里移除一个键值对

appleProuduct["mac"] = nil

if let value = appleProuduct["mac"]
{
    println("value = \(value)")
    
}else
{
    println("value = nil")   // 打印: oldValue = nil
}


// 2.7 ￼removeValueForKey 方法也可以用来在字典中移除

if let removeValue = appleProuduct.removeValueForKey("iPhone")
{
    println("removeValue = \(removeValue)") // 打印: removeValue = iPhone6 Plus
}else
{
    println("removeValue = nil")
}


// 3. 字典遍历 “Iterating Over a Dictionary”
// 3.1
//￼可以使用 for-in 循环来遍历某个字典中的键值对。
//每一个字典中的数据项都由(key, value)元组形式返回,并且可以使用暂时性常量或者变量来分解这些元组

appleProuduct["iPhone"] = "iPhone7"

for (key,value) in appleProuduct
{
    println("key = \(key), value = \(value)")

}

/* 打印结果
key = iPhone, value = iPhone7
key = iPad, value = newPad
*/


// 3.2 可通过遍历key取value 或 通过value取key

// 通过key取value
for value in appleProuduct.keys
{
    println("value = \(value)")  //value = iPhone   value = iPad
   
}

// 通过value取key
for key in appleProuduct.values
{
    println("key = \(key)")  //key = iPhone7   key = newPad
    
}

// 4. 取出keys 和 values 的集合 A

let keys = Array(appleProuduct.keys)      // keys 为数组, Array可换成数组具体类型[String]
println("\(keys)")                        // 打印: [iPhone, iPad]

let values = Array(appleProuduct.values)  // values 为数组, Array可换成数组具体类型[String]
println("\(values)")                       // 打印:[iPhone7, newPad]

// 5. 创建空字典
var emptyDict = [String: Int]()  // 字典类型key为String类型 value为Int类型 中间的符号 : 不要忘记
emptyDict["num"] = 5   // 添加一组键值对
emptyDict = [:]        //  emptyDict再次为空,类型仍为[String: Int]

