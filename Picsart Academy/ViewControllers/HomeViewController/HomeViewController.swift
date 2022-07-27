//
//  ViewController.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 02.06.22.
//

import UIKit

import AVFoundation
import SideMenu
import MarqueeLabel

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var runningLabel: MarqueeLabel!
    @IBOutlet weak var animatingView: AnimatedMaskLabel!
    @IBOutlet var images: [UIImageView]!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var enrollNowButton: UIButton!
    @IBOutlet weak var enrollNowButton2: UIButton!
    @IBOutlet weak var learnMoreButton: UIButton!
    @IBOutlet weak var admissionWavesView: UIView!
    @IBOutlet weak var admissionWavesStackView: UIStackView!
    @IBOutlet weak var timerMonthLabel: UILabel!
    @IBOutlet weak var timerDaysLabel: UILabel!
    @IBOutlet weak var timerHoursLabel: UILabel!
    @IBOutlet weak var timerMinutesLabel: UILabel!
    @IBOutlet weak var sandboxImage: UIImageView!
    @IBOutlet weak var levelUpImage: UIImageView!
    @IBOutlet weak var crlImage: UIImageView!
    @IBOutlet weak var atomImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var popupView: UIView!
    @IBOutlet weak var appearanceSegment: UISegmentedControl!
    @IBOutlet weak var languageSegment: UISegmentedControl!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var fourthImage: UIImageView!
    
    // MARK: - Properties
    
    var timer = Timer()
    var playerManager = PlayerManager()
    var menu: SideMenuNavigationController?
    var languageBundle: Bundle?

    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let l = AppDelegate.index
        languageSegment.selectedSegmentIndex = l
        callAllFunctions()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        playerManager.playerLayer.frame = videoView.bounds

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(changeIndex), name: NSNotification.Name("SelectedIndex"), object: nil)
        if Bundle.main.preferredLocalizations.first == "hy" {
            animatingView.text = "Գաղափար, Հստակեցում, Իրականացում"
            runningLabel.text = "Բարի Գալուստ Փիքսարթ Ակադեմիա          "
        } else if Bundle.main.preferredLocalizations.first == "en" {
            animatingView.text = "Anything Tech, Everything Educational"
            runningLabel.text = "Welcome to Picsart Academy!          "
        }
        playerManager.player.seek(to: .zero)
        playerManager.player.play()
        self.tabBarController?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        configureFirst()
        playerManager.player.pause()
    }
    
    // MARK: - Methods
    
    @objc func changeIndex(notification: NSNotification) {
        if let i = notification.object as? Int {
            tabBarController?.selectedIndex = i
        }
    }
    
    func callAllFunctions() {
        playerManager.configureVideo()
        configureVideo()
        setTimer()
        configureMenu()
        configureUI()
    }
    
    
    
    func configureMenu() {
        menu = SideMenuNavigationController(rootViewController: SideMenuViewController())
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    func setTimer() {
        TimerComponents.shared.getOutlets(monthLabel: timerMonthLabel, daysLabel: timerDaysLabel, hoursLabel: timerHoursLabel, minutesLabel: timerMinutesLabel, timer: timer)
        TimerComponents.shared.getButtons(buttonOne: enrollNowButton, buttonTwo: enrollNowButton2)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    @objc func updateTime() {
        TimerComponents.shared.UpdateTime()
    }
    
    func configureUI() {
        scrollView.setContentOffset(.zero, animated: false)
        secondImage.layer.opacity = 0.5
        thirdImage.layer.opacity = 0.5
        fourthImage.layer.opacity = 0.5
        blurView.bounds = self.view.bounds
        if enrollNowButton.isEnabled == false {
            enrollNowButton.layer.opacity = 0.3
            enrollNowButton2.layer.opacity = 0.3
        }
    }
    
    func configureVideo() {
        videoView.layer.addSublayer(playerManager.playerLayer)
        
        playerManager.player.play()
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: nil)
        
    }
    
    
    @objc func videoDidEnd() {
        playerManager.player.seek(to: .zero)
        playerManager.player.play()
    }
    func configureFirst() {
        if firstView.isHidden {
            ReusableFunctions.shared.configureImages(f: firstImage, o1: secondImage, o2: thirdImage, o3: fourthImage)
            ReusableFunctions.shared.changeHideState(f: firstLabel, o1: secondLabel, o2: thirdLabel, o3: fourthLabel)
            ReusableFunctions.shared.unhideView(view: firstView)
            
            if !secondView.isHidden {
            ReusableFunctions.shared.hideView(view: secondView)
            }
            if !thirdView.isHidden {
            ReusableFunctions.shared.hideView(view: thirdView)
            }
        }
    }
    func configureSecond() {
        if secondView.isHidden {
            ReusableFunctions.shared.configureImages(f: firstImage, s: secondImage, o1: thirdImage, o2: fourthImage)
            ReusableFunctions.shared.changeHideState(f: secondLabel, o1: firstLabel, o2: thirdLabel, o3: fourthLabel)
            ReusableFunctions.shared.unhideView(view: secondView)
            if !firstView.isHidden {
            ReusableFunctions.shared.hideView(view: firstView)
            }
            if !thirdView.isHidden {
            ReusableFunctions.shared.hideView(view: thirdView)
            }
        }
    }
    func configureThird() {
        if thirdView.isHidden {
            ReusableFunctions.shared.configureImages(f: firstImage, s: secondImage, t: thirdImage, o1: fourthImage)
            ReusableFunctions.shared.changeHideState(f: thirdLabel, o1: firstLabel, o2: secondLabel, o3: fourthLabel)
            ReusableFunctions.shared.unhideView(view: thirdView)
            if !firstView.isHidden {
                ReusableFunctions.shared.hideView(view: firstView)
            }
            if !secondView.isHidden {
                ReusableFunctions.shared.hideView(view: secondView)
            }
        }
    }
    func configureFourth() {
        if fourthLabel.isHidden {
            ReusableFunctions.shared.configureImages(f: firstImage, s: secondImage, t: thirdImage, fth: fourthImage)
            ReusableFunctions.shared.changeHideState(f: fourthLabel, o1: firstLabel, o2: secondLabel, o3: thirdLabel)
            if !firstView.isHidden {
            ReusableFunctions.shared.hideView(view: firstView)
            }
            if !secondView.isHidden {
            ReusableFunctions.shared.hideView(view: secondView)
            }
            if !thirdView.isHidden {
            ReusableFunctions.shared.hideView(view: thirdView)
            }
        }
    }
    // MARK: - IBActions
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
    @IBAction func changeLanguage(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            if let path  = Bundle.main.path(forResource: "en", ofType: "lproj") {
                languageBundle = Bundle(path: path)
//                Bundle.setLanguage("hy")
            }
        } else if sender.selectedSegmentIndex == 1 {
            if let path  = Bundle.main.path(forResource: "hy", ofType: "lproj") {
                languageBundle = Bundle(path: path)
            }
        }
    }
    @IBAction func goToSandbox(_ sender: UITapGestureRecognizer) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func goToLevelUp(_ sender: UITapGestureRecognizer) {
        tabBarController?.selectedIndex = 2
    }
    @IBAction func goToCRL(_ sender: UITapGestureRecognizer) {
        tabBarController?.selectedIndex = 3
    }
    @IBAction func goToHome(_ sender: UITapGestureRecognizer) {
        self.scrollView.setContentOffset(.zero, animated: true)
    }
    @IBAction func showFirst(_ sender: UITapGestureRecognizer) {
        configureFirst()
    }
    @IBAction func showSecond(_ sender: UITapGestureRecognizer) {
        configureSecond()
    }
    @IBAction func showThird(_ sender: UITapGestureRecognizer) {
        configureThird()
    }
    @IBAction func showFourth(_ sender: UITapGestureRecognizer) {
        configureFourth()
    }
}

extension HomeViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.scrollToTop()
    }
}
