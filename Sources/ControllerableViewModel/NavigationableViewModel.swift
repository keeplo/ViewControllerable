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
@MainActor
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
        
        let presentingViewController = UINavigationController(rootViewController: nextViewController)
        presentingViewController.setNavigationBarHidden(true, animated: false)
        
        viewController?.present(presentingViewController, animated: true)
    }
    
    public func dismiss() {
        viewController?.dismiss(animated: true)
    }
    
    public func popToRoot() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
    
}

@MainActor
extension NavigationableViewModel {
    
    private var window: UIWindow? {
        if #available(iOS 16.0, *) {
            return UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first(where: \.isKeyWindow)
        } else {
            return UIApplication.shared.windows.first(where: \.isKeyWindow)
        }
    }
    
    public func alert(view: some ControllerableView) {
        guard let window = window,
              var rootViewController = window.rootViewController else { return }
        
        if let presentedViewController = rootViewController.presentedViewController {
            rootViewController = presentedViewController
        }
        
        let nextViewController = view.viewController
        
        nextViewController.view.backgroundColor = .clear
        nextViewController.modalPresentationStyle = .overFullScreen
        nextViewController.modalTransitionStyle = .crossDissolve
        
        rootViewController.present(nextViewController, animated: true)
    }
    
}
