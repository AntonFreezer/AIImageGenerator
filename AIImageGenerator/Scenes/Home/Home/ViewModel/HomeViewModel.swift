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
        case searchPromptEntered(prompt: String?)
        case retryPromptEntered
    }
    
    enum Output {
        case didReceiveETA(seconds: Int)
        case didFetchImage
        case didReceiveError(error: Error)
    }
    
    func transform(input: AnyPublisher<Input, Never>) -> AnyPublisher<Output, Never> {
        input.sink { [unowned self] event in
            switch event {
            case .viewDidLoad:
                break
            case .searchPromptEntered(let prompt):
                Task { await mockImageRequest() }
            case .retryPromptEntered:
                Task { await mockImageRequest() }
            }
        }.store(in: &cancellables)
        
        return output
    }
    
}

//MARK: - Network
private extension HomeViewModel {
    func mockImageRequest() async {
        
        let mockImage = AiImage.mockImage
        var mockETA = mockImage.eta ?? 0
        guard let mockURL = mockImage.output.first?.absoluteString,
              mockImage.status == "success"
        else {
            subject.send(.didReceiveError(error: URLError(.badURL)))
            return
        }
        
        var timerSubscription: Cancellable?
        timerSubscription = Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                self?.subject.send(.didReceiveETA(seconds: mockETA))
                decrement()
            }
        
        func decrement() {
            if mockETA > 0 {
                mockETA -= 1
            } else {
                timerSubscription?.cancel()
                goToPromptResult()
            }
        }
        
        func goToPromptResult() {
                self.subject.send(.didFetchImage)
                if let router = self.router as? (any HomeRouter) {
                    router.process(route: .promptResultScreen(imageURL: mockURL))
                }
            
        }
        
    }
}

