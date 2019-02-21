//
//  UIGenerator.swift
//  IOS_UIGenerator
//
//  Created by hackeru on 21/02/2019.
//  Copyright © 2019 hackeru. All rights reserved.
//

import UIKit

class UIGenerator {
    private var _view: UIView
    private var _orientation: Orientation = .Vertical
    private var _pos: CGFloat = 0
    private var _margin: CGFloat = 5
    private var buttonDelegates:[(UIButton)->Void] = []
    
    init(view: UIView) {
        _view = view
    }
    
    public func addMargin(margin: CGFloat){
        _pos += margin
    }
    
    public func addLabel(text: String) -> UILabel{
        let label = UILabel(frame: CGRect(x: _margin, y: _pos + _margin, width: _view.frame.width - _margin * 2, height: 30))
        label.text = text
        _view.addSubview(label)
        _pos += 30 + _margin
        return label
    }
    
    public func addTextField(placeHolder: String) -> UITextField{
        let textField = UITextField(frame: CGRect(x: _margin, y: _pos + _margin, width: _view.frame.width - _margin * 2, height: 30))
        textField.placeholder = placeHolder
        textField.borderStyle = .roundedRect
        _view.addSubview(textField)
        _pos += 30 + _margin
        return textField
    }
    
    public func addButton(title: String, buttonDelegate: @escaping (UIButton)->Void) -> UIButton{
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.frame = CGRect(x: _margin, y: _pos + _margin, width: _view.frame.width - _margin * 2, height: 30)
        _pos += 30 + _margin
        buttonDelegates.append(buttonDelegate)
        _view.addSubview(button)
        button.addTarget(self, action: #selector(handleClick(sender:)), for: .touchUpInside)
        button.tag = buttonDelegates.count - 1
        return button
    }
    
    
    
    @objc func handleClick(sender: UIButton){
        buttonDelegates[sender.tag](sender)
    }
}



enum Orientation{
    case Horizontal
    case Vertical
}


