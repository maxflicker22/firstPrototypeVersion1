//
//  OrganisationTableViewCell.swift
//  prototype1scrollTableView
//
//  Created by Markus Flicker on 09.12.18.
//  Copyright © 2018 Worldcare. All rights reserved.
//

import UIKit
protocol OrganisationsDelegate{
    func detailButtontapped(sender: OrganisationTableViewCell)
}

class OrganisationTableViewCell: UITableViewCell {

    @IBOutlet weak var organisationsImageView: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var totalReachLabel: UILabel!
    @IBOutlet weak var actuallyReachLabel: UILabel!
    @IBOutlet weak var ProgressView: UIProgressView!
    
    var delegate: OrganisationsDelegate?
    var organisations: Organisations?
    
    func configure(for organisations: Organisations, delegate: OrganisationsDelegate) { //
        mainLabel.text = organisations.name
        totalReachLabel.text = "/ \(String(organisations.totalReach))"
        actuallyReachLabel.text = String(organisations.actuallyReach)
        if let image = UIImage(named: organisations.imageURL) {
            organisationsImageView.image = image
        }
        self.organisations = organisations
        self.delegate = delegate
    }
    
    
    @IBAction func ButtonHandler(_ sender: UIButton) {
        delegate?.detailButtontapped(sender: self)
    }
    
}
