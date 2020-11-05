//
//  LetterPicker.swift
//  VK
//
//  Created by Арина Кривенко on 05.11.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import UIKit

protocol LetterPickerDelegate: class {
    func letterPicked(_ letter: String)
}

class LetterPicker: UIView {
    
    weak var delegate: LetterPickerDelegate?
    
    var letters: [String] = "абвгдеёжзийклмнопрстуфхцчшщэюя".map{ String($0) } {
        didSet {
            
        }
    }
    private var buttons: [UIButton] = []
    private var lastPressedButton: UIButton?
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setupButtons()
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panAction))
        
        addGestureRecognizer(pan)
    }
    
    private func setupButtons() {
        
        for letter in letters {
            let button = UIButton(type: .system)
            button.setTitle(letter.uppercased(), for: .normal)
            button.addTarget(self, action: #selector(letterTapped), for: .touchDown)
            buttons.append(button)
            stackView.addArrangedSubview(button)
            button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        }
    }
    
    @objc private func letterTapped(_ sender: UIButton) {
        guard lastPressedButton != sender else { return }
        lastPressedButton = sender
        let letter = sender.title(for: .normal) ?? ""
        delegate?.letterPicked(letter)
    }
    
    @objc private func panAction(_ recognizer: UIPanGestureRecognizer) {
        let anchorPoint = recognizer.location(in: self)
        let buttonHeight = bounds.height / CGFloat(buttons.count)
        let buttonIndex = Int(anchorPoint.y / buttonHeight)
        
        let button = buttons[buttonIndex]
        unhighlightButtons()
        button.isHighlighted = true
        letterTapped(button)
        
        switch recognizer.state {
        case .ended:
            unhighlightButtons()
        default:
            break
        }
    }

    private func unhighlightButtons() {
        buttons.forEach { $0.isHighlighted = false}
    }
}
