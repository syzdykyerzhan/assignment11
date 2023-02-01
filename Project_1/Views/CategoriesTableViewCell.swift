//
//  CategoriesTableViewCell.swift
//  Project_1
//
//  Created by Yerzhan Syzdyk on 25.01.2023.
//

import UIKit
import SnapKit

final class CategoriesTableViewCell: UITableViewCell {
    
    var movieList : [MovieModel] = []
    
    private lazy var moviesCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let myCollectionVIew = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCollectionVIew.register(AllMovieCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.allMovieCollectionViewCell)
        myCollectionVIew.showsHorizontalScrollIndicator = false
        return myCollectionVIew
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMovies(listOfMovie: [MovieModel]) {
        self.movieList = listOfMovie
    }
    

}

//MARK: Collection View Delegate and Data Source
extension CategoriesTableViewCell : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.allMovieCollectionViewCell, for: indexPath) as! AllMovieCollectionViewCell
        let movie = movieList[indexPath.item]
        cell.setInformation(backdrop_path: movie.backdropPath, nameOfMovie: movie.originalTitle, overview: movie.overview)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3 - 7, height: collectionView.frame.height - 5)
    }
    
    
}

//MARK: setup views and constraints

extension CategoriesTableViewCell{
    func setupViews(){
        contentView.addSubview(moviesCollectionView)
    }
    func setupConstraints(){
        moviesCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
    }
}

