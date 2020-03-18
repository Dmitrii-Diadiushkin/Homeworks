//
//  main.swift
//  1|_DiadiushkinDmitrii
//
//  Created by Dmitriy Dyadyushkin on 17.03.2020.
//  Copyright © 2020 Dmitriy Dyadyushkin. All rights reserved.
//

import Foundation

func Enter_Int(coef:String) -> Double { //Ввод значений пользователем в консоли
    var Coef_Int_Str:String
    var Coef_Int:Double?
    print(coef)
    while(true){
        Coef_Int_Str = readLine()!
        Coef_Int = Double(Coef_Int_Str) ?? nil
        if Coef_Int != nil && Coef_Int != 0{
            break
        }else{
            print("Пожалуйста, введите число не равное 0:")
        }
    }
    return Coef_Int!
}

func equation() { //Решение первого задания
    print("Решим квадратное уравнение вида ax2+bx+c=0")
    print("A, B, C не равны 0")
    let A = Enter_Int(coef: "Введите значение переменной A:")
    let B = Enter_Int(coef: "Введите значение переменной B:")
    let C = Enter_Int(coef: "Введите значение переменной C:")
    print("")
    let D:Double = B*B - 4*A*C
    
    if D > 0 {
        let x1 = (-B + sqrt(D))/2*A
        let x2 = (-B - sqrt(D))/2*A
        print("Корни уравнения: \(x1) и \(x2)")
    } else if D == 0{
        let x = (-B)/2*A
        print("Корень уравнения: \(x)")
    }else if D < 0{
        print("Корней нет.")
    }
    print("")
}

func triangle() { //Решение второго задания
    print("Найдем площадь, периметр, гипотенузу прямоугольного треугольника.")
    
    let A = abs(Enter_Int(coef: "Введите длину первого катета"))
    let B = abs(Enter_Int(coef: "Введите длину второго катета"))
    
    let hypo = sqrt((A*A)+(B*B))
    let sqr = A*B/2
    let perim = A + B + hypo
    print("")
    print("Площадь равна \(sqr)")
    print("Периметр равен \(perim)")
    print("Гипотенуза равна \(hypo)")
    print("")
}

func bank() { //Решение третьего задания
    print("Рассчитаем сумму вклада через 5 лет")
    
    let Main_sum = abs(Enter_Int(coef: "Введите сумму, которую Вы положили в банк"))
    let Perc = abs(Enter_Int(coef: "Введите годовой процент"))
    
    let Result_Simple = Main_sum * ((Perc * 5 / 100 + 1))
    
    var Result_Cap = Main_sum
    for _ in 1...5 {
        Result_Cap = Result_Cap * (Perc / 100 + 1)
    }
    Result_Cap = round(Result_Cap * 100) / 100
    print("")
    print("Через 5 лет на счете будет \(Result_Simple) без капитализации процентов")
    print("Через 5 лет на счете будет \(Result_Cap) с капитализацией процентов")
    print("")
}

equation() //запуск первого задания
triangle() //запуск второго задания
bank() //запуск третьего задания
print("That's all, folks!")
