//
//  ControllerableView.swift
//  
//
//  Created by 김용우 on 2023/10/17.
//

import SwiftUI

public protocol ControllerableView: View {
    
    var stateView: StateView { get set }
        
    // MARK: ViewController Life Cycle
    func loadView()
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    // MARK: Navigation
    func push(view: some ControllerableView)
    func pop()
    func present(view: some ControllerableView, to presentationStyle: UIModalPresentationStyle?, by transitionStyle: UIModalTransitionStyle?, with detents: [UISheetPresentationController.Detent]?)
    func dismiss()
    func popToRoot()
    func presentAlert(view: some ControllerableView, to presentationStyle: UIModalPresentationStyle?, by transitionStyle: UIModalTransitionStyle?)
}

