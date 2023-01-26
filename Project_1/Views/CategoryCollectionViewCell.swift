//
//  movieCollectionViewCell.swift
//  Project_1
//
//  Created by Yerzhan Syzdyk on 25.01.2023.
//

import UIKit
import SnapKit

class CategoryCollectionViewCell: UICollectionViewCell {
    private lazy var firstLabel : UILabel = {
        let myLabel = UILabel()
        myLabel.font = UIFont.systemFont(ofSize: 20)
        myLabel.textAlignment = .center
        
        return myLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setInformation(with text : String){
        firstLabel.text = text
    }
}


//MARK: setup views and constraints

extension CategoryCollectionViewCell{
    func setupViews(){
        contentView.addSubview(firstLabel)
    }
    func setupConstraints(){
        firstLabel.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }
}
