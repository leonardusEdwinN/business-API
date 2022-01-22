import UIKit

var greeting = "Hello, playground"

func minOperations(providers: [String]) -> Int {
    var differentProvidersSet = Set<String>()
    
    for provider in providers{
        differentProvidersSet.insert(provider)
    }
    print("asd \(differentProvidersSet)")
    // for provider in providers{
    //     for index in
    // }
    
    
    // Solution 1
    for (index,provider) in providers.enumerated(){
        for indexProvider in index + 1..<providers.count{
            if(providers[indexProvider] == provider){
                return indexProvider
                break;
            }
        }
    }
    
    return 0
}


minOperations(providers: ["airasia","garuda","airasia"])



import Foundation



/**
    Make the following line of code below work by providing the
    implementation for the `walk` function:

        let array : [Any] = [1, 2, [3, 4], 5]
        array.walk { (value, index) in
            print("\(index) \(value)")
        }
 
    Write your solution below this comment.
**/
extension Array {
    func walk(_ : (_ index : Int, _ value :Int) -> ()){
        print("MASUK")
        // if(index == )
    }
}




let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let input = readLine() else { fatalError("Bad input") }
let tokenized = input.split(separator: " ")

var array : [Any] = []
var indexKeys : [Int] = []
var subarrays : [Int:[Any]] = [:]
var depth = 0


for i in 0..<tokenized.count {
    let token = String(tokenized[i])
    print("TOKEN \(token)")
    if token == "[" {
        subarrays[i] = []
        indexKeys.append(i)
    }
    else if token == "]" {
        let expiringKey = indexKeys.popLast()
        print("EXPIRING KEY : \(expiringKey ?? 0)")
        if let subarray = subarrays[expiringKey!] {
            if indexKeys.isEmpty {
                array.append(subarray)
            } else {
                let key = indexKeys.last!
                subarrays[key]?.append(subarray)
            }
        }
    }
    else {
        if indexKeys.isEmpty {
            array.append(token)
        } else {
            let key = indexKeys.last!
            subarrays[key]?.append(token)
        }
    }
}

print("ARRAY : \(array)")


var res : [String] = []
array.walk { (value, index) in
print("\(index) : \(value)")
    res.append("\(index) \(value)")
}

fileHandle.write(res.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)


import Foundation


/*
 * Complete the 'minOperations' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts STRING_ARRAY providers as parameter.
 */

func minOperations(providers: [String]) -> Int {
    // var differentProvidersSet = Set<String>()
    // var dictProviders = [String:Int]()
    
    // print(providers)
    // for provider in providers{ // get different airlane
    //     differentProvidersSet.insert(provider)
    // }
    // print("SET : \(differentProvidersSet)")
    
    
    // for diffProvider in differentProvidersSet{
    //     for (index,provider) in providers.enumerated(){
    //         print("\(diffProvider) :: \(provider)")
    //         if(diffProvider == provider){
    //             if(dictProviders.isEmpty){
    //                 dictProviders[provider] = 1
    //             }else {
    //                 if (dictProviders.keys.contains(provider)){
    //                     dictProviders[provider]! += 1
    //                     if(dictProviders[provider]! == 2){
    //                         return index
    //                     }
    //                 }else{
    //                     dictProviders[provider] = 1
    //                 }
    //             }
    //         }
    //     }
    // }
    
    // print("DICT : \(dictProviders)")
    
    // Solution 1
    
    for (index,provider) in providers.enumerated(){
        for indexProvider in index + 1..<providers.count{
            if(providers[indexProvider] == provider){
                return indexProvider
            }
        }
    }
    
    return 0
}
let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let providersCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var providers = [String]()

for _ in 1...providersCount {
    guard let providersItem = readLine() else { fatalError("Bad input") }

    providers.append(providersItem)
}

guard providers.count == providersCount else { fatalError("Bad input") }

let result = minOperations(providers: providers)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
