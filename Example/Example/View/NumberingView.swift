//
//  NumberingView.swift
//  Example
//
//  Created by 김용우 on 2023/10/17.
//

import ControllerableViewModel

import SwiftUI

final class NumberingViewModel: ObservableObject {
    static var number: Int = 0
    
    let number: Int
    
    init() {
        self.number = Self.number
                        
        Self.number += 1
        
        print("init \(number)")
    }
    
    deinit {
        print("deinit \(number)")
    }
    
}

struct NumberingView: View, ControllerableView {
    
    var stateView: StateView = .init()
    
    @ObservedObject var viewModel: NumberingViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Number \(viewModel.number)")
            
            Button(action: {
                self.push(view: NumberingView(viewModel: .init()))
            }) {
                Text("push")
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
            
            Button(action: {
                self.dismiss()
            }) {
                Text("dismiss")
            }
            
            Button(action: {
                self.pop()
            }) {
                Text("pop")
            }
            
            Button(action: {
                self.popToRoot()
            }) {
                Text("pop to root")
            }
            
            Button(action: {
                self.popToRoot()
                self.push(view: NumberingView(viewModel: .init()))
                self.push(view: NumberingView(viewModel: .init()))
            }) {
                Text("reStacks")
            }
            
            Button(action: {
                let alertItem = AlertItem(
                    title: "SwiftUI 로 구현된 Alert 예제",
                    message: "UIKit 으로도 구현가능\n여기는 View Number \(viewModel.number)",
                    completion: {
                        print("얼럿 Completion")
                    }
                )
                let view = CustomAlert(stateView: .init(), item: alertItem)
                self.presentAlert(view: view)
            }) {
                Text("alert")
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
