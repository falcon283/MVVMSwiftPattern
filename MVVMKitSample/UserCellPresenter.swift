//
//  UserCellPresenter.swift
//  MVVMKit
//
//  Created by FaLcON2 on 02/08/2017.
//  Copyright © 2017 Gabriele Trabucco. All rights reserved.
//

import UIKit
import MVVMKit

class UserCellBasePresenter : ViewPresenter {
    
    typealias VM = UserViewModel
    typealias V = UserCell
    
    var viewModel: UserViewModel?
    weak var view: UserCell?
    
    func bind() { }
}

class UserCellFullNamePresenter : UserCellBasePresenter {
    
    override func bind() {
        self.view?.nameLabel?.text = viewModel?.name
        self.view?.surnameLabel?.text = viewModel?.surname
    }
}

class UserCellNamePresenter : UserCellBasePresenter {
    override func bind() {
        self.view?.nameLabel?.text = viewModel?.name
    }
}
