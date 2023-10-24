//
//  ViewControllerable.swift
//  
//
//  Created by 김용우 on 2023/10/17.
//

import SwiftUI

public protocol ViewControllerable where Self: View {
    
    var stateView: StateView { get set }
        
    // MARK: ViewController Life Cycle
    func loadView()
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    // MARK: Navigation
    func push(view: some ViewControllerable)
    func pop()
    func popToRoot()
    func restack(views: [some ViewControllerable])
    func present(
        view: some ViewControllerable,
        to presentationStyle: UIModalPresentationStyle?,
        by transitionStyle: UIModalTransitionStyle?,
        with detents: [UISheetPresentationController.Detent]?
    )
    func presentAlert(
        view: some ViewControllerable,
        to presentationStyle: UIModalPresentationStyle?,
        by transitionStyle: UIModalTransitionStyle?
    )
    func dismiss(completion: (() -> Void)?)
    
}

