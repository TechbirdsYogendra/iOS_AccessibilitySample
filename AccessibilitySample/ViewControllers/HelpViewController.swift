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
        
        
        moreInfoTableView.estimatedRowHeight = cellRowHeight
        moreInfoTableView.rowHeight = UITableView.automaticDimension
        
        moreInfoTableView.estimatedSectionHeaderHeight = headerHeightForMoreInfoSection
        
        addSearchImageToSearchTextField()
    }
    
    private func addSearchImageToSearchTextField() {
        
        let button = UIButton(frame: CGRect.zero)
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
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityTraits = .header
        if section == 0 {
            label.text = helpViewModel.moreInfoAbout
            label.accessibilityLabel = helpViewModel.moreInfoAbout
        } else {
            label.text = helpViewModel.guidedHelp
            label.accessibilityLabel = helpViewModel.guidedHelp
        }
        return label
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

extension HelpViewController {
    func headerViewWith(_ title: String) -> UIView {
        
        let uiView = UIView(frame: CGRect.zero)
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        label.accessibilityTraits = .header
        label.text = helpViewModel.moreInfoAbout
        label.accessibilityLabel = helpViewModel.moreInfoAbout
        
        uiView.addSubview(label)
        
        let leadingConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: uiView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        
        let trailingConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: uiView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
        
        let topConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: uiView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: uiView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        
        uiView.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
        uiView.layoutIfNeeded()
        return uiView
        
        
    }
}
