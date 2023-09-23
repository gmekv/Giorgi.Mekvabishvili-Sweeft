import UIKit

//1 პირველი

func minSplit(amount: Int) -> Int {
    let coins = [50, 20, 10, 5, 1]
    var remaining = amount
    var count = 0
    
    for coin in coins {
        count += remaining / coin
        remaining %= coin
    }
    
    return count
}
print(minSplit(amount: 188))

//2 მეორე

func sumOfDigits(start: Int, end: Int) -> Int {
    var totalSum = 0
    
    for number in start...end {
        let str = String(number)
        for char in str {
            if let digit = Int(String(char)) {
                totalSum += digit
            }
        }
    }
    
    return totalSum
}


//3 მესამე

func isProperly(sequence: String) -> Bool {
    var count = 0
    
    for char in sequence {
        if char == "(" {
            count += 1
        } else if char == ")" {
            count -= 1
        }
        
        if count < 0 {
            return false
        }
    }
    
    return count == 0
}

// 4 მეოთხე

func helper(arr: [Int], i: Int, memo: inout [String], current: String = "") -> Int {
    if i >= arr.count {
        return 1
    }
    if arr[i] == 0 {
        return 0
    }
    if !memo.contains(current) {
        memo.append(current)
    }
    var sum = 0
    sum += helper(arr: arr, i: i + 1, memo: &memo, current: current + "\(i + 1)")
    sum += helper(arr: arr, i: i + 2, memo: &memo, current: current + "\(i + 2)")
    return sum
}

func bridge(arr: [Int]) -> Int {
    var memo: [String] = []
    helper(arr: arr, i: 0, memo: &memo, current: "0")
    helper(arr: arr, i: 1, memo: &memo, current: "1")
    return memo.filter { item in
        if let lastChar = item.last, let lastInt = Int(String(lastChar)) {
            return lastInt >= arr.count - 2
        }
        return false
    }.count
}

//5 მეხუთე

func zeros(N: Int) -> Int {
    var count = 0
    var n = N
    
    while n > 0 {
        count += n / 5
        n /= 5
    }
    
    return count
}

