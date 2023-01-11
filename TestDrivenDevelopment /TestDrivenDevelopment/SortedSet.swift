//
//  SortedSet.swift
//  TestDrivenDevelopment
//
//  Created by GGS-BKS on 09/01/23.
//

import Foundation

struct SortedSet {
    
    var elementsArray : [Int] = []
    
    mutating func AddElement(element : Int){
        if(elementsArray.contains(element)){
            return
        }
            elementsArray.append(element)
            elementsArray.sort()
    }
    
    mutating func AddAllElements(elements : [Int]){
        elements.forEach { element in
           AddElement(element: element)
        }
    }
    
    mutating func GetMaxElement() throws -> Int {
        guard let maxElement = elementsArray.max() else {
            throw SortedSetError.invalidNumber
            }
        return maxElement
    }
    
    mutating func GetMinElement() throws -> Int {
        guard let minElement = elementsArray.min() else {
            throw SortedSetError.invalidNumber
            }
        return minElement
    }
    
    mutating func DeleteItemAtIndex(index : Int) throws  {
        guard elementsArray.indices.contains(index) else{
            throw SortedSetError.invalidIndex
        }
            elementsArray.remove(at: index)
    }
    
    mutating func IsElementExists(element : Int) -> Bool  {
        var elementExists: Bool = false
        if(elementsArray.contains(element)){
            elementExists = true
        }
            return elementExists
    }
    
}

enum SortedSetError: Error {
    case invalidNumber
    case invalidIndex
}
