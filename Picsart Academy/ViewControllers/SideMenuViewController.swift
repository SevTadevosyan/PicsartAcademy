//
//  SideMenuViewController.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 28.06.22.
//

import Foundation
import UIKit
import SideMenu

class SideMenuViewController: UITableViewController {
    var names: [String] = []
    var images = Constants.shared.sideMenuIcons
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Bundle.main.preferredLocalizations.first == "hy" {
            names = Constants.shared.armenianNames
        } else if Bundle.main.preferredLocalizations.first == "en" {
            names = Constants.shared.englishNames
        }
        tableView.register(UINib(nibName: "Cell", bundle: nil),
                           forCellReuseIdentifier: "Cell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        let name = names[indexPath.row]
        let image = images[indexPath.row]
        cell.configure(with: image!, and: name)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true)
        NotificationCenter.default.post(name: NSNotification.Name("SelectedIndex"), object: indexPath.row)


    }
}
