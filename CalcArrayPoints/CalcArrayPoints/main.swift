//
//  main.swift
//  CalcArrayPoints
//
//  Created by Kiwon Jeong on 2017. 10. 11..
//  Copyright © 2017년 Kiwon Jeong. All rights reserved.
//

import Foundation


//              Basic calculator
func mathOp(_ num1: Int, _ num2: Int, _ operation: (Int, Int) -> Int) -> Int {
    return operation(num1, num2)
}

func add(_ num1: Int, _ num2: Int) -> Int {
    return num1 + num2
}

func sub(_ num1: Int, _ num2: Int) -> Int {
    return num1 - num2
}

func mul(_ num1: Int, _ num2: Int) -> Int {
    return num1 * num2
}

func div(_ num1: Int, _ num2: Int) -> Int {
    return num1 / num2
}


//              Array fun
func arrayOp(_ array1: [Int], _ operation: ([Int]) -> Int) -> Int {
    return operation(array1)
}

func add(_ a1: [Int]) -> Int {
    var result = 0
    for index in a1 {
        result += index
    }
    return result
}

func mul(_ a1: [Int]) -> Int {
    var result = 1
    for index in a1 {
        result *= index
    }
    return result
}

func count(_ a1: [Int]) -> Int {
    var result = 0
    for _ in a1 {
        result += 1
    }
    return result
}

func avg(_ a1: [Int]) -> Int {
    return add(a1) / count(a1)
}


//              Points
// checks if the tuple has only two elements of integers
func tupleCheck(_ t: Any?) -> Bool {
    return t is (Int, Int)
}

func addPoints(_ p1: (Any?), _ p2: (Any?)) -> (Int, Int) {
    if (tupleCheck(p1) && tupleCheck(p2)) {
        let np1 = p1 as! (Int, Int)
        let np2 = p2 as! (Int, Int)
        return (np1.0 + np2.0, np1.1 + np2.1)
    }
    return (0, 0)
}

func subPoints(_ p1: (Any?), _ p2: (Any?)) -> (Int, Int) {
    if (tupleCheck(p1) && tupleCheck(p2)) {
        let np1 = p1 as! (Int, Int)
        let np2 = p2 as! (Int, Int)
        return (np1.0 - np2.0, np1.1 - np2.1)
    }
    return (0, 0)
}
