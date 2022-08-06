//
//  LeftMenuViewController.swift
//  POCLeftMenu
//
//  Created by Yash on 06/08/22.
//

import UIKit

class LeftMenuViewController: UIViewController {

	@IBOutlet fileprivate weak var menuCloseButton: UIButton?
	@IBOutlet fileprivate weak var dimBackgroundView: UIView?
	@IBOutlet fileprivate weak var menuMainView: UIView?
	@IBOutlet fileprivate weak var leading: NSLayoutConstraint!
	
	var delegate :MenuCloseDelegate? =  nil
	
    override func viewDidLoad() {
        super.viewDidLoad()

    }
	
	@IBAction private func onTappedMenuCloseButton(_ sender: UIButton) {
		delegate?.closeMenuFromMenuClass()
	}
}

class YMenu {
	
	private(set) var menuInitDelegate: MenuDelegate? = nil
	private var menuVC: LeftMenuViewController? = nil
	
	init(delegate: MenuDelegate) {
		self.menuInitDelegate = delegate
	}
		
}

extension YMenu {
	  
	private func addOnCildeViewController()  {
		guard let parentController = menuInitDelegate?.controller else { return  }
		menuVC = LeftMenuViewController()
		menuVC?.delegate = self
		guard let menuVC = menuVC else { return  }
		parentController.addChild(menuVC)
		menuVC.view.frame = parentController.view.bounds
		menuVC.dimBackgroundView?.backgroundColor = .clear
		menuVC.menuMainView?.frame.origin.x = -parentController.view.frame.size.width
		menuVC.view.frame = parentController.view.bounds
		parentController.view.addSubview(menuVC.view)
		menuVC.didMove(toParent: parentController)
	}
	
	func openMenu() {
		addOnCildeViewController()
		guard let menuVC = menuVC else { return  }
		UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
			menuVC.dimBackgroundView?.backgroundColor = UIColor.black.withAlphaComponent(0.8)
			menuVC.menuMainView?.frame.origin.x = 0
		}, completion: { _ in
			
		})
	}
	
	func closeMenu() {
		guard let parentController = menuInitDelegate?.controller ,
			  let menuVC = menuVC else { return  }
		UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
			menuVC.menuMainView?.frame.origin.x = -parentController.view.frame.size.width
			menuVC.dimBackgroundView?.backgroundColor = UIColor.clear
		}, completion: { _ in
			menuVC.willMove(toParent: nil)
			menuVC.view.removeFromSuperview()
			menuVC.removeFromParent()
		})
	}
}
