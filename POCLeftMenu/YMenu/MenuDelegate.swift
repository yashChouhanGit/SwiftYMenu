//
//  MenuDelegate.swift
//  POCLeftMenu
//
//  Created by Yash on 06/08/22.
//

import UIKit

protocol MenuDelegate where Self: ViewController {
	var controller: UIViewController? { get }
}
