//
//  TabItemView.swift
//  Nursing
//
//  Created by Andrey Chernyshev on 17.01.2021.
//

import UIKit

final class TabItemView: UIView {
    enum State {
        case selected, deselected
    }
    
    lazy var colorView = makeColorView()
    lazy var imageView = makeImageView()
    lazy var label = makeLabel()
    
    var state = State.deselected {
        didSet {
            update()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private
private extension TabItemView {
    func update() {
        let color: UIColor
        
        switch state {
        case .selected:
            color = UIColor(integralRed: 112, green: 184, blue: 177)
        case .deselected:
            color = UIColor(integralRed: 112, green: 184, blue: 177, alpha: 0.3)
        }
        
        label.textColor = color
        
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = color
    }
}

// MARK: Make constraints
private extension TabItemView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            colorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            colorView.topAnchor.constraint(equalTo: topAnchor),
            colorView.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 2.scale)
        ])
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 24.scale),
            imageView.heightAnchor.constraint(equalToConstant: 24.scale),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8.scale)
        ])
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 3.scale)
        ])
    }
}

// MARK: Lazy initialization
private extension TabItemView {
    func makeColorView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(integralRed: 233, green: 215, blue: 219)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeLabel() -> UILabel {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
