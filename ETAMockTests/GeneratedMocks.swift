// MARK: - Mocks generated from file: ETAMock/RouteTableViewController.swift at 2017-03-23 16:56:31 +0000

//
//  RouteTableViewController.swift
//  ETAMock
//
//  Created by Donald Freeman on 3/23/17.
//  Copyright © 2017 Donald Freeman. All rights reserved.
//

import Cuckoo
@testable import ETAMock

import Foundation
import UIKit

class MockRouteTableViewController: RouteTableViewController, Cuckoo.Mock {
    typealias MocksType = RouteTableViewController
    typealias Stubbing = __StubbingProxy_RouteTableViewController
    typealias Verification = __VerificationProxy_RouteTableViewController
    let manager = Cuckoo.MockManager()
    
    private var observed: RouteTableViewController?
    
    func spy(on victim: RouteTableViewController) -> Self {
        observed = victim
        return self
    }
    
    override var stringArray: [String] {
        get {
            return manager.getter("stringArray", original: observed.map { o in return { () -> [String] in o.stringArray } })
        }
        set {
            manager.setter("stringArray", value: newValue, original: observed != nil ? { self.observed?.stringArray = $0 } : nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        return manager.call("viewWillAppear(_: Bool)", parameters: (animated), original: observed.map { o in return { (animated: Bool) in o.viewWillAppear(animated) } })
    }
    
    override func viewDidLoad() {
        return manager.call("viewDidLoad()", parameters: (), original: observed.map { o in return { () in o.viewDidLoad() } })
    }
    
    override func didReceiveMemoryWarning() {
        return manager.call("didReceiveMemoryWarning()", parameters: (), original: observed.map { o in return { () in o.didReceiveMemoryWarning() } })
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return manager.call("numberOfSections(in: UITableView) -> Int", parameters: (tableView), original: observed.map { o in return { (tableView: UITableView) -> Int in o.numberOfSections(in: tableView) } })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.call("tableView(_: UITableView, numberOfRowsInSection: Int) -> Int", parameters: (tableView, section), original: observed.map { o in return { (tableView: UITableView, section: Int) -> Int in o.tableView(tableView, numberOfRowsInSection: section) } })
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return manager.call("tableView(_: UITableView, cellForRowAt: IndexPath) -> UITableViewCell", parameters: (tableView, indexPath), original: observed.map { o in return { (tableView: UITableView, indexPath: IndexPath) -> UITableViewCell in o.tableView(tableView, cellForRowAt: indexPath) } })
    }
    
    override func setJSONStringArray() {
        return manager.call("setJSONStringArray()", parameters: (), original: observed.map { o in return { () in o.setJSONStringArray() } })
    }
    
    struct __StubbingProxy_RouteTableViewController: Cuckoo.StubbingProxy {
        private let manager: Cuckoo.MockManager
        
        init(manager: Cuckoo.MockManager) {
            self.manager = manager
        }
        
        var stringArray: Cuckoo.ToBeStubbedProperty<[String]> {
            return Cuckoo.ToBeStubbedProperty(manager: manager, name: "stringArray")
        }
        
        func viewWillAppear<M1: Cuckoo.Matchable>(_ animated: M1) -> Cuckoo.StubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: animated) { $0 }]
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("viewWillAppear(_: Bool)", parameterMatchers: matchers))
        }
        
        func viewDidLoad() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("viewDidLoad()", parameterMatchers: []))
        }
        
        func didReceiveMemoryWarning() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("didReceiveMemoryWarning()", parameterMatchers: []))
        }
        
        func numberOfSections<M1: Cuckoo.Matchable>(in tableView: M1) -> Cuckoo.StubFunction<(UITableView), Int> where M1.MatchedType == UITableView {
            let matchers: [Cuckoo.ParameterMatcher<(UITableView)>] = [wrap(matchable: tableView) { $0 }]
            return Cuckoo.StubFunction(stub: manager.createStub("numberOfSections(in: UITableView) -> Int", parameterMatchers: matchers))
        }
        
        func tableView<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ tableView: M1, numberOfRowsInSection section: M2) -> Cuckoo.StubFunction<(UITableView, Int), Int> where M1.MatchedType == UITableView, M2.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(UITableView, Int)>] = [wrap(matchable: tableView) { $0.0 }, wrap(matchable: section) { $0.1 }]
            return Cuckoo.StubFunction(stub: manager.createStub("tableView(_: UITableView, numberOfRowsInSection: Int) -> Int", parameterMatchers: matchers))
        }
        
        func tableView<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ tableView: M1, cellForRowAt indexPath: M2) -> Cuckoo.StubFunction<(UITableView, IndexPath), UITableViewCell> where M1.MatchedType == UITableView, M2.MatchedType == IndexPath {
            let matchers: [Cuckoo.ParameterMatcher<(UITableView, IndexPath)>] = [wrap(matchable: tableView) { $0.0 }, wrap(matchable: indexPath) { $0.1 }]
            return Cuckoo.StubFunction(stub: manager.createStub("tableView(_: UITableView, cellForRowAt: IndexPath) -> UITableViewCell", parameterMatchers: matchers))
        }
        
        func setJSONStringArray() -> Cuckoo.StubNoReturnFunction<()> {
            return Cuckoo.StubNoReturnFunction(stub: manager.createStub("setJSONStringArray()", parameterMatchers: []))
        }
    }
    
    struct __VerificationProxy_RouteTableViewController: Cuckoo.VerificationProxy {
        private let manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
        
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        var stringArray: Cuckoo.VerifyProperty<[String]> {
            return Cuckoo.VerifyProperty(manager: manager, name: "stringArray", callMatcher: callMatcher, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func viewWillAppear<M1: Cuckoo.Matchable>(_ animated: M1) -> Cuckoo.__DoNotUse<Void> where M1.MatchedType == Bool {
            let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: animated) { $0 }]
            return manager.verify("viewWillAppear(_: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func viewDidLoad() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("viewDidLoad()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func didReceiveMemoryWarning() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("didReceiveMemoryWarning()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func numberOfSections<M1: Cuckoo.Matchable>(in tableView: M1) -> Cuckoo.__DoNotUse<Int> where M1.MatchedType == UITableView {
            let matchers: [Cuckoo.ParameterMatcher<(UITableView)>] = [wrap(matchable: tableView) { $0 }]
            return manager.verify("numberOfSections(in: UITableView) -> Int", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func tableView<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ tableView: M1, numberOfRowsInSection section: M2) -> Cuckoo.__DoNotUse<Int> where M1.MatchedType == UITableView, M2.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(UITableView, Int)>] = [wrap(matchable: tableView) { $0.0 }, wrap(matchable: section) { $0.1 }]
            return manager.verify("tableView(_: UITableView, numberOfRowsInSection: Int) -> Int", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func tableView<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ tableView: M1, cellForRowAt indexPath: M2) -> Cuckoo.__DoNotUse<UITableViewCell> where M1.MatchedType == UITableView, M2.MatchedType == IndexPath {
            let matchers: [Cuckoo.ParameterMatcher<(UITableView, IndexPath)>] = [wrap(matchable: tableView) { $0.0 }, wrap(matchable: indexPath) { $0.1 }]
            return manager.verify("tableView(_: UITableView, cellForRowAt: IndexPath) -> UITableViewCell", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
        }
        
        @discardableResult
        func setJSONStringArray() -> Cuckoo.__DoNotUse<Void> {
            return manager.verify("setJSONStringArray()", callMatcher: callMatcher, parameterMatchers: [] as [Cuckoo.ParameterMatcher<Void>], sourceLocation: sourceLocation)
        }
    }
}

class RouteTableViewControllerStub: RouteTableViewController {
    
    override var stringArray: [String] {
        get {
            return DefaultValueRegistry.defaultValue(for: ([String]).self)
        }
        set {
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    override func viewDidLoad() {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    override func didReceiveMemoryWarning() {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return DefaultValueRegistry.defaultValue(for: (Int).self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DefaultValueRegistry.defaultValue(for: (Int).self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return DefaultValueRegistry.defaultValue(for: (UITableViewCell).self)
    }
    
    override func setJSONStringArray() {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}
