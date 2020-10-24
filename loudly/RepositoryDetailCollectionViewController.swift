//
//  RepositoryDetailCollectionViewController.swift
//  loudly
//
//  Created by Maahd Shahzad on 10/24/20.
//  Copyright © 2020 Maahd Shahzad. All rights reserved.
//

import UIKit

private let reuseIdentifier = "repositoryDetailCell"

class RepositoryDetailCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ownerLoginName: UILabel!
    @IBOutlet weak var size: UILabel!
    
}

class RepositoryDetailCollectionViewController: UICollectionViewController {
    
    let repositoryDetailController = RepositoryDetailController()
    
    var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        repositoryDetailController.fetchRepositories { (fetchedReposotories) in
            DispatchQueue.main.async {
                self.items = fetchedReposotories!.items
                self.collectionView.reloadData()
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RepositoryDetailCell
    
        // Configure the cell
        let repository = self.items[indexPath.row]
        cell.name.text = "Repository Name: \(repository.name)"
        cell.ownerLoginName.text = "Owner Login Name: \(repository.owner.login)"
        cell.size.text = "Size: \(String(repository.size)) bytes"
        if (repository.hasWiki) {
            cell.backgroundColor = .green
        } else {
            cell.backgroundColor = .cyan
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
