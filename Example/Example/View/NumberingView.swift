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
            
            Button(action: {
                let viewModel = CustomeAlertViewModel(
                    item: .init(
                        title: "SwiftUI 로 구현된 Alert 예제",
                        message: "UIKit 으로도 구현가능\n여기는 View Number \(viewModel.number)",
                        completion: {
                            print("얼럿 Completion")
                        }
                    )
                )
                let view = CustomAlert(viewModel: viewModel)
                viewModel.alert(view: view)
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
