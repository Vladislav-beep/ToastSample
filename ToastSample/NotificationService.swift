//
//  NotificationService.swift
//  ToastSample
//
//  Created by Владислав Сизонов on 21.03.2023.
//

import UIKit

final class NotificationService {
    
    // MARK: Private
    
    private var window: UIWindow? {
        return UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)? .windows ?? [] }
            .first { $0.isKeyWindow }
    }

    // MARK: Public
    
    func showToast(message: String, icon: String) {
        let toastLbl = UILabel()
        toastLbl.text = message
        toastLbl.textAlignment = .center
        toastLbl.font = UIFont.systemFont(ofSize: 18)
        toastLbl.textColor = .black
        toastLbl.numberOfLines = 0
        toastLbl.translatesAutoresizingMaskIntoConstraints = false
        
        let textSize = toastLbl.intrinsicContentSize
        let toastWidth = UIScreen.main.bounds.width / 9 * 7
        let labelHeight = (textSize.width / toastWidth) * 50
        let adjustedHeight = max(labelHeight, 60)
        
        let backView = UIView()
        backView.backgroundColor = .systemTeal
        backView.layer.cornerRadius = 30
        backView.layer.shadowRadius = 4
        backView.layer.shadowOpacity = 0.4
        backView.layer.shadowOffset = CGSize(width: 0, height: 3)
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        window?.addSubview(backView)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: window?.safeAreaLayoutGuide.topAnchor ?? NSLayoutAnchor(), constant: 20),
            backView.centerXAnchor.constraint(equalTo: window?.centerXAnchor ?? NSLayoutXAxisAnchor()),
            backView.widthAnchor.constraint(equalToConstant: toastWidth),
            backView.heightAnchor.constraint(equalToConstant: adjustedHeight)
        ])
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: icon)
        imageView.layer.cornerRadius = 18
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        backView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            imageView.heightAnchor.constraint(equalToConstant: 36),
            imageView.widthAnchor.constraint(equalToConstant: 36)
        ])
        
        backView.addSubview(toastLbl)
        NSLayoutConstraint.activate([
            toastLbl.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            toastLbl.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 4),
            toastLbl.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -8),
        ])
        
        UIView.animate(withDuration: 3.0, animations: {
            backView.alpha = 0
        }) { (_) in
            backView.removeFromSuperview()
        }
    }
}
