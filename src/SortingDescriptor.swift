//
//  SortingDescriptor.swift
//  MyApp
//
//  Created by Eloi Guzmán Cerón on 19/12/16.
//  Copyright © 2016 Worldline. All rights reserved.
//

import Foundation

public typealias SortDescriptor<Value> = (Value, Value) -> Bool

public func combine<Value>(sortDescriptors: [SortDescriptor<Value>]) -> SortDescriptor<Value> {
    return { lhs, rhs in
        for isOrderedBefore in sortDescriptors {
            if isOrderedBefore(lhs,rhs) { return true }
            if isOrderedBefore(rhs,lhs) { return false }
        }
        return false
    }
}

/** 
 
 Example:
 
 let sortByYear: SortDescriptor<Person> = sortDescriptor({ $0.yearOfBirth }, <)
 
 */
func sortDescriptor<Value, Key>(_ key: @escaping (Value) -> Key, _ isOrderedBefore: @escaping (Key, Key) -> Bool) -> SortDescriptor<Value> {
        return { isOrderedBefore(key($0), key($1)) }
}


/** 
 
 Example:
 
 let sortByYearAlt: SortDescriptor<Person> = sortDescriptor({ $0.yearOfBirth })
 
 */
func sortDescriptor<Value, Key>(_ key: @escaping (Value) -> Key) -> SortDescriptor<Value> where Key: Comparable {
        return { key($0) < key($1) }
}


/**
 
 Example:
 
 let sortByFirstName: SortDescriptor<Person> = sortDescriptor(key: { $0.first }, String.localizedCaseInsensitiveCompare)
 
 */
func sortDescriptor<Value, Key>(key: @escaping (Value) -> Key, ascending: Bool = true, _ comparator: @escaping (Key) -> (Key) -> ComparisonResult) -> SortDescriptor<Value> {
    return { lhs, rhs in
        let order: ComparisonResult = ascending ? .orderedAscending : .orderedDescending
        return comparator(key(lhs))(key(rhs)) == order
    }
}
