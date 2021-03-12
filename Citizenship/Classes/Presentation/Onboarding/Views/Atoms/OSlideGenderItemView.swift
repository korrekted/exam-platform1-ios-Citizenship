//
//  OSlide2GenderView.swift
//  Nursing
//
//  Created by Andrey Chernyshev on 24.01.2021.
//

import UIKit

final class OSlideGenderItemView: UIView {
    lazy var imageView = makeImageView()
    
    var isSelected = false {
        didSet {
            updateColor()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeConstraints()
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private
private extension OSlideGenderItemView {
    func initialize() {
        backgroundColor = UIColor.white
        layer.cornerRadius = 20.scale
        layer.borderWidth = 1.scale
        layer.borderColor = UIColor(integralRed: 218, green: 218, blue: 218).cgColor
    }
    
    func updateColor() {
        layer.borderWidth = isSelected ? 3.scale : 1.scale
        layer.borderColor = isSelected ? UIColor(integralRed: 145, green: 200, blue: 195).cgColor : UIColor(integralRed: 218, green: 218, blue: 218).cgColor
    }
}

// MARK: Make constraints
private extension OSlideGenderItemView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: Lazy initialization
private extension OSlideGenderItemView {
    func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
