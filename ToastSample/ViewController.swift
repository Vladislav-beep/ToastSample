//
//  ViewController.swift
//  ToastSample
//
//  Created by Владислав Сизонов on 21.03.2023.
//

import UIKit

class ToastViewController: UIViewController {
    
    private let toastButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show toast", for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        toastButton.addTarget(self, action: #selector(showToast), for: .touchUpInside)
        
        view.addSubview(toastButton)
        NSLayoutConstraint.activate([
            toastButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            toastButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            toastButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            toastButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc func showToast() {
        NotificationService().showToast(message: "Toast is shown", icon: "toast")
    }
}
