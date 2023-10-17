//
//  NavigationableViewModel.swift
//
//
//  Created by 김용우 on 2023/10/17.
//

import SwiftUI

open class NavigationableViewModel: ObservableObject {
    public weak var viewController: UIViewController?
    
    public init() {}
}

// MARK: - Navigation
extension NavigationableViewModel {
    
    public func push(view: some ControllerableView) {
        viewController?.navigationController?.pushViewController(view.viewController, animated: true)
    }
    
    public func pop() {
        guard let currentViewController = viewController,
              let navigationController = currentViewController.navigationController else { return }
        guard navigationController.topViewController == currentViewController else { return }
            
        navigationController.popViewController(animated: true)
    }
    
    public func present(
        view: some ControllerableView,
        to presentationStyle: UIModalPresentationStyle? = nil,
        by transitionStyle: UIModalTransitionStyle? = nil,
        with detents: [UISheetPresentationController.Detent]? = nil
    ) {
        let nextViewController = view.viewController
        
        if let detents = detents {
            nextViewController.sheetPresentationController?.detents = detents
        }
        if let presentationStyle = presentationStyle {
            nextViewController.modalPresentationStyle = presentationStyle
        }
        if let transitionStyle = transitionStyle {
            nextViewController.modalTransitionStyle = transitionStyle
        }
        
        viewController?.present(nextViewController, animated: true)
    }
    
    public func dismiss() {
        viewController?.dismiss(animated: true)
    }
    
    public func popToRoot() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
    
}
