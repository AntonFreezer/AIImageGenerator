//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    var closure: (() -> Void)?
    
    override func loadView() {
        closure = { print("Clicked again!") }
        
        let view = UIView()
        view.backgroundColor = .black
        
        let searchBar = UISearchBar()
        searchBar.frame = .init(x: 50, y: 50, width: 300, height: 50)
        searchBar.backgroundImage = UIImage()
        
        let button = UIButton(type: .custom, primaryAction: UIAction(image: .init(systemName: "arrow.up"), handler: { _ in
            self.closure?()
        }))
        
        searchBar.searchTextField.leftView = .none
        searchBar.searchTextField.rightView = button
        searchBar.searchTextField.rightViewMode = .always
        
        searchBar.searchTextField.backgroundColor = .black
        searchBar.searchTextField.layer.borderColor = UIColor.white.cgColor
        searchBar.searchTextField.layer.borderWidth = 2.0
        searchBar.searchTextField.layer.cornerRadius = 10.0
        
        
        view.addSubview(searchBar)
        self.view = view
    }
    
}

PlaygroundPage.current.liveView = MyViewController()
