//
//  CityTableViewCell.swift
//  RxTestApp
//
//  Created by anduser on 18.04.2021.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    lazy var cityNameLabel: UILabel = UILabel()
    lazy var cityPopulationLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(cityNameLabel)
        self.contentView.addSubview(cityPopulationLabel)

        cityNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cityPopulationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

        cityNameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        cityPopulationLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    

}
