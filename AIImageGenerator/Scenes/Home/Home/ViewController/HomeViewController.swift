//
//  HomeViewController.swift
//  iWeather
//
//  Created by Anton Kholodkov on 27.02.2024.
//

import UIKit
import Combine

final class HomeViewController: GenericViewController<HomeView> {
    
    //MARK: - Properties
    
    
    //MARK: - IO
    private let viewModel: HomeViewModel
    
    private var output: AnyPublisher<HomeViewModel.Input, Never> {
        return subject.eraseToAnyPublisher()
    }
    private let subject = PassthroughSubject<HomeViewModel.Input, Never>()
    
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - Lifecycle & Setup
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        bindViewModel()
        
        subject.send(.viewDidLoad)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showLoading()
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupView() {
        
    }
    
    private func bindViewModel() {
        viewModel.transform(input: output)
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] event in
                self.hideLoading()
                
                switch event {
                case .customOutput:
                    break
//                case .didReceiveError(let error):
//                    self.showError(error)
                }
            }.store(in: &cancellables)
    }
    
    private func showError(_ error: Error) {
        self.showError(
            String(localized: "Error Description"),
            message: error.localizedDescription,
            actionTitle: String(localized: "Refresh"),
            action: { [weak self] stub in
                stub.removeFromSuperview()
                self?.showLoading()
                self?.subject.send(.viewDidLoad)
            }
        )
    }
    
}

