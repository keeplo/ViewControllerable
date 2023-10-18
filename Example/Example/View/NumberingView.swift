//
//  NumberingView.swift
//  Example
//
//  Created by 김용우 on 2023/10/17.
//

import ControllerableViewModel

import SwiftUI

final class NumberingViewModel: NavigationableViewModel {
    static var number: Int = 0
    
    let number: Int
    
    override init() {
        self.number = Self.number
        
        super.init()
                
        Self.number += 1
        
        print("init \(number)")
    }
    
    deinit {
        print("deinit \(number)")
    }
    
}

struct NumberingView: ControllerableView {
    
    @ObservedObject var viewModel: NumberingViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Number \(viewModel.number)")
            
            Button(action: {
                viewModel.push(view: NumberingView(viewModel: .init()))
            }) {
                Text("push")
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
            
            Button(action: {
                viewModel.dismiss()
            }) {
                Text("dismiss")
            }
            
            Button(action: {
                viewModel.pop()
            }) {
                Text("pop")
            }
            
            Button(action: {
                viewModel.popToRoot()
            }) {
                Text("pop to root")
            }
            
            Button(action: {
                viewModel.popToRoot()
                viewModel.push(view: NumberingView(viewModel: .init()))
                viewModel.push(view: NumberingView(viewModel: .init()))
            }) {
                Text("reStacks")
            }
            }
        }
        .onAppear() {
            print("onAppear \(viewModel.number)")
        }
        .onDisappear() {
            print("onDisappear \(viewModel.number)")
        }
    }
    
    // Optional Function
    func viewWillAppear() {
        
    }

}
