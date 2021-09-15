//
//  TopViewController.swift
//  MoviesApp
//
//  Created by Nguyễn Trí on 13/08/2021.
//

import UIKit

class TopViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = TopViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        title = "TopMovies"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let nib = UINib(nibName: "TopCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func setupData() {
        topMovies()
    }
    
    func updateUI() {
        self.tableView.reloadData()
    }

    
    func topMovies() {
        viewModel.loadAPITop { (done, msg) in
            if done {
                self.updateUI()
            } else {
                print("\(msg) is error.")
            }
        }
    }
}

extension TopViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TopCell
        let item = viewModel.movies[indexPath.row]
        cell.titleLabel.text = item.name
        cell.artistLabel.text = item.artistName
        cell.releaseLabel.text = item.releaseDate
        

        if item.thumbnailImage != nil {
            cell.imageFilm.image = item.thumbnailImage
        } else {
            cell.imageFilm.image = nil
            
            Networking.shared().downloadImage(url: item.artworkUrl100) { (image) in
                if let image = image {
                    cell.imageFilm.image = image
                    item.thumbnailImage = image
                } else {
                    cell.imageFilm.image = nil
                }
            }

        }
        
        return cell
    }
    
}
