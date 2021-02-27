//
//  AppRouterTests.swift
//  AppRouterTests
//
//  Created by SUNG HAO LIN on 2021/2/24.
//

import XCTest
import URLNavigator
import AppRouter

public protocol NavigatorProtocol {
}

public class AppRouter {
    private let navigator: NavigatorProtocol
    
    public init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
    
}

class AppRouterTests: XCTestCase {
    
    // MARK: - Helpers
    
    private func makeSUT(
        file: StaticString = #file,
        line: UInt = #line
    ) -> (sut: AppRouter, navigatorSpy: NavigatorSpy)
    {
        let navigatorSpy = NavigatorSpy()
        let sut = AppRouter(navigator: navigatorSpy)
        trackForMemoryLeaks(sut)
        trackForMemoryLeaks(navigatorSpy)
        return (sut, navigatorSpy)
    }
    
    private class NavigatorSpy: NavigatorProtocol {
        
    }
    
    private func trackForMemoryLeaks(
        _ instance: AnyObject,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(
                instance, "Instance should have been deallocated. Potential memory leak.",
                file: file, line: line
            )
        }
    }}
