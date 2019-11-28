//
//  HelpViewController.swift
//  AccessibilitySample
//
//  Created by Yogendra Singh on 27/11/19.
//  Copyright © 2019 Yogendra Singh. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
    
    //MARK: @IBOutlets
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var moreInfoTableView: UITableView!
    
    
    //MARK: Variables
    var helpViewModel = HelpViewModel()
    
    
    //MARK: Constants
    let footerHeightForMoreInfoSection: CGFloat = 50
    let headerHeightForMoreInfoSection: CGFloat = 50
    let cellRowHeight: CGFloat = 70
   
    
    let infoCellIdentifier = "InfoCell"
    let guidedCellIdentifier = "GuidedCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Enable titleLabel fint size dynamic.
        closeButton.titleLabel?.adjustsFontForContentSizeCategory = true
        
        //Make TableViewCell Height Dynamic
        moreInfoTableView.estimatedRowHeight = cellRowHeight
        moreInfoTableView.rowHeight = UITableView.automaticDimension
        
        //Make TableView Header Height Dynamic
        moreInfoTableView.estimatedSectionHeaderHeight = headerHeightForMoreInfoSection
        
        //
        addSearchImageToSearchTextField()
    }
    
    //MARK: Private methods
    
    //Adds leftView of Search TextField
    private func addSearchImageToSearchTextField() {
        let button = UIButton(frame: CGRect.zero)
        button.adjustsImageSizeForAccessibilityContentSizeCategory = true
        button.setImage(UIImage(named: "search"), for: .normal)
        searchTextField.leftView = button
        searchTextField.leftViewMode = .always
    }
}

//MARK:- UITableViewDataSource methods
extension HelpViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return helpViewModel.numberOfMoreInfoAboutItems()
        } else {
            return helpViewModel.numberOfGuidedHelpItems()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: GuidedHelpTableViewCell!
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: infoCellIdentifier) as? GuidedHelpTableViewCell
            cell.configureCell(helpViewModel.moreInfoAbouts[indexPath.row])
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: guidedCellIdentifier) as? GuidedHelpTableViewCell
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = UIColor(red: 247/255.0, green: 247/255.0, blue: 250/255.0, alpha: 1)
            }
            cell.configureCell(helpViewModel.guidedHelps[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if section == 0 {
            return headerViewWith(helpViewModel.moreInfoAbout)
        } else {
            return headerViewWith(helpViewModel.guidedHelp)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}

//MARK: UITableViewDataSource methods
extension HelpViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return footerHeightForMoreInfoSection
        }
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK:- Helper methods
extension HelpViewController {
    
    var headerTextColor: UIColor {
       return UIColor(red: 16/255.0, green: 34/255.0, blue: 111/255.0, alpha: 1.0)
    }
    
    func headerViewWith(_ title: String) -> UIView {
        
        let headerView = UIView(frame: CGRect.zero)
        
        let titleLabel = UILabel()
        titleLabel.textColor = headerTextColor
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.accessibilityTraits = .header
        titleLabel.text = helpViewModel.moreInfoAbout
        titleLabel.accessibilityLabel = helpViewModel.moreInfoAbout
        
        headerView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let topSpacing: CGFloat = 10
        let leadingSpacing: CGFloat = 0.0
        
        titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: topSpacing).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: leadingSpacing).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: leadingSpacing).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -topSpacing).isActive = true
     
        return headerView
        
        
    }
}
