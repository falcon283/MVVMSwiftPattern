//
//  Context.swift
//  MVVMKit
//
//  Created by Gabriele Trabucco on 26/06/2017.
//  Copyright © 2017 Gabriele Trabucco. All rights reserved.
//

import Foundation

public protocol Contexted {
    var context: Any? { get }
}

public protocol Contextable: class, Contexted {
    var context: Any? { get set }
}

public protocol ContextInjector {
    func prepare(_ contextable: Contextable, for identifier: ContextIdentifier?, sender: Any?)
}

public extension ContextInjector where Self: UIViewController {
    
    func contextInjection(for viewController: UIViewController, identifier: ContextIdentifier?, sender: Any?) {
        
        guard let contextable = viewController as? Contextable else {
            return
        }
        
        prepare(contextable, for: identifier, sender: sender)
    }
    
    func contextInjection(with segue: UIStoryboardSegue, sender: Any?) {
        
        contextInjection(for: segue.destination, identifier: segue.contextIdentifier, sender: sender)
    }
}

public struct ContextIdentifier {
    
    public let value: String
    
    public init(_ identifier: String) {
        value = identifier
    }
}

fileprivate extension UIStoryboardSegue {
    
    var contextIdentifier: ContextIdentifier? {
        
        guard let identifier = identifier else {
            return nil
        }
        
        return ContextIdentifier(identifier)
    }
}
