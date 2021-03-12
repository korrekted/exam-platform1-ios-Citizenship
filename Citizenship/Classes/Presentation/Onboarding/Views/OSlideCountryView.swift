//
//  OSlideCountryView.swift
//  Citizenship
//
//  Created by Andrey Chernyshev on 11.03.2021.
//

import UIKit

final class OSlideCountryView: OSlideView {
    lazy var skipButton = makeSkipButton()
    lazy var titleLabel = makeTitleLabel()
    lazy var pickerView = makePickerView()
    lazy var button = makeButton()
    
    private lazy var countries = [
        "Albania",
        "Algeria",
        "Angola",
        "Argentina",
        "Australia",
        "Austria",
        "Belgium",
        "Bolivia",
        "Brazil",
        "Bulgaria",
        "Cameroon",
        "Canada",
        "Chile",
        "China",
        "Colombia",
        "Cuba",
        "Czech Republic",
        "Democratic Republic of the Congo",
        "Denmark",
        "Dominican Republic",
        "Ecuador",
        "Egypt",
        "Estonia",
        "Ethiopia",
        "Finland",
        "France",
        "Germany",
        "Ghana",
        "Greece",
        "Guatemala",
        "Haitti",
        "Hungary",
        "India",
        "Iraq",
        "Ireland",
        "Israel",
        "Italy",
        "Ivory Coast",
        "Japan",
        "Jordan",
        "Kenya",
        "Latvia",
        "Lebanon",
        "Lithuania",
        "Luxembourg",
        "Madagascar",
        "Mexico",
        "Morocco",
        "Mozambique",
        "Netherlands",
        "New Zeland",
        "Nigeria",
        "Norway",
        "Peru",
        "Poland",
        "Portugal",
        "Romania",
        "Saudi Arabia",
        "Somalia",
        "South Africa",
        "Spain",
        "Sudan",
        "Sweden",
        "Switzerland",
        "Syria",
        "Tanzania",
        "Tunisia",
        "Turkey",
        "U.S.S.R. (Former)",
        "Uganda",
        "United Arab Emirates",
        "United Kingdom",
        "United States",
        "Venezuela",
        "Yemen",
        "Yugoslavia (Former)",
        "Other Europe",
        "Other Asia",
        "Other South America",
        "Other Africa"
    ]
    
    override init(step: OnboardingView.Step) {
        super.init(step: step)
        
        makeConstraints()
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UIPickerViewDataSource
extension OSlideCountryView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        countries.count
    }
}

// MARK: UIPickerViewDelegate
extension OSlideCountryView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = view as? UILabel
        
        if label == nil {
            label = UILabel()
            label?.backgroundColor = UIColor.clear
        }
        
        let attrs = TextAttributes()
            .textColor(UIColor(integralRed: 145, green: 200, blue: 195))
            .font(Fonts.SFProRounded.bold(size: 32.scale))
        
        label?.attributedText = countries[row].attributed(with: attrs)
        
        label?.sizeToFit()
        
        return label!
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        48.scale
    }
}

// MARK: Private
private extension OSlideCountryView {
    func initialize() {
        pickerView.reloadAllComponents()
        
        guard let us = countries.firstIndex(of: "United States") else {
            return
        }
        
        pickerView.selectRow(us, inComponent: 0, animated: false)
    }
}

// MARK: Make constraints
private extension OSlideCountryView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            skipButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26.scale),
            skipButton.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 49.scale : 20.scale)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17.scale),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17.scale),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 134.scale : 70.scale)
        ])
        
        NSLayoutConstraint.activate([
            pickerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30.scale),
            pickerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30.scale),
            pickerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            pickerView.heightAnchor.constraint(equalToConstant: 264.scale)
        ])
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26.scale),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26.scale),
            button.heightAnchor.constraint(equalToConstant: 60.scale),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: ScreenSize.isIphoneXFamily ? -70.scale : -30.scale)
        ])
    }
}

// MARK: Lazy initialization
private extension OSlideCountryView {
    func makeSkipButton() -> UIButton {
        let attrs = TextAttributes()
            .textColor(UIColor.black)
            .font(Fonts.SFProRounded.semiBold(size: 17.scale))
            .letterSpacing(-0.6.scale)
            .lineHeight(25.scale)
        
        let view = UIButton()
        view.setAttributedTitle("Onboarding.Skip".localized.attributed(with: attrs), for: .normal)
        view.addTarget(self, action: #selector(onNext), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeTitleLabel() -> UILabel {
        let attrs = TextAttributes()
            .textColor(UIColor.black)
            .font(Fonts.SFProRounded.bold(size: 27.scale))
            .lineHeight(32.scale)
            .textAlignment(.center)
        
        let view = UILabel()
        view.numberOfLines = 0
        view.attributedText = "Onboarding.SlideCountry.Title".localized.attributed(with: attrs)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makePickerView() -> UIPickerView {
        let view = PaddingPickerView()
        view.padding = UIEdgeInsets(top: 0, left: 200.scale, bottom: 0, right: 200.scale)
        view.backgroundColor = UIColor.clear
        view.dataSource = self
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeButton() -> UIButton {
        let attrs = TextAttributes()
            .textColor(UIColor.white)
            .font(Fonts.SFProRounded.semiBold(size: 20.scale))
            .lineHeight(23.scale)
            .textAlignment(.center)
        
        let view = UIButton()
        view.backgroundColor = UIColor(integralRed: 145, green: 200, blue: 195)
        view.layer.cornerRadius = 16.scale
        view.setAttributedTitle("Onboarding.Proceed".localized.attributed(with: attrs), for: .normal)
        view.addTarget(self, action: #selector(onNext), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
