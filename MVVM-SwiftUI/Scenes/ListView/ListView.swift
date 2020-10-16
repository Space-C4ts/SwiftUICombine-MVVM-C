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
    
    var body: some View {
        Text("ListView")
            .padding()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
