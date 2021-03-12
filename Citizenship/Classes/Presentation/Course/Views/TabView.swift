//
//  TabView.swift
//  Nursing
//
//  Created by Andrey Chernyshev on 17.01.2021.
//

import UIKit

final class TabView: UIView {
    enum Tab {
        case study, stats
    }
    
    lazy var studyItem = makeItem(image: "Course.Tab.Study", title: "Course.Tab.Study")
    lazy var statsItem = makeItem(image: "Course.Tab.Stats", title: "Course.Tab.Stats")
    
    var selectedTab = Tab.study {
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
private extension TabView {
    func update() {
        [
            studyItem,
            statsItem
        ]
        .forEach {
            $0.state = .deselected
        }
        
        switch selectedTab {
        case .study:
            studyItem.state = .selected
        case .stats:
            statsItem.state = .selected
        }
    }
}

// MARK: Make constraints
private extension TabView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            studyItem.leadingAnchor.constraint(equalTo: leadingAnchor),
            studyItem.bottomAnchor.constraint(equalTo: bottomAnchor),
            studyItem.topAnchor.constraint(equalTo: topAnchor),
            studyItem.widthAnchor.constraint(equalTo: statsItem.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            statsItem.leadingAnchor.constraint(equalTo: studyItem.trailingAnchor, constant: 2.scale),
            statsItem.bottomAnchor.constraint(equalTo: bottomAnchor),
            statsItem.topAnchor.constraint(equalTo: topAnchor),
            statsItem.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

// MARK: Lazy initialization
private extension TabView {
    func makeItem(image: String, title: String) -> TabItemView {
        let attrs = TextAttributes()
            .font(Fonts.SFProRounded.semiBold(size: 10.scale))
            .textColor(UIColor(integralRed: 112, green: 184, blue: 177))
            .letterSpacing(-0.24.scale)
            .lineHeight(11.93.scale)
            .textAlignment(.center)
        
        let view = TabItemView()
        view.backgroundColor = UIColor.white
        view.imageView.image = UIImage(named: image)
        view.label.attributedText = title.localized.attributed(with: attrs)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
