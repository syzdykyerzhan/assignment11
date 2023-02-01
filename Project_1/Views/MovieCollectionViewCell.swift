//
//  MovieCollectionViewCell.swift
//  Project_1
//
//  Created by Yerzhan Syzdyk on 25.01.2023.
//

import UIKit
import SnapKit

class MovieCollectionViewCell: UICollectionViewCell {
    private lazy var imageView : UIImageView = {
        let myImageView = UIImageView(image: UIImage(named: "puss_in_boots"))
        myImageView.contentMode = .scaleAspectFill
        return myImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setInformation(by name : String){
        imageView.image = UIImage(named: name)
    }
    
    public func setInformation(backdrop_path: String){
        guard let url = URL(string: "\(Constants.Resources.image_url)\(backdrop_path)") else {fatalError("Incorrect link of iamge")}
        DispatchQueue.main.async {
            self.imageView.kf.setImage(with: url)
        }
    }
}

//MARK: setup views and constraints

extension MovieCollectionViewCell{
    func setupViews(){
        contentView.addSubview(imageView)
    }
    func setupConstraints(){
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
