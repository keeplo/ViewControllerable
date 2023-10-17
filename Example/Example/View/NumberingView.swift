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
            Button(action: {
                viewModel.dismiss()
            }) {
                Text("SecondView: dismiss")
            }
            
            Button(action: {
                viewModel.pop()
            }) {
                Text("SecondView: pop")
            }
            
            if viewModel.number == 1 {
                Button(action: {
                    viewModel.popToRoot()
                }) {
                    Text("FirstView: Changable Modal")
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
