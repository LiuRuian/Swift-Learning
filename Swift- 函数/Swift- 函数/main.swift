//
//  main.swift
//  Swift- 函数
//
//  Created by  baohukeji-5 on 14/12/21.
//  Copyright (c) 2014年 ruian. All rights reserved.
//

import Foundation

// 1. 定义函数
func sayHello(personName:String) ->String
{
    let greeting = "Hello, \(personName)"
    return greeting
    // 简化函数可以合并,之间reture 返回结果
   // return "Hello, \(personName)"
}

/** 函数说明
func               是函数的声明标记
sayHello(){}       函数的主体
personName:String  形参且为String类型
->String           函数带返回值且返回值为String类型
*/

// 2.调用函数
let greet = sayHello("apple")
println(greet)    // 打印 : Hello, apple


// 3.函数的形参和返回值

// 3.1 函数可以有多个形参,再函数的括号内用" , "隔开
func numrang(start :Int,end :Int) ->Int
{
    return end - start
}

println(numrang(1,10)) // 打印: 9


//3.2 无形参函数
func sayHello() ->String{
return "hello,world"
}

println(sayHello())   // 打印:  hello,world

//3.3 无返回值参数

func sayGoodbay(personName: String)
{
    println("Goodbay \(personName)")
}

sayGoodbay("apple")  // 打印: Goodbay apple
/*严示:严格地说,sayGoodbye 函数确实还返回一个值,即使没有定义返回值。没有 定义返回类型的函数返回了一个 Void 类型的特殊值。这仅是一个空元组,这里边没有元素,可以被写成()。*/

// 当一个函数调用时可以忽略返回值不计
func printAndCount(printString: String) -> Int
{
    println(printString)
    return countElements(printString)
}

func printWithCount(printString: String)
{
    printAndCount(printString)
}

printAndCount("apple")    // 打印: apple  忽略了返回值
printWithCount("apple")   // 打印: apple  没有返回值

// 返回值可以忽略,当定义了有返回值的函数,函数内部必须有返回值,不然会报错

// 3.4 多返回值函数
// 同时返回数组内最大值和最小值

func returnMaxAndMin(array: [Int])-> (maxValue: Int,minValue: Int)
{
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array
    {
        if currentMax < value
        {
            currentMax = value
        }
        if currentMin > value
        {
            currentMin = value
        }
    }
    return (currentMax,currentMin)
}

let maxAndmin = returnMaxAndMin([48,-30,22,99,12])

println("maxvalue = \(maxAndmin.maxValue)  minValue = \(maxAndmin.minValue)")

// 打印: maxvalue = 99  minValue = -30

// 3.5 可选的元组返回类型
// 如果数组为空将返回错误,因此返回的元组应该为可选类型,可以为nil

func minAndmax(array: [Int])->(minValue:Int,maxValue:Int)?
{
    if array.isEmpty {return nil};

    var currenMin = array[0];
    var currenMax = array[0];
    
    for value in array
    {
        if value > currenMax
        {
            currenMax = value
        }
        if value < currenMin
        {
            currenMin = value
        }
    }
    return (currenMin,currenMax)
}

// 调用函数

let tuple = minAndmax([]) // 传入空数组
println(tuple)            // 打印:nil  因为返回的类型为可选类型可以为nil


// 4. 函数形参名称

/** 外部形参名
函数的形参只能内部使用,如果函数外部想使用函数内部的形参,需要给函数形参定义一个外部形参名称
*/

func someFunction (externalParameterName localParametername:Int )
{
}
/*
externalParameterName 外部形参名称
提示:如果您为形参提供一个外部形参名称,那么外部形参名必须在调用时使用。
*/

// 4.1  定义带外部形参的函数

func externalParameterFunc(firstNum num1:Int, secondNum num2:Int, jionCharacter c:String) ->String
{
    return ("\(num1) \(c) \(num2)")

}

// 使用带外部形参的函数, **带外部参数的函数,调用时必须带外部参数
let result = externalParameterFunc(firstNum: 2, secondNum: 3, jionCharacter: "+")
println(result) // 打印: 2 + 3

/*注意:
在别人第一次阅读你的代码不知道你函数形参目的时候,就要考虑到使用外
部形参名称了。在调用函数的时候,如果每个形参的目的清晰明确的话,那你就无需
指定外部形参名。
*/

// 4.2 外部参数的速记  速记标记  #
// 如果再函数的内部的形参前加 # ,内部的形参名称可当外部形参使用

// 创建速记外部参数
func externalParamer (#num1:Int,#num2: Int,#joinCharacter: String)->String
{
    return ("\(num1) \(joinCharacter) \(num2)")
}

let resultString = externalParamer(num1: 3, num2: 2, joinCharacter: "-")  // 速记形参
println(resultString)   // 打印:  3 - 2


// 4.3 默认形参值,
// 设置 joinCharacter 默认为空字符
func join(#num1:Int, #num2:Int,join joinCharacter: String = " ")->String
{
    return ("\(num1)\(joinCharacter)\(num2)")
}

// 传入join
let joinResult = join(num1: 1, num2: 1,join:"=")
println(joinResult)      // 打印: 1=1

// 调用函数,join不传入,将以默认为" "
let joinResult2 = join(num1: 1, num2: 1)
println(joinResult2)      // 打印: 1 1   用空字符填充 join的位置

// 4.4 有默认值的外部形参名
//当定义了默认的字符,外部可以只用使用函数的参数,相等于加了 #

func joinFunc(num1: Int,num2: Int,join: String = "+")->String
{
    return ("\(num1)\(join)\(num2)")

}

// 当不传入join 值时
let joinresult3 = joinFunc(5,6)
println(joinresult3)      // 打印: 5+6

// 当传入join 值时
let joinresult4 = joinFunc(5, 6, join: "-")
println(joinresult4)      // 打印: 5-6


// 5. 可变形参

/*
一个可变形参可接受零个或多个指定类型的值。
当函数被调用时,你可以使用可变形参来 指定--形参可以用来传递任意数量的输入值。
可通过在形参的类型名后边插入三个点符号(...)来编写可变形参。
传递至可变形参的值在函数主体内是以适当类型的数组存在的.

例如,一个可变参数的名称
为 numbers 和类型为 Double...在函数体内就作为名为 numbers 类型为 Double[]的常量数组。
*/

func canchange(numbers: Double...) ->Double
{
    var total : Double = 0
    for number in numbers{
      total += number
    }
    
    return total / (Double)(numbers.count)
}

// 调用可变参数的名称
let resultDouble = canchange(1,2,3,4,5)
println(resultDouble)   // 打印: 3.0

let resultDouble2 = canchange(2.5,3.6,4.7,5.8)
println(resultDouble2)  // 打印: 4.15


// 6.常量形参和变量形参
/*
函数的形参默认是常量。试图在函数体内改变函数形参的值会引发一个编译时错误。这意
味着你不能错误地改变形参的值。

可在形参前定义为var 形参可变, 改变形参的值,就无需再函数内部重新定义可变的值
*/

func addCharacter(var string: String, count: Int, pad: Character) -> String
{
    let amount = count - countElements(string)
    
    if amount < 1 {return string}

    for _ in 1...amount
    {
    string = String(pad) + string
    
    }
    
    return string
}

let addString = addCharacter("swift", 10, "*")

println(addString)   // 打印:  *****swift

/*
注意:你对变量形参所做的改变不会比调用函数更持久,并且在函数体外是不可见
的。变量形参仅存在于函数调用的声明周期中。
*/

// 7. In-Out 形参

/*
变量形参只能在函数本身内改变。
如果你想让函数改变形参值,并想要在函数调用结束后保持形参值的改变,那你可以把形参定义为 in-out 形参。
你不能传递一个常量或者字面量作为实参,因为常量和字面量不能被修改。当你把变量作为实参传递给 in out 形参时,需要在直 接在变量前添加 & 符号,以表明它可以被函数修改。
提示:in-out 参数不能有默认值,可变参数的参数也不能被标记为 inout。如果您标记 参数为 inout,它不能同时被标记为 var 或 let。
*/

func swapTwoInts (inout a: Int,inout b: Int)
{
    let temp = a
    a = b
    b = temp
}


var someInt = 3
var anotherInt = 5

// 需要出入两个参数的地址
swapTwoInts(&someInt, &anotherInt)

println(someInt)       // 打印: 5
println(anotherInt)    // 打印: 3
/*
In-out 形参不同于从函数返回一个值。上边 swapTwoInts 例子没有定义返回类 型或者返回值,
但它仍然会修改 someInt 和 anotherInt 的值。对函数来说,In-out 形 参是一个影响函数主体范围外的可选方式。
*/

// 8. 函数类型
// 8.1 使用函数类型

// 函数类型 (Int,Int)->Int
func 加(a: Int,b: Int)->Int
{
    return a+b
}

func 乘(a: Int,b: Int)->Int
{
    return a*b
}

var 临时函数: (Int,Int)->Int = 加    // : (Int,Int)->Int  部分可以省略,Swift会
println(临时函数(2,3))  // 打印: 5

临时函数 = 乘
println(临时函数(2,3))  // 打印: 6


// 8.2 作为形参类型的函数类型

func printMathResult(math:(Int,Int) -> Int,a :Int,b :Int)
{
    println("result: \(math(a,b))")
}
// 调用
printMathResult(加, 3, 5)  // 打印: 8

// 8.3 作为返回类型的函数类型  “Function Types as Return Types”
/*
可以将一个函数类型作为另一个函数的返回类型。
你可以在返回函数的返回箭头(->) 后立即编写一个完整的函数类型来实现。
*/


func stepForward(input: Int) ->Int
{
    return input + 1;

}

func stepBackward(input: Int) ->Int
{
    return input - 1;
}


func chooseStep(ward: Bool)-> (Int)->Int
{
    return ward ?stepBackward : stepForward
}

var currentValue = 5
let moveNear = chooseStep(currentValue > 0)  // 返回函数为真的函数

while currentValue != 0
{
    println(currentValue)
    currentValue = moveNear(currentValue)
}
/*
5
4
3
2
1
*/

// 9.嵌套函数 Nested Functions
// 在其他函数体中定义函数,被称为嵌套函数。

func chooseStep2(ward: Bool)-> (Int)->Int
{
    func stepForward(input: Int) ->Int
    {
        return input + 1;
        
    }
    
    func stepBackward(input: Int) ->Int
    {
        return input - 1;
    }
    
    return ward ?stepBackward : stepForward
}

var currentValue2 = -5
let moveNear2 = chooseStep2(currentValue > 0)  // 返回函数为真的函数

while currentValue2 != 0
{
    println(currentValue2)
    currentValue2 = moveNear2(currentValue2)
}
/*
-5
-4
-3
-2
-1
*/
