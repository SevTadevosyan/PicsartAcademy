//
//  StaffViewController.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 15.06.22.
//

import UIKit
import MarqueeLabel
import SideMenu

class StaffViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var enrollNowButton: UIButton!
    @IBOutlet weak var runningLabel: MarqueeLabel!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var popupView: UIView!
    @IBOutlet weak var appearanceSegment: UISegmentedControl!
    @IBOutlet weak var languageSegment: UISegmentedControl!

    
    var users: [User] = []
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let l = AppDelegate.index
        languageSegment.selectedSegmentIndex = l
        callAllFunctions()
    }
    var a: Int = 10
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(changeIndex), name: NSNotification.Name("SelectedIndex"), object: nil)
        if Bundle.main.preferredLocalizations.first == "hy" {
            users = Constants.shared.armenianUsers
            runningLabel.text = "Ճանաչիր Փիքսարթ Ակադեմիայի աշխատակազմին         "
        } else if Bundle.main.preferredLocalizations.first == "en" {
            users = Constants.shared.englishUsers
            runningLabel.text = "Get to know Picsart Academy Staff!       "
        }
        
        tabBarController?.delegate = self

    }
    
    func callAllFunctions() {
        collectionView.register(UINib(nibName: "UserCell", bundle: nil), forCellWithReuseIdentifier: "UserCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        configureUI()
        configureMenu()
    }
    func configureMenu() {
        menu = SideMenuNavigationController(rootViewController: SideMenuViewController())
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    @objc func changeIndex(notification: NSNotification) {
        if let i = notification.object as? Int {
            tabBarController?.selectedIndex = i
        }
    }
    
    func configureUI() {
        blurView.bounds = self.view.bounds
        if enrollNowButton.isEnabled == false {
            enrollNowButton.layer.opacity = 0.3
        }
    }
    
    @IBAction func changeLanguage(_ sender: UISegmentedControl) {
        ReusableFunctions.shared.changeLanguageSegmentValue(language: languageSegment)
    }
    @IBAction func showSideMenu(_ sender: UIButton) {
        present(menu!, animated: true)
    }
    
    @IBAction func showSettingsMenu(_ sender: UIButton) {
        ReusableFunctions.shared.setAppearanceSegmentValue(self, appearance: appearanceSegment)
        ReusableFunctions.shared.animateScaleIn(self.view, desiredView: blurView)
        ReusableFunctions.shared.animateScaleIn(self.view, desiredView: popupView)
    }
    
    @IBAction func hideSettingsMenu(_ sender: UIButton) {
        ReusableFunctions.shared.animateScaleOut(desiredView: blurView)
        ReusableFunctions.shared.animateScaleOut(desiredView: popupView)
    }
    
    
    @IBAction func changeAppearance(_ sender: UISegmentedControl) {
        ReusableFunctions.shared.changeAppearanceSegmentValue(appearance: appearanceSegment)

    }
    @IBAction func goToHome(_ sender: UITapGestureRecognizer) {
        tabBarController?.selectedIndex = 0
        if let vc = tabBarController?.selectedViewController as? HomeViewController {
            vc.scrollView.setContentOffset(.zero, animated: false)
        }
    }
    @IBAction func openURL(_ sender: UIButton) {
        ReusableFunctions.shared.OpenUrl(with: Constants.shared.enrollUrl)
    }
    
    @IBAction func openTelegram(_ sender: UIButton) {
        ReusableFunctions.shared.OpenUrl(with: Constants.shared.picsartTelegram)
    }
    
    @IBAction func openYouTube(_ sender: UIButton) {
        ReusableFunctions.shared.OpenUrl(with: Constants.shared.picsartYoutube)
    }
    
    @IBAction func openLinkedIn(_ sender: UIButton) {
        ReusableFunctions.shared.OpenUrl(with: Constants.shared.picsartLinkedin)
    }
    
    @IBAction func openInstagram(_ sender: UIButton) {
        ReusableFunctions.shared.OpenUrl(with: Constants.shared.picsartInstagram)
    }
    
    @IBAction func callToPicsart1(_ sender: UIButton) {
        ReusableFunctions.shared.OpenUrl(with: Constants.shared.phoneNumberFirst)
    }
    
    @IBAction func callToPicsart2(_ sender: UIButton) {
        ReusableFunctions.shared.OpenUrl(with: Constants.shared.phoneNumberSecond)
    }
    
}

extension StaffViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 20, height: 370)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}

extension StaffViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! UserCell
        let user = users[indexPath.row]
        cell.configure(with: user)
        return cell
    }
    
    
}
extension StaffViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        return true
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.scrollView.scrollsToTop = true
        self.scrollToTop()
    }
}
