//
//  CustomAlertView.swift
//  Example
//
//  Created by 김용우 on 2023/10/18.
//

import ControllerableViewModel

import SwiftUI

final class CustomeAlertViewModel: NavigationableViewModel {
    
    struct Item {
        let title: String
        let message: String
        let completion: () -> Void
    }
    
    let item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    var title: String { item.title }
    var message: String { item.message }
    var completion: () -> Void { return item.completion }
}

struct CustomAlert: ControllerableView {
    
    @ObservedObject var viewModel: CustomeAlertViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.6)
                .ignoresSafeArea(.all)
            VStack(alignment: .center, spacing: 0) {
                Spacer()
                Text(viewModel.title)
                Spacer()
                    .frame(height: 11)
                Text(viewModel.message)
                    .foregroundColor(.gray)
                Spacer()
                Divider()
                    .padding(0)
                Spacer()
                Button(
                    action: {
                        viewModel.dismiss()
                        viewModel.completion()
                    }, label: {
                        HStack {
                            Spacer()
                            Text("확인")
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                )
                Spacer()
            }
            .frame(
                width: 268.7,
                height: 149.7
            )
            .background(.white)
            .cornerRadius(4.3)
            .shadow(color: .black.opacity(0.16), radius: 8.6, x: 0, y: 2)
        }
    }
    
}

