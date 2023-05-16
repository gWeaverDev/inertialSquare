//
//  ViewController.swift
//  inertialSquare
//
//  Created by George Weaver on 16.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let inertialView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 10
        view.frame = CGRect(origin: CGPoint(x: 50, y: 100), size: CGSize(width: 100, height: 100))
        return view
    }()

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchPosition = touch.location(in: view)
            
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5) {
                self.inertialView.center = touchPosition
                self.inertialView.transform = CGAffineTransform(rotationAngle: .pi / 4)
            }
            
            UIView.animate(withDuration: 0.3) {
                self.inertialView.transform = CGAffineTransform(rotationAngle: .pi * 4)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    
    private func setupAppearance() {
        view.backgroundColor = .white
        view.addSubview(inertialView)
    }
}

