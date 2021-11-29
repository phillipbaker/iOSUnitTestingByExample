//
//  ViewControllerTests.swift
//  NetworkRequestTests
//
//  Created by Phillip Baker on 5/11/21.
//

import XCTest
@testable import NetworkRequest

class ViewControllerTests: XCTestCase {

    private var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.sut = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_tappingButton_shouldMakeDataTaskToSearchForEBookOutFromBoneVille() {
        let mockURLSession = MockURLSession()
        sut.session = mockURLSession
        
        sut.loadViewIfNeeded()
        
        tap(sut.button)
        
            mockURLSession.verifyDataTask(with: URLRequest(url: URL(string: "https://itunes.apple.com/search?" + "media=ebook&term=out%20from%20boneville")!))
    }
    
    func test_searchForBookNetworkCall_withSuccessResponse_shouldSaveDataInResults() {
        let spyURLSession = SpyURLSession()
        sut.session = spyURLSession
        sut.loadViewIfNeeded()
        tap(sut.button)
        
        let handleResultsCalled = expectation(description: "handleResults called")
        
        sut.handleResults = { _ in
            handleResultsCalled.fulfill()
        }
        
        spyURLSession.dataTaskArgsCompletionHandler.first?(jsonData(), response(statusCode: 200), nil)
        
        waitForExpectations(timeout: 0.01)
        
        XCTAssertEqual(sut.results, [
            SearchResult(artistName: "Artist", trackName: "Track", averageUserRating: 2.5, genres: ["Foo", "Bar"])
        ])
    }
    
    func test_searchForBookNetworkCall_withSuccessBeforeAsync_shouldNotSaveDataInResults() {
        let spyURLSession = SpyURLSession()
        sut.session = spyURLSession
        sut.loadViewIfNeeded()
        
        tap(sut.button)
        spyURLSession.dataTaskArgsCompletionHandler.first?(jsonData(), response(statusCode: 200), nil)
        
        XCTAssertEqual(sut.results, [])
    }
    
    private func response(statusCode: Int) -> HTTPURLResponse? {
        HTTPURLResponse(url: URL(string: "http://DUMMY")!, statusCode: statusCode, httpVersion: nil, headerFields: nil)
    }
    
    private func jsonData() -> Data {
        """
        {
            "results": [
                {
                    "artistName": "Artist",
                    "trackName": "Track",
                    "averageUserRating": 2.5,
                    "genres": [
                        "Foo",
                        "Bar"
                    ]
                }
            ]
        }
        """.data(using: .utf8)!
    }
}
