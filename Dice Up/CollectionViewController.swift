//
//  CollectionViewController.swift
//  CollectionDemo
//
//  Created by Can Akyurek on 05/02/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CollectionText" {
            let textViewController = segue.destinationViewController as! TextViewController
            
            let indexPath = collectionView!.indexPathsForSelectedItems()
            textViewController.textTo = titles[indexPath![0].row]
            
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return carImages.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        // Configure the cell
        
        cell.usernameLabel.text = titles[indexPath.row]
        cell.imageView.image = carImages[indexPath.row]
        
        return cell
    }
}



