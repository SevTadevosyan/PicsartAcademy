//
//  MyTabBarController.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 13.06.22.
//

import UIKit

class MyTabBarController: UITabBarController {
    
    let sb = UIStoryboard(name: "Main", bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem?.tintColor = UIColor(named: "Pink")
        tabBarItem.badgeColor = .systemPink
        let homeVC = sb.instantiateViewController(withIdentifier: "HomeViewController")
        let sandboxVC = sb.instantiateViewController(withIdentifier: "SandboxViewController")
        let levelUpVC = sb.instantiateViewController(withIdentifier: "LevelUpViewController")
        let crlVC = sb.instantiateViewController(withIdentifier: "CodeRepublicLabViewController")
        let tracksVC = sb.instantiateViewController(withIdentifier: "CareerTracksViewController")
        let staffVC = sb.instantiateViewController(withIdentifier: "StaffViewController")
        let settingsVC = sb.instantiateViewController(withIdentifier: "SettingsViewController")
        self.viewControllers = [homeVC, sandboxVC, levelUpVC, crlVC, tracksVC, staffVC, settingsVC]
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        print("done")
        tabBarController.selectedViewController?.scrollToTop()
        
    }
}

extension UIViewController {
    func scrollToTop() {
        func scrollToTop(view: UIView?) {
            guard let view = view else { return }

            switch view {
            case let scrollView as UIScrollView:
                if scrollView.scrollsToTop == true {
                    scrollView.setContentOffset(CGPoint(x: 0.0, y: -scrollView.contentInset.top), animated: true)
                    return
                }
            default:
                break
            }

            for subView in view.subviews {
                scrollToTop(view: subView)
            }
        }

        scrollToTop(view: view)
    }

    var isScrolledToTop: Bool {
        if self is UITableViewController {
            return (self as! UITableViewController).tableView.contentOffset.y == 0
        }
        for subView in view.subviews {
            if let scrollView = subView as? UIScrollView {
                return (scrollView.contentOffset.y == 0)
            }
        }
        return true
    }
}

//extension MyTabBarController: SideMenuViewControllerDelegate {
//    func rowSelected(at index: Int) {
//        tabBarController?.selectedIndex = index
//    }
//    
//    
//}
