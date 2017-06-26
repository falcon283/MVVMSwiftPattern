//
//  MVVMKitTests.swift
//  MVVMKitTests
//
//  Created by Gabriele Trabucco on 26/06/2017.
//  Copyright © 2017 Gabriele Trabucco. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import MVVMKit

class MVVMKitTests: QuickSpec {
    
    override func spec() {
        
        describe("MVVMKit Context Protocols Implementation Test") {
            
            let context = "Test"
            let contexted = UIStoryboard(name: "Test", bundle: Bundle(for: MVVMKitTests.self)).instantiateViewController(withIdentifier: "TestRootViewController") as! TestNavigationController
            
            contexted.context = context
            
            it("Contextable should have valid context") {
                let vc = contexted.viewControllers.first as! TestViewController
                expect(vc.context as? String) == context
            }
        }
        
        describe("MVVMKit ViewModel Protocols Implementation Test") {
            
            let context = "Test"
            let contexted = UIStoryboard(name: "Test", bundle: Bundle(for: MVVMKitTests.self)).instantiateViewController(withIdentifier: "TestRootViewController") as! TestNavigationController
            
            var bind = false
            var display = false
            
            let vc = contexted.viewControllers.first as! TestViewController
            vc.bindCallback = { bind = $0 }
            vc.displayCallback = { display = $0 }
            
            contexted.context = context
            
            it("Contextable should have valid VM") {
                expect(vc.viewModel).toNot(beNil())
                expect(bind && display).to(beTrue())
            }
        }
    }
}

class TestNavigationController: UINavigationController, ContextInjector, Contexted {
    
    var context: Any? {
        didSet {
            guard let vc = viewControllers.first else {
                return
            }
            
            contextInjection(for: vc, identifier: nil, sender: nil)
        }
    }
    
    func prepare(_ contextable: Contextable, for identifier: ContextIdentifier?, sender: Any?) {
        contextable.context = context
    }
}

class TestViewModel: ViewModel { }

class TestViewController: UIViewController, Contextable, ViewModelHolder, InfoRenderer {
    
    var context: Any? {
        didSet {
            let vm = TestViewModel()
            viewModel = vm
            
            bind(viewModel: vm)
            display(info: vm)
        }
    }
    
    typealias VM = TestViewModel
    typealias Info = Any
    
    var viewModel: TestViewModel?
    
    func bind(viewModel: TestViewModel) {
        bindCallback?(true)
    }
    
    func display(info: Any?) {
        displayCallback?(true)
    }
    
    var bindCallback: ((Bool)->())?
    var displayCallback: ((Bool)->())?
}
