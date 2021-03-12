//
//  OSlide9TagView.swift
//  Nursing
//
//  Created by Andrey Chernyshev on 24.01.2021.
//

import UIKit

final class OSlideGoalsTagView: CircleView {
    lazy var label = makeLabel()
    
    var isSelected = false {
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
private extension OSlideGoalsTagView {
    func update() {
        backgroundColor = isSelected ? UIColor(integralRed: 145, green: 200, blue: 195) : UIColor(integralRed: 240, green: 243, blue: 245)
        label.textColor = isSelected ? UIColor.white : UIColor(integralRed: 31, green: 31, blue: 31)
    }
}

// MARK: Make constraints
private extension OSlideGoalsTagView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

// MARK: Lazy initialization
private extension OSlideGoalsTagView {
    func makeLabel() -> UILabel {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = Fonts.SFProRounded.semiBold(size: 17.scale)
        view.textColor = UIColor.black
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
