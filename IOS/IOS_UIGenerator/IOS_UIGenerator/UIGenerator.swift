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
    private var _rowHeight: CGFloat = 30
    private var _colWidth: CGFloat = 100
    private var buttonDelegates:[(UIButton)->Void] = []
    
    init(view: UIView) {
        _view = view
    }
    
    public func addMargin(margin: CGFloat){
        _pos += margin
    }
    
    public func getFrame()->CGRect{
        var frame: CGRect!
        if _orientation == .Vertical{
            frame = CGRect(x: _margin, y: _pos + _margin, width: _view.frame.width - _margin * 2, height: _rowHeight)
            _pos += _rowHeight + _margin
        }else{
            //frame = CGRect(x: _pos + _margin, y: _margin, width: _colWidth, height: _view.frame.height - _margin * 2)
            let howManyViews: CGFloat = CGFloat(_view.subviews.count + 1)
            _pos = 0
            let vWidth: CGFloat = (_view.frame.width - (howManyViews + 1) * _margin) / howManyViews
            for i in 0..<_view.subviews.count{
                let v = _view.subviews[i]
                v.frame = CGRect(x: _pos + _margin, y: _margin, width: vWidth, height: _rowHeight)
                _pos += vWidth + _margin
            }
            //_pos += _colWidth + _margin
            return CGRect(x: _pos + _margin, y: _margin, width: vWidth, height: _rowHeight)
        }
        return frame
    }
    
    public func addLabel(text: String) -> UILabel{
        let label = UILabel(frame: getFrame())
        label.text = text
        _view.addSubview(label)
        return label
    }
    
    public func addTextField(placeHolder: String) -> UITextField{
        let textField = UITextField(frame: getFrame())
        textField.placeholder = placeHolder
        textField.borderStyle = .roundedRect
        _view.addSubview(textField)
        return textField
    }
    
    public func addButton(title: String, buttonDelegate: @escaping (UIButton)->Void) -> UIButton{
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.frame = getFrame()
        buttonDelegates.append(buttonDelegate)
        _view.addSubview(button)
        button.addTarget(self, action: #selector(handleClick(sender:)), for: .touchUpInside)
        button.tag = buttonDelegates.count - 1
        return button
    }
    
    public func addContainerView()->UIView{
        let view = UIView(frame: getFrame())
        _view.addSubview(view)
        return view
    }
    
    @objc func handleClick(sender: UIButton){
        buttonDelegates[sender.tag](sender)
    }
    
    public var colWidth: CGFloat{
        get{
            return _colWidth
        }
        set{
            if newValue >= 0 {
                _colWidth = newValue
            }
        }
    }
    
    public var rowHeight: CGFloat{
        get{
            return _rowHeight
        }
        set{
            if newValue >= 0 {
                _rowHeight = newValue
            }
        }
    }
    
    public var margin: CGFloat{
        get{
            return _margin
        }
        set{
            if newValue >= 0 {
                _margin = newValue
            }
        }
    }
    
    public var orientation: Orientation{
        get{
            return _orientation
        }
        set{
            _orientation = newValue
        }
    }
}



enum Orientation{
    case Horizontal
    case Vertical
}
