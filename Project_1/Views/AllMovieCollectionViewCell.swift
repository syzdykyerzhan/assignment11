//
//  AllMovieCollectionViewCell.swift
//  Project_1
//
//  Created by Yerzhan Syzdyk on 30.01.2023.
//

import UIKit

final class AllMovieCollectionViewCell: UICollectionViewCell {
    
    private lazy var myContentView: UIView = UIView()
    
    private lazy var myImageView : UIImageView = {
        let myImageView = UIImageView(image: UIImage(named: "archer"))
        myImageView.layer.cornerRadius = 10
        myImageView.clipsToBounds = true
        myImageView.contentMode = .scaleAspectFill
        return myImageView
    }()
    
    private lazy var nameOfMovie : UILabel = {
        let myLabel = UILabel()
        myLabel.text = "Archer Archer Archer"
        myLabel.font = UIFont.boldSystemFont(ofSize: 15)
        myLabel.numberOfLines = 2
        myLabel.sizeToFit()
        myLabel.lineBreakMode = .byWordWrapping
        return myLabel
    }()
    
    private lazy var informOfMovie : UILabel = {
        let myLabel = UILabel()
        myLabel.text = "triller, horror, sci-fi, comedy"
        myLabel.numberOfLines = 2
        myLabel.textColor = .systemGray2
        myLabel.font = UIFont.systemFont(ofSize: 12)
        myLabel.sizeToFit()
        myLabel.lineBreakMode = .byWordWrapping
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
    
    func setInformation(backdrop_path: String, nameOfMovie: String, overview: String){
        guard let url = URL(string: "\(Constants.Resources.image_url)\(backdrop_path)") else{fatalError("Incorrect link of Image")}
        
        DispatchQueue.main.async {
            self.myImageView.kf.setImage(with: url)
            self.nameOfMovie.text = nameOfMovie
            self.informOfMovie.text = overview
        }
    }
}

//MARK: setup views and constraints

extension AllMovieCollectionViewCell{
    func setupViews(){
        contentView.addSubview(myContentView)
        myContentView.addSubview(myImageView)
        myContentView.addSubview(nameOfMovie)
        myContentView.addSubview(informOfMovie)
    }
    func setupConstraints(){
        myContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        myImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        nameOfMovie.snp.makeConstraints { make in
            make.top.equalTo(myImageView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        informOfMovie.snp.makeConstraints { make in
            make.top.equalTo(nameOfMovie.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}
