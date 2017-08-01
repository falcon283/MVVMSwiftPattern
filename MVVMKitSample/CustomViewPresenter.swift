//
//  CustomViewPresenter.swift
//  MVVMKit
//
//  Created by FaLcON2 on 02/08/2017.
//  Copyright © 2017 Gabriele Trabucco. All rights reserved.
//

import Foundation
import MVVMKit

class CustomViewBasePresenter: NSObject, ViewPresenter {
    
    typealias V = CustomView
    typealias VM = UserViewModel
    
    var viewModel: UserViewModel?
    weak var view: CustomView?
    
    func bind() { }
}

final class CustomViewFullNamePresenter: CustomViewBasePresenter {
    
    override func bind() {
        guard let viewModel = viewModel else {
            return
        }
        
        view?.label?.text = "\(viewModel.name) \(viewModel.surname)"
    }
}

final class CustomViewNamePresenter: CustomViewBasePresenter {
    override func bind() {
        view?.label?.text = viewModel?.name
    }
}
