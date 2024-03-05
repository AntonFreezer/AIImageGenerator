//
//  HomeViewModel.swift
//  iWeather
//
//  Created by Anton Kholodkov on 27.02.2024.
//

import UIKit
import Combine

final class HomeViewModel: NSObject, IOViewModelType {
    
    //MARK: - Properties
    typealias Router = Routable
    private(set) var router: any Router
    
    private let subject = PassthroughSubject<Output, Never>()
    var output: AnyPublisher<Output, Never> {
        return subject.eraseToAnyPublisher()
    }
    
    var cancellables = Set<AnyCancellable>()
    
    //MARK: - Setup && Lifecycle
    init(router: any Router) {
        self.router = router
    }
    
    //MARK: - IO
    enum Input {
        case viewDidLoad
    }
    
    enum Output {
        case customOutput
    }
    
    func transform(input: AnyPublisher<Input, Never>) -> AnyPublisher<Output, Never> {
        input.sink { [unowned self] event in
            switch event {
            case .viewDidLoad:
                break
            }
        }.store(in: &cancellables)
        
        return output
    }
    
}

