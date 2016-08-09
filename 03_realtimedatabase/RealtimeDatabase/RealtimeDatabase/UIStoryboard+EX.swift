//
//  UIStoryboard+EX.swift
//  RealtimeDatabase
//
//  Created by Kushida　Eiji on 2016/08/07.
//  Copyright © 2016年 Kushida　Eiji. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static func getViewController<T: UIViewController>(storyboardName: String, identifier: String) -> T? {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewControllerWithIdentifier(identifier) as? T
    }
}
