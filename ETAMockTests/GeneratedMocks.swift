// MARK: - Mocks generated from file: ETAMock/JSONFetcher.swift at 2017-03-24 13:20:25 +0000

//
//  JSONfetcher.swift
//  ETAMock
//
//  Created by Donald Freeman on 3/23/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import Cuckoo
@testable import ETAMock

import Foundation

class MockJSONfetcher: JSONfetcher, Cuckoo.Mock {
    typealias MocksType = JSONfetcher
    typealias Stubbing = __StubbingProxy_JSONfetcher
    typealias Verification = __VerificationProxy_JSONfetcher
    let manager = Cuckoo.MockManager()
    
    private var observed: JSONfetcher?
    
    func spy(on victim: JSONfetcher) -> Self {
        observed = victim
        return self
    }
    
    override var willBeParsedData: [[String:Any]] {
        get {
            return manager.getter("willBeParsedData", original: observed.map { o in return { () -> [[String:Any]] in o.willBeParsedData } })
        }
        set {
            manager.setter("willBeParsedData", value: newValue, original: observed != nil ? { self.observed?.willBeParsedData = $0 } : nil)
        }
    }
    
    override func getJSONStringArray(completion: @escaping ([[String:Any]]?) -> Void) {
        return manager.call("getJSONStringArray(completion: @escaping ([[String:Any]]?) -> Void)", parameters: (completion), original: observed.map { o in return { (completion: @escaping ([[String:Any]]?) -> Void) in o.getJSONStringArray(completion: completion) } })
    }
    
    struct __StubbingProxy_JSONfetcher: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var willBeParsedData: Cuckoo.ToBeStubbedProperty<[[String:Any]]> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "willBeParsedData")
        }
        
        func getJSONStringArray<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.StubNoReturnFunction<(([[String:Any]]?) -> Void)> where M1.MatchedType == ([[String:Any]]?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(([[String:Any]]?) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("getJSONStringArray(completion: @escaping ([[String:Any]]?) -> Void)", parameterMatchers: matchers))
        }
    }
    
    struct __VerificationProxy_JSONfetcher: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var willBeParsedData: Cuckoo.VerifyProperty<[[String:Any]]> {
            return Cuckoo.VerifyProperty(manager: manager, name: "willBeParsedData", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func getJSONStringArray<M1: Cuckoo.Matchable>(completion: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == ([[String:Any]]?) -> Void {
            let matchers: [Cuckoo.ParameterMatcher<(([[String:Any]]?) -> Void)>] = [wrap(matchable: completion) { $0 }]
            return manager.verify("getJSONStringArray(completion: @escaping ([[String:Any]]?) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
    }
}

class JSONfetcherStub: JSONfetcher {
    
    override var willBeParsedData: [[String:Any]] {
        get {
            return DefaultValueRegistry.defaultValue(for: ([[String:Any]]).self)
        }
        set {
        }
    }
    
    override func getJSONStringArray(completion: @escaping ([[String:Any]]?) -> Void) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}
