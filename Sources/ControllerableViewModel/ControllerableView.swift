//
//  ControllerableView.swift
//  
//
//  Created by 김용우 on 2023/10/17.
//

import SwiftUI

public protocol ControllerableView: View {
    associatedtype ViewModel
    
    var viewModel: ViewModel { get set }
    
    // MARK: ViewController Life Cycle
    func loadView()
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

public extension ControllerableView {
    
    var viewController: UIViewController {
        let viewController = HostingController(rootView: self)
        (self.viewModel as? NavigationableViewModel)?.viewController = viewController
        return viewController
    }
    
    // MARK: ViewController Life Cycle
    func loadView() {}
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
}

public class HostingController<View: ControllerableView>: UIHostingController<View> {
    
    public override func loadView() {
        super.loadView()
        self.rootView.loadView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.rootView.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rootView.viewWillAppear()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.rootView.viewDidAppear()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.rootView.viewWillDisappear()
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.rootView.viewDidDisappear()
    }
    
}

