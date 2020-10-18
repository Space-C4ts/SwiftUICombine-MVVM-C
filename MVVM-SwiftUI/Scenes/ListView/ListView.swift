//
//  ListView.swift
//  MVVM-SwiftUI
//
//  Created by Anantachai Kulson on 17/10/2563 BE.
//

import Foundation
import SwiftUI
import Combine

struct ListView: View {
    @ObservedObject var viewModel: ListViewViewModel = ListViewViewModel()
    
    @State var array = [String]()
    var cancellables: Set<AnyCancellable> = []
    
    var body: some View {
        NavigationView {
            List(self.array,id: \.self)
            { item in
                Text("\(item)")
            }.onAppear(perform: {
                bindViewModel()
            })
            .navigationBarTitle("MVVM-C Example")
        }
    }
    
    func bindViewModel() {
        
        var cancellables = self.cancellables
        
        viewModel
            .outputs
            .displayDataTigger
            .sink { datas in
                array = datas
            }.store(in: &cancellables)
        
        viewModel
            .inputs
            .getDataTrigger
            .send()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
