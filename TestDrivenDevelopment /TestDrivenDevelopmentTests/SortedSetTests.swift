//
//  SortedSetTests.swift
//  TestDrivenDevelopmentTests
//
//  Created by GGS-BKS on 09/01/23.
//

import XCTest
@testable import TestDrivenDevelopment

final class SortedSetTests: XCTestCase {
    
    var objSortedSet : SortedSet?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        objSortedSet = SortedSet()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        objSortedSet = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAddElement(){
        objSortedSet?.AddElement(element : 0)
        XCTAssertTrue(objSortedSet?.elementsArray.count == 1)
    }
    
    func testAddAll(){
        objSortedSet?.AddAllElements(elements : [1, 2, 3, 4, 5])
        XCTAssertTrue(objSortedSet?.elementsArray.count == 5)
        XCTAssertFalse(objSortedSet?.elementsArray.count == 0)
    }
    
    func testGetMaxElement(){
        objSortedSet?.AddAllElements(elements : [1, 2, 3, 4, 5])
        XCTAssertEqual(try? objSortedSet?.GetMaxElement(), 5)
    }
    
    func testMaxElementThatThrowsError(){
        objSortedSet?.AddAllElements(elements : [])
        XCTAssertThrowsError(try objSortedSet?.GetMaxElement()) { error in
            XCTAssertEqual(error as! SortedSetError, SortedSetError.invalidNumber)
               }
    }
    
    func testGetMinElement(){
        objSortedSet?.AddAllElements(elements : [1, 2, 3, 4, 5])
        XCTAssertEqual(try? objSortedSet?.GetMinElement(), 1)
    }
    
    func testGetMinElementThatThrowsError(){
        objSortedSet?.AddAllElements(elements : [])
        XCTAssertThrowsError(try objSortedSet?.GetMinElement()) { error in
            XCTAssertEqual(error as! SortedSetError, SortedSetError.invalidNumber)
               }
    }
    
    func testDeleteElementAtIndex(){
        objSortedSet?.AddAllElements(elements : [1, 2, 3, 4, 5])
        try? objSortedSet?.DeleteItemAtIndex(index: 0)
        XCTAssertTrue(objSortedSet?.elementsArray.count == 4)
    }
    
    func testDeleteElementAtIndexThows(){
        XCTAssertThrowsError(try objSortedSet?.DeleteItemAtIndex(index: 0)) { error in
            XCTAssertEqual(error as! SortedSetError, SortedSetError.invalidIndex)
               }
    }
    
    func testIsElementExists(){
        objSortedSet?.AddAllElements(elements : [1, 2, 3, 4, 5])
        XCTAssertEqual(objSortedSet?.IsElementExists(element: 3), true)
        XCTAssertEqual(objSortedSet?.IsElementExists(element: 10), false)
    }
}
