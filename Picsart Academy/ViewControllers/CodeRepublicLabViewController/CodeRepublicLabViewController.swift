//
//  CodeRepublicLabViewController.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 15.06.22.
//

import UIKit
import MarqueeLabel
import SideMenu

class CodeRepublicLabViewController: UIViewController {

    @IBOutlet weak var runningLabel: MarqueeLabel!

    @IBOutlet weak var enrollNowButton: UIButton!
    @IBOutlet weak var enrollNowButton2: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var popupView: UIView!
    @IBOutlet weak var appearanceSegment: UISegmentedControl!
    @IBOutlet weak var languageSegment: UISegmentedControl!
    @IBOutlet weak var timerMonthLabel: UILabel!
    @IBOutlet weak var timerDaysLabel: UILabel!
    @IBOutlet weak var timerHoursLabel: UILabel!
    @IBOutlet weak var timerMinutesLabel: UILabel!
    
    var timer = Timer()
    var menu: SideMenuNavigationController?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let l = AppDelegate.index
        languageSegment.selectedSegmentIndex = l
        callAllFunctions()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(changeIndex), name: NSNotification.Name("SelectedIndex"), object: nil)

        if Bundle.main.preferredLocalizations.first == "hy" {
            runningLabel.text = "Ուզում ե՞ս դառնալ պրոֆեսիոնալ, ուրեմն միացիր Code Republic Lab-ին          "
        } else if Bundle.main.preferredLocalizations.first == "en" {
            runningLabel.text = "Want to become a professional, then join Code Republic Lab!          "
        }
        tabBarController?.delegate = self

    }
    func callAllFunctions() {
        setTimer()
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
    
    @objc func updateTime() {
        TimerComponents.shared.UpdateTime()
    }
    
    func setTimer() {
        TimerComponents.shared.getOutlets(monthLabel: timerMonthLabel, daysLabel: timerDaysLabel, hoursLabel: timerHoursLabel, minutesLabel: timerMinutesLabel, timer: timer)
        TimerComponents.shared.getButtons(buttonOne: enrollNowButton, buttonTwo: enrollNowButton2)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func configureUI() {
        blurView.bounds = self.view.bounds
        if enrollNowButton.isEnabled == false {
            enrollNowButton.layer.opacity = 0.3
            enrollNowButton2.layer.opacity = 0.3
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
extension CodeRepublicLabViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.scrollToTop()
    }
}
