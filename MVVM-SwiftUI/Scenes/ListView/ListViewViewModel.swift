//
//  ListViewViewModel.swift
//  MVVM-SwiftUI
//
//  Created by Anantachai Kulson on 17/10/2563 BE.
//

import Foundation
import Combine

protocol ListViewViewModelInputs {
    var getDataTrigger: PassthroughSubject<Void, Never> { get }
}

protocol ListViewViewModelOutputs {
    var displayDataTigger: PassthroughSubject<[String], Never> { get }
}

protocol ListViewViewModelCoordinates {
    
}

protocol ListViewViewModelParamType {
    var inputs: ListViewViewModelInputs { get }
    var outputs: ListViewViewModelOutputs { get }
    var coordinates: ListViewViewModelCoordinates { get }
}

class ListViewViewModel: ObservableObject, ListViewViewModelParamType, ListViewViewModelInputs, ListViewViewModelOutputs, ListViewViewModelCoordinates {
    
    @Published var array = [String]()
    private var cancellables: Set<AnyCancellable> = []
    
    public init() {
        getDataTrigger
            .map{ ["item1", "item2", "item3", "item4", "item5"] }
            .sink { [unowned self] datas in
                array = datas
            }.store(in: &cancellables)
    }
    
    //MARK: Input
    
    var getDataTrigger = PassthroughSubject<Void, Never>()
    var displayDataTigger = PassthroughSubject<[String], Never>()
    
    public var inputs: ListViewViewModelInputs { return self }
    public var outputs: ListViewViewModelOutputs { return self }
    public var coordinates: ListViewViewModelCoordinates { return self }
}
