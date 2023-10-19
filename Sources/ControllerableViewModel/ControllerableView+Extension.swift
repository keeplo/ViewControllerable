//
//  File.swift
//  
//
//  Created by 김용우 on 2023/10/19.
//

import SwiftUI

public extension ControllerableView {
    
    var viewController: UIViewController {
        let viewController = HostingController(rootView: self)
        self.stateView.viewController = viewController
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

// MARK: - Navigation
public extension ControllerableView {
    
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
    
    func push(view: some ControllerableView) {
        stateView.viewController?.navigationController?.pushViewController(view.viewController, animated: true)
    }
    
    func pop() {
        stateView.viewController?.navigationController?.popViewController(animated: true)
    }
    
    func popToRoot() {
        stateView.viewController?.navigationController?.popToRootViewController(animated: true)
    }
    
    func restack(views: [any ControllerableView]) {
        self.popToRoot()
        let viewControllers = views.compactMap({ $0.viewController })
        stateView.viewController?.navigationController?.viewControllers.append(contentsOf: viewControllers)
    }
    
    func present(
        view: some ControllerableView,
        to presentationStyle: UIModalPresentationStyle? = nil,
        by transitionStyle: UIModalTransitionStyle? = nil,
        with detents: [UISheetPresentationController.Detent]? = nil
    ) {
        let nextViewController = view.viewController
        
        let presentingViewController = UINavigationController(rootViewController: nextViewController)
        presentingViewController.setNavigationBarHidden(true, animated: false)
        
        if let detents = detents {
            presentingViewController.sheetPresentationController?.detents = detents
        }
        if let presentationStyle = presentationStyle {
            presentingViewController.modalPresentationStyle = presentationStyle
        }
        if let transitionStyle = transitionStyle {
            presentingViewController.modalTransitionStyle = transitionStyle
        }
        
        stateView.viewController?.present(presentingViewController, animated: true)
    }
    
    func presentAlert(
        view: some ControllerableView,
        to presentationStyle: UIModalPresentationStyle? = .overFullScreen,
        by transitionStyle: UIModalTransitionStyle? = .crossDissolve
    ) {
        guard let window = window,
              var rootViewController = window.rootViewController else { return }
        
        if let presentedViewController = rootViewController.presentedViewController {
            rootViewController = presentedViewController
        }
        
        let nextViewController = view.viewController
        nextViewController.view.backgroundColor = .clear
        
        if let presentationStyle = presentationStyle {
            nextViewController.modalPresentationStyle = presentationStyle
        }
        if let transitionStyle = transitionStyle {
            nextViewController.modalTransitionStyle = transitionStyle
        }
        
        rootViewController.present(nextViewController, animated: true)
    }
    
    func dismiss() {
        stateView.viewController?.dismiss(animated: true)
    }
    
}
