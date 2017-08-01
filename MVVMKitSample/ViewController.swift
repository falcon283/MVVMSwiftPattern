//
//  ViewController.swift
//  MVVMKitSample
//
//  Created by FaLcON2 on 01/08/2017.
//  Copyright © 2017 Gabriele Trabucco. All rights reserved.
//

import UIKit
import MVVMKit

final class ViewController : UIViewController, Presentable {
    
    @IBOutlet weak var customView: CustomView?
    
    typealias BasePresenter = CustomViewBasePresenter
    
    @IBOutlet var presenter: CustomViewBasePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewModel = UserViewModel()
        presenter?.view = customView
        
        presenter?.bind()
    }
}
