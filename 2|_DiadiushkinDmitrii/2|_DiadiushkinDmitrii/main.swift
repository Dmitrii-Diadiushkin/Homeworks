//
//  main.swift
//  2|_DiadiushkinDmitrii
//
//  Created by Dmitriy Dyadyushkin on 20.03.2020.
//  Copyright © 2020 Dmitriy Dyadyushkin. All rights reserved.
//

import Foundation

func Even_number(Number Num:Int) -> Bool{ //Задание 1
    if (Num % 2) == 0{
        return true
    }else {
        return false
    }
}

func Three_number(Number Num:Int) -> Bool{ //Задание 2
    if (Num % 3) == 0{
        return true
    }else {
        return false
    }
}

func Fibo_Array(Lenght: Int, Internal_Array:[Double]) -> [Double]{ //Задание 5
    var Arr = Internal_Array
    for i in (2...Lenght){
        Arr.append(Arr[i - 2] + Arr[i - 1])
    }
    return Arr
}

var Array_100: [Int] = []

for i in 0...99{ //Задание 3
    Array_100.append(i + 1)
}

for (_, value) in Array_100.enumerated(){ //Задание 4
    if Even_number(Number: value){
        Array_100.remove(at: Array_100.firstIndex(of: value)!)
    }else if Three_number(Number: value){
        Array_100.remove(at: Array_100.firstIndex(of: value)!)
    }
}
print(Array_100)

var Fibo_Ar: [Double] = Fibo_Array(Lenght: 99, Internal_Array: [0,1]) //Задание 5
print(Fibo_Ar)


var Simple_Array:[Int] = [2,3] //Задание 6
let Simple_Array_Lenght:Int = 100
var Num:Int = 4

while Simple_Array.count < Simple_Array_Lenght{
    var simple_check = true
    for j in 2...(Num / 2) {
        if Num % j == 0 {
            simple_check = false
        }
    }
    if simple_check == true{
        Simple_Array.append(Num)
    }
    Num = Num + 1
}

print(Simple_Array)
