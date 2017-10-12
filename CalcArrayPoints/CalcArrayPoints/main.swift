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


//              Points (tuple)
// checks if the tuple has only two elements of integers
func tupleCheck(_ t: Any) -> Bool {
    return t is (Int, Int)
}

func addPoints(_ p1: (Any), _ p2: (Any)) -> (Int, Int) {
    if (tupleCheck(p1) && tupleCheck(p2)) {
        let np1 = p1 as! (Int, Int)
        let np2 = p2 as! (Int, Int)
        return (np1.0 + np2.0, np1.1 + np2.1)
    }
    return (0, 0)
}

func subPoints(_ p1: (Any), _ p2: (Any)) -> (Int, Int) {
    if (tupleCheck(p1) && tupleCheck(p2)) {
        let np1 = p1 as! (Int, Int)
        let np2 = p2 as! (Int, Int)
        return (np1.0 - np2.0, np1.1 - np2.1)
    }
    return (0, 0)
}

//              Points (dictionary)
// checks the type of dictionary
// return 0 if the number is integer, 1 if double, and -1 otherwise
func dictCheck(_ t: [String: Any]) -> Int {
    let intTest = t is [String: Int]
    let doubleTest = t is [String: Double]
    if (intTest) {
        return 0
    } else if (doubleTest) {
        return 1
    } else {
        return -1
    }
}

// checks if dictionaries have both "x" and "y"
func validPtTest(_ d1: [String: Any]?, _ d2: [String: Any]?) -> Bool{
    if (d1 == nil || d2 == nil) {
        if (d1!["x"] == nil || d1!["y"] == nil || d2!["x"] == nil || d2!["y"] == nil) {
            return false
        }
    }
    return true
}

func addDPoints(_ d1: [String: Any], _ d2: [String: Any]) -> [String: Any] {
    let cases = dictCheck(d1)
    if (dictCheck(d1) == dictCheck(d2) && validPtTest(d1, d2)) {
        switch cases {
        case 0:
            var result: [String: Int] = [:]
            let nd1 = d1 as! [String: Int]
            let nd2 = d2 as! [String: Int]
            result["x"] = nd1["x"]! + nd2["x"]!
            result["y"] = nd1["y"]! + nd2["y"]!
            return result
        case 1:
            var result: [String: Double] = [:]
            let nd1 = d1 as! [String: Double]
            let nd2 = d2 as! [String: Double]
            result["x"] = nd1["x"]! + nd2["x"]!
            result["y"] = nd1["y"]! + nd2["y"]!
            return result
        default:
            return [:]
        }
    }
    return [:]
}

func subDPoints(_ d1: [String: Any], _ d2: [String: Any]) -> [String: Any] {
    let cases = dictCheck(d1)
    if (dictCheck(d1) == dictCheck(d2) && validPtTest(d1, d2)) {
        switch cases {
        case 0:
            var result: [String: Int] = [:]
            let nd1 = d1 as! [String: Int]
            let nd2 = d2 as! [String: Int]
            result["x"] = nd1["x"]! - nd2["x"]!
            result["y"] = nd1["y"]! - nd2["y"]!
            return result
        case 1:
            var result: [String: Double] = [:]
            let nd1 = d1 as! [String: Double]
            let nd2 = d2 as! [String: Double]
            result["x"] = nd1["x"]! - nd2["x"]!
            result["y"] = nd1["y"]! - nd2["y"]!
            return result
        default:
            return [:]
        }
    }
    return [:]
}
