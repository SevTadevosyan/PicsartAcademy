//
//  SandboxViewController.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 15.06.22.
//

import UIKit
import MarqueeLabel
import SideMenu

class SandboxViewController: UIViewController {
    
    @IBOutlet weak var runningLabel: MarqueeLabel!

    @IBOutlet weak var enrollNowButton: UIButton!
    @IBOutlet weak var enrollNowButton2: UIButton!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var popupView: UIView!
    @IBOutlet weak var appearanceSegment: UISegmentedControl!
    @IBOutlet weak var languageSegment: UISegmentedControl!
    @IBOutlet weak var monthsLabel: UILabel!
    @IBOutlet weak var EMTrackView: UIView!
    @IBOutlet weak var PPTrackView: UIView!
    @IBOutlet weak var CPTrackView: UIView!
    @IBOutlet weak var cpButton: UIButton!
    @IBOutlet weak var emButton: UIButton!
    @IBOutlet weak var ppButton: UIButton!

    var timer = Timer()
    var menu: SideMenuNavigationController?


    override func viewDidLoad() {
        super.viewDidLoad()
        let l = AppDelegate.index
        languageSegment.selectedSegmentIndex = l
        callAllFunctions()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setPlusImage()
        CPTrackView.isHidden = true
        EMTrackView.isHidden = true
        PPTrackView.isHidden = true
        cpButton.isSelected = false
        emButton.isSelected = false
        ppButton.isSelected = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(changeIndex), name: NSNotification.Name("SelectedIndex"), object: nil)
        if Bundle.main.preferredLocalizations.first == "hy" {
            runningLabel.text = "Միացիր Sandbox-ին, սկսիր խենթ ուղղիդ         "
            
        } else if Bundle.main.preferredLocalizations.first == "en" {
            runningLabel.text = "Join the Sandbox, start your crazy Pipeline!         "
        }
        self.tabBarController?.delegate = self

    }
    func callAllFunctions() {
        configureUI()
        setTimer()
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
    
    func setTimer() {
        TimerComponents.shared.getOutlets(monthLabel: monthsLabel, daysLabel: daysLabel, hoursLabel: hoursLabel, minutesLabel: minutesLabel, timer: timer)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        TimerComponents.shared.UpdateTime()
    }
    
    func configureUI() {
        blurView.bounds = self.view.bounds
        if enrollNowButton.isEnabled == false {
            enrollNowButton.layer.opacity = 0.3
            enrollNowButton2.layer.opacity = 0.3
        }
    }
    
    func setPlusImage() {
        cpButton.setImage(ReusableFunctions.shared.plusImage, for: .normal)
        emButton.setImage(ReusableFunctions.shared.plusImage, for: .normal)
        ppButton.setImage(ReusableFunctions.shared.plusImage, for: .normal)
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
    
    @IBAction func showCPTrackInfo(_ sender: UIButton) {
        if sender.isSelected {
            emButton.isSelected = false
            ppButton.isSelected = false
            if !EMTrackView.isHidden {
                ReusableFunctions.shared.hideView(view: EMTrackView)
            }
            if !PPTrackView.isHidden {
                ReusableFunctions.shared.hideView(view: PPTrackView)
            }
            ReusableFunctions.shared.unhideView(view: CPTrackView)
            ReusableFunctions.shared.setPlusAndMinusImage(m: cpButton, p1: emButton, p2: ppButton)
            ReusableFunctions.shared.setPlusImageExceptFor(b1: emButton, b2: ppButton)
        } else {
            ReusableFunctions.shared.hideView(view: CPTrackView)
            setPlusImage()
        }

    }
    @IBAction func showEMTrackInfo(_ sender: UIButton) {
        if sender.isSelected {
            cpButton.isSelected = false
            ppButton.isSelected = false
            if !CPTrackView.isHidden {
                ReusableFunctions.shared.hideView(view: CPTrackView)
            }
            if !PPTrackView.isHidden {
                ReusableFunctions.shared.hideView(view: PPTrackView)
            }
            ReusableFunctions.shared.unhideView(view: EMTrackView)
            ReusableFunctions.shared.setPlusAndMinusImage(m: emButton, p1: cpButton, p2: ppButton)
            ReusableFunctions.shared.setPlusImageExceptFor(b1: cpButton, b2: ppButton)
        } else {
            ReusableFunctions.shared.hideView(view: EMTrackView)
            setPlusImage()
        }
    }
    
    @IBAction func showPPTrackInfo(_ sender: UIButton) {
        if sender.isSelected {
            cpButton.isSelected = false
            emButton.isSelected = false
            if !CPTrackView.isHidden {
                ReusableFunctions.shared.hideView(view: CPTrackView)
            }
            if !EMTrackView.isHidden {
                ReusableFunctions.shared.hideView(view: EMTrackView)
            }
            ReusableFunctions.shared.unhideView(view: PPTrackView)
            ReusableFunctions.shared.setPlusAndMinusImage(m: ppButton, p1: cpButton, p2: emButton)
            ReusableFunctions.shared.setPlusImageExceptFor(b1: cpButton, b2: emButton)
        } else {
            ReusableFunctions.shared.hideView(view: PPTrackView)
            setPlusImage()
        }
    }
}
extension SandboxViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.scrollToTop()
    }
}
