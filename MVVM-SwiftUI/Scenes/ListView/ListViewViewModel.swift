//
//  ListViewViewModel.swift
//  MVVM-SwiftUI
//
//  Created by Anantachai Kulson on 17/10/2563 BE.
//

import Foundation
import Combine

protocol ListViewViewModelInputs {
    
}

protocol ListViewViewModelOutputs {
    
}

protocol ListViewViewModelCoordinates {
    
}

protocol ListViewViewModelParamType {
    var inputs: ListViewViewModelInputs { get }
    var outputs: ListViewViewModelOutputs { get }
    var coordinates: ListViewViewModelCoordinates { get }
}

class ListViewViewModel: ObservableObject, ListViewViewModelParamType, ListViewViewModelInputs, ListViewViewModelOutputs, ListViewViewModelCoordinates {
    
    public init() {
        
    }
    
    public var inputs: ListViewViewModelInputs { return self }
    public var outputs: ListViewViewModelOutputs { return self }
    public var coordinates: ListViewViewModelCoordinates { return self }
}
