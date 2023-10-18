//
//  ViewController.swift
//  Example
//
//  Created by 김용우 on 2023/10/17.
//

import ControllerableViewModel

import SwiftUI

final class FirstViewModel: NavigationableViewModel {
    
}

struct FirstView: ControllerableView {
    
    @ObservedObject var viewModel: FirstViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Button(action: {
                viewModel.push(view: NumberingView(viewModel: .init()))
            }) {
                Text("Push")
            }
            
            Button(action: {
                viewModel.present(view: NumberingView(viewModel: .init()))
            }) {
                Text("Default Present")
            }

            Button(action: {
                viewModel.present(view: NumberingView(viewModel: .init()), to: .fullScreen, by: .coverVertical)
            }) {
                Text("Full Screen")
            }
            
            Button(action: {
                viewModel.present(view: NumberingView(viewModel: .init()), to: .custom, by: .coverVertical, with: [.large(), .medium()])
            }) {
                Text("Changable Modal")
            }
        }
    }

}

