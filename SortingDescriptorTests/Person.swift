//
//  Person.swift
//  SortingDescriptor
//
//  Created by Eloi Guzmán Cerón on 12/01/17.
//  Copyright © 2017 Worldline. All rights reserved.
//

import Foundation

public class Person : CustomStringConvertible, CustomDebugStringConvertible {
    
    public var age: Int
    public var name: String
    
    public init(_ age: Int, _ name: String) {
        self.age = age
        self.name = name
    }
    
    public var description: String {
        return "\(name): \(age)"
    }
    
    public var debugDescription: String {
        return description
    }
}

extension Person {
    
}
