//
//  SettingsViewController.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 15.06.22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var appearanceSegment: UISegmentedControl!
    @IBOutlet weak var languageSegment: UISegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let l = AppDelegate.index
        languageSegment.selectedSegmentIndex = l

        ReusableFunctions.shared.setAppearanceSegmentValue(self, appearance: appearanceSegment)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            }
    
    @IBAction func appearanceSegment(_ sender: UISegmentedControl) {
        ReusableFunctions.shared.changeAppearanceSegmentValue(appearance: appearanceSegment)
    }
    
    @IBAction func languageSegment(_ sender: UISegmentedControl) {
    }

}
