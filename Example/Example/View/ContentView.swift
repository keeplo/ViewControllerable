//
//  ViewController.swift
//  Example
//
//  Created by 김용우 on 2023/10/17.
//

import ControllerableViewModel

import SwiftUI

struct FirstView: ControllerableView {
    
    var stateView: StateView
    
    var body: some View {
        VStack(spacing: 30) {
            Button(action: {
                self.push(view: NumberingView(viewModel: .init()))
            }) {
                Text("Push")
            }
            
            Button(action: {
                self.present(view: NumberingView(viewModel: .init()))
            }) {
                Text("Default Present")
            }

            Button(action: {
                self.present(view: NumberingView(viewModel: .init()), to: .fullScreen, by: .coverVertical)
            }) {
                Text("Full Screen")
            }
            
            Button(action: {
                self.present(view: NumberingView(viewModel: .init()), to: .custom, by: .coverVertical, with: [.large(), .medium()])
            }) {
                Text("Changable Modal")
            }
        }
    }

}

