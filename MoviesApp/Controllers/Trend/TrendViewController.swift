//
//  TrendViewController.swift
//  MoviesApp
//
//  Created by Nguyễn Trí on 13/08/2021.
//

import UIKit
import SafariServices

class TrendViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = TrendViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        title = "Trending"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let listBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic-list"), style: .plain, target: self, action: #selector(loadAPI))
        self.navigationItem.rightBarButtonItem = listBarButtonItem
        
        let nib = UINib(nibName: "TrendCell", bundle: .main)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
    
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setupData() {}
    
    func updateUI() {
        self.collectionView.reloadData()
    }
    
    @objc func loadAPI() {
        viewModel.loadAPI { (done, msg) in
            if done {
                self.updateUI()
            } else {
                print("\(msg) is error.")
            }
        }
    }
}


    // MARK: - Collection
extension TrendViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SFSafariViewControllerDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TrendCell
        let item = viewModel.movies[indexPath.row]
        cell.titleLabel.text = item.name
        
        if item.thumbnailImage != nil {
            cell.thumbnail.image = item.thumbnailImage
        } else {
            cell.thumbnail.image = nil
            
            Networking.shared().downloadImage(url: item.artworkUrl100) { (image) in
                if let image = image {
                    cell.thumbnail.image = image
                    item.thumbnailImage = image
                } else {
                    cell.thumbnail.image = nil
                }
            }
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.row]
        
        guard let url = URL(string: movie.url) else { return }
        
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        let vc = SFSafariViewController(url: url, configuration: config)
        vc.delegate = self
        
        present(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width - 15
        return CGSize(width: (screenWidth/3), height: (screenWidth/3 * 5/3))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
}
