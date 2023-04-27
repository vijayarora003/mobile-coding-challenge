//
//  BaseViewController.swift
//  Assignment
//
//  Created by Vijay Arora on 27/04/23.
//  Copyright © 2023 Vijay Arora. All rights reserved.
//

import UIKit

//--- To enable BaseviewController to be instantiable From storyboard id -----
protocol InstantiableFromStoryboard {
    static var storyBoardId: String { get }
    static var storyBoardName: String{ get }
    static func instantiateFromStoryBoard() -> Self//-----optional func
}

extension InstantiableFromStoryboard {
    static func instantiateFromStoryBoard() -> Self {
        let storyBoard = UIStoryboard.init(name: storyBoardName, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: storyBoardId)
        return vc as! Self
    }
}

typealias BaseViewController = BaseViewControllerClass & InstantiableFromStoryboard

class BaseViewControllerClass: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setBackButton() {
        let button = UIButton(type: .custom)
        button.setTitleColor(.textColor, for: .normal)
        button.setTitle(StringConstants.back, for: .normal)
        button.titleLabel?.font = UIFont.bold(size: 17)
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backButtonAction(_ :)), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    @objc func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func push(_ controller: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(controller, animated: animated)
    }
    
}
