//
//  ViewPresenter.swift
//  MVVMKit
//
//  Created by FaLcON2 on 31/07/2017.
//  Copyright © 2017 Gabriele Trabucco. All rights reserved.
//

import Foundation

public protocol ViewPresenter: ViewModelObserver {
    associatedtype V: View
    var view: V? { get }
}

public protocol Presentable {
    associatedtype BasePresenter: ViewPresenter
    var presenter: BasePresenter? { get set }
}
