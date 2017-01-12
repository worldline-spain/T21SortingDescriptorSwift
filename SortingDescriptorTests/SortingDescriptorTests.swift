//
//  SortingDescriptorTests.swift
//  SortingDescriptorTests
//
//  Created by Eloi Guzmán Cerón on 11/01/17.
//  Copyright © 2017 Worldline. All rights reserved.
//

import XCTest
@testable import SortingDescriptor

class SortingDescriptorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testAgeSortingAscending() {
        let personsToSort = [Person(29,"Tom"),Person(10,"Jack"),Person(54,"Ana"),Person(24,"Maria")]
        let sortingDescriptor: SortDescriptor<Person> = sortDescriptor({ $0.age })
        let personsSortedByAge = personsToSort.sorted(by: sortingDescriptor)
        XCTAssert(personsSortedByAge[0].name == "Jack")
        XCTAssert(personsSortedByAge[1].name == "Maria")
        XCTAssert(personsSortedByAge[2].name == "Tom")
        XCTAssert(personsSortedByAge[3].name == "Ana")
    }
    
    func testAgeSortingDescending() {
        let personsToSort = [Person(29,"Tom"),Person(10,"Jack"),Person(54,"Ana"),Person(24,"Maria")]
        let sortingDescriptor: SortDescriptor<Person> = sortDescriptor({ $0.age }, >)
        let personsSortedByAge = personsToSort.sorted(by: sortingDescriptor)
        XCTAssert(personsSortedByAge[0].name == "Ana")
        XCTAssert(personsSortedByAge[1].name == "Tom")
        XCTAssert(personsSortedByAge[2].name == "Maria")
        XCTAssert(personsSortedByAge[3].name == "Jack")
    }
    
    func testCombinedSortingByAgeAndName() {
        let personsToSort = [Person(29,"Tom"),Person(10,"Jack"),Person(54,"Ana"),Person(24,"Maria"),Person(24,"Aurora"),Person(29,"Daniel")]
        let sortingDescriptorByAge: SortDescriptor<Person> = sortDescriptor({ $0.age }, >)
        let sortingDescriptorByName: SortDescriptor<Person> = sortDescriptor(key: { $0.name }, String.localizedCaseInsensitiveCompare)
        
        let combinedSortingDescriptor = combine(sortDescriptors: [sortingDescriptorByAge,sortingDescriptorByName])
        let personsSortedByAgeAndName = personsToSort.sorted(by: combinedSortingDescriptor)
        XCTAssert(personsSortedByAgeAndName[0].name == "Ana")
        XCTAssert(personsSortedByAgeAndName[1].name == "Daniel")
        XCTAssert(personsSortedByAgeAndName[2].name == "Tom")
        XCTAssert(personsSortedByAgeAndName[3].name == "Aurora")
        XCTAssert(personsSortedByAgeAndName[4].name == "Maria")
        XCTAssert(personsSortedByAgeAndName[5].name == "Jack")
    }
    
    func testCombinedSortingByAgeAndName2() {
        let personsToSort = [Person(29,"Tom"),Person(10,"Jack"),Person(54,"Ana"),Person(24,"Maria"),Person(24,"Aurora"),Person(29,"Daniel")]
        let sortingDescriptorByAge: SortDescriptor<Person> = sortDescriptor({ $0.age }, >)
        let sortingDescriptorByName: SortDescriptor<Person> = sortDescriptor(key: { $0.name },ascending: false,String.localizedCaseInsensitiveCompare)
        
        let combinedSortingDescriptor = combine(sortDescriptors: [sortingDescriptorByAge,sortingDescriptorByName])
        let personsSortedByAgeAndName = personsToSort.sorted(by: combinedSortingDescriptor)
        XCTAssert(personsSortedByAgeAndName[0].name == "Ana")
        XCTAssert(personsSortedByAgeAndName[1].name == "Tom")
        XCTAssert(personsSortedByAgeAndName[2].name == "Daniel")
        XCTAssert(personsSortedByAgeAndName[3].name == "Maria")
        XCTAssert(personsSortedByAgeAndName[4].name == "Aurora")
        XCTAssert(personsSortedByAgeAndName[5].name == "Jack")
    }
    
    func testCombinedSortingByNameAndAge() {
        let personsToSort = [Person(29,"Tom"),Person(10,"Jack"),Person(54,"Ana"),Person(20,"Maria"),Person(24,"Maria"),Person(19,"Tom")]
        let sortingDescriptorByName: SortDescriptor<Person> = sortDescriptor(key: { $0.name },ascending: true,String.localizedCaseInsensitiveCompare)
        let sortingDescriptorByAge: SortDescriptor<Person> = sortDescriptor({ $0.age }, >)
        
        let combinedSortingDescriptor = combine(sortDescriptors: [sortingDescriptorByName,sortingDescriptorByAge])
        let personsSortedByAgeAndName = personsToSort.sorted(by: combinedSortingDescriptor)
        XCTAssert(personsSortedByAgeAndName[0].age == 54)
        XCTAssert(personsSortedByAgeAndName[1].age == 10)
        XCTAssert(personsSortedByAgeAndName[2].age == 24)
        XCTAssert(personsSortedByAgeAndName[3].age == 20)
        XCTAssert(personsSortedByAgeAndName[4].age == 29)
        XCTAssert(personsSortedByAgeAndName[5].age == 19)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
