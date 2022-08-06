//
//  ViewController.swift
//  POCLeftMenu
//
//  Created by Yash on 06/08/22.
//

import UIKit

class ViewController: UIViewController {

	var menu: YMenu? = nil
	override func viewDidLoad() {
		super.viewDidLoad()
		menu = YMenu.init(delegate: self)
	}

	@IBAction func onTappedMenuOpenButton(_ sender: Any) {
		menu?.openMenu()
	}
	
}

extension ViewController: MenuDelegate {
	var controller: UIViewController? {
		get {
			self
		}
	}
}

