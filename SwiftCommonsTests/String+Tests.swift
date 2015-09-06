//
//  String+Tests.swift
//  SwiftCommons
//
//  Created by Yusuke on 8/25/15.
//  Copyright © 2015 Yusuke. All rights reserved.
//

import XCTest
@testable import SwiftCommons

class String_Tests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: -
    // MARK: operator
    
    func test_repeat() {
        
        XCTAssertEqual("abc" * 1, "abc")
        XCTAssertEqual("abc" * 2, "abcabc")
        XCTAssertEqual("abc" * 3, "abcabcabc")
    }
    
    // MARK: -
    // MARK: subscript
    
    func test_subscript_index() {

        XCTAssertEqual("Hello"[0], "H")
        XCTAssertEqual("Hello"[1], "e")
        XCTAssertEqual("Hello"[2], "l")
        XCTAssertEqual("Hello"[3], "l")
        XCTAssertEqual("Hello"[4], "o")
    }
    
    func test_subscript_range() {

        // from head
        XCTAssertEqual("Hello"[0..<1], "H")
        XCTAssertEqual("Hello"[0..<2], "He")
        XCTAssertEqual("Hello"[0..<3], "Hel")
        XCTAssertEqual("Hello"[0..<4], "Hell")
        XCTAssertEqual("Hello"[0..<5], "Hello")

        // from tail
        XCTAssertEqual("Hello"[4..<5], "o")
        XCTAssertEqual("Hello"[3..<5], "lo")
        XCTAssertEqual("Hello"[2..<5], "llo")
        XCTAssertEqual("Hello"[1..<5], "ello")
        XCTAssertEqual("Hello"[0..<5], "Hello")
    }
    
    // MARK: -
    // MARK: property

    func test_length() {
        XCTAssertEqual("Hello".length, 5)
        XCTAssertEqual("あいうえお".length, 5)
        XCTAssertEqual("🍎🍊🍌🍇🍉".length, 5)
        XCTAssertEqual("\u{E9}".length, 1) // // é
        XCTAssertEqual("\u{65}\u{301}".length, 1) // e followed by ́
    }
    
    // MARK: -
    // MARK: method
    
    func test_trim() {
        XCTAssertEqual("hello".trim(), "hello")
        XCTAssertEqual(" hello ".trim(), "hello")
        XCTAssertEqual("  hello  ".trim(), "hello")
    }
    
    func test_trimn() {
        XCTAssertEqual("hello\n".trimn(), "hello")
        XCTAssertEqual("\n hello\n ".trimn(), "hello")
        XCTAssertEqual("  \nhello  \n".trimn(), "hello")
    }
    
    func test_split() {
        XCTAssertEqual(
            ["apple", "banana", "orange"],
            "apple-banana-orange".split("-"))
    }
    
    func test_urlEncode_urlDecode() {
        
        let string = "http://hogehoge.com/?param=!*'();:@&=+$,/?%#[]"
        
        let encodedString = string.urlEncode()
        XCTAssertEqual("http%3A%2F%2Fhogehoge%2Ecom%2F%3Fparam%3D%21%2A%27%28%29%3B%3A%40%26%3D%2B%24%2C%2F%3F%25%23%5B%5D", encodedString)
        
        let decodedString = encodedString.urlDecode()
        XCTAssertEqual(string, decodedString)
    }
    
    func test_toDate() {
        
        func expect (y y:Int, m:Int, d:Int) -> NSDate? {
            let dateComp = NSDateComponents()
            dateComp.calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
            dateComp.year = y
            dateComp.month = m
            dateComp.day = d
            return dateComp.date
        }
        
        //gregorian test
        let e = expect(y: 2015, m: 9, d: 6)
        let d = "2015/9/6".toDate(format: "yyyy/M/d")
        XCTAssertEqual(e!, d!)
        
        //japanese test 1
        let d_us_JP = "H27 9/6".toDate(format: "GGGGGyy M/d",cal:NSCalendarIdentifierJapanese, loc:"us_JP")
        XCTAssertEqual(e!, d_us_JP!)
        
        //japanese test 2
        let d_ja_JP = "平成27年9月6日".toDate(format: "GGGyy年M月d日",cal:NSCalendarIdentifierJapanese, loc:"ja_JP")
        XCTAssertEqual(e!, d_ja_JP!)
        
    }
}
