//
//  ArtistsCollectionViewController.swift
//  Phase Management
//
//  Created by Greg Barbosa on 11/14/14.
//  Copyright (c) 2014 gregbarbosa. All rights reserved.
//

import UIKit

let cellIdentifier = "artistCell"

class ArtistsCollectionViewController: UICollectionViewController {

    var artists = NSMutableArray()

    func loadData() {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as NSString
        let path = documentsDirectory.stringByAppendingPathComponent("ArtistData.plist")
        let fileManager = NSFileManager.defaultManager()

        // Check if file exists
        if(!fileManager.fileExistsAtPath(path)) {
            let bundle = NSBundle.mainBundle().pathForResource("ArtistData", ofType: "plist")
            fileManager.copyItemAtPath(bundle!, toPath: path, error: nil)
        }
        var data = NSMutableArray(contentsOfFile: path)
        artists = data!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()

    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.toolbarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return artists.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let artistCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as ArtistCollectionViewCell

        // Load data from plist
        var dict = artists.objectAtIndex(indexPath.row) as NSDictionary
        let artist = dict.objectForKey("Artist") as String

        // Configure cell
        artistCell.artistNameLabel.text = artist
        artistCell.image = UIImage(named: "bnr_\(artist)")!
//        artistCell.image = UIImage(named: artist)!
        println("bnr_\(artist)")
        return artistCell
    }

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if let visibleCells = collectionView.visibleCells() as? [ArtistCollectionViewCell] {
            for artistCell in visibleCells {
                var yOffset = ((collectionView.contentOffset.y - artistCell.frame.origin.y) / imageHeight) * offsetSpeed
                artistCell.offset(CGPointMake(0.0, yOffset))
            }
        }
    }
    
    // MARK: UICollectionViewDelegate
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "artistDetails" {
            let cell = sender as UICollectionViewCell
            if let indexPath = self.collectionView.indexPathForCell(cell) {
                var dict = artists.objectAtIndex(indexPath.row) as NSDictionary
                let artist = dict.objectForKey("Artist") as String
                let artistBio = dict.objectForKey("Bio") as String
                let artistFacebook = dict.objectForKey("Facebook") as String
                let artistTwitter = dict.objectForKey("Twitter") as String
                let artistSoundcloud = dict.objectForKey("Soundcloud") as String
                let artistsBooking = dict.objectForKey("Booking") as String
                let artistsManagement = dict.objectForKey("Management") as String
                let artistSoundcloudID = dict.objectForKey("Soundcloud_ID") as Int
                let artistFacebookID = dict.objectForKey("Facebook_ID") as Int
                (segue.destinationViewController as DetailsViewController).artistName = artist
                (segue.destinationViewController as DetailsViewController).artistBio = artistBio
                (segue.destinationViewController as DetailsViewController).artistFacebook = artistFacebook
                (segue.destinationViewController as DetailsViewController).artistTwitter = artistTwitter
                (segue.destinationViewController as DetailsViewController).artistSoundcloud = artistSoundcloud
                (segue.destinationViewController as DetailsViewController).artistsBooking = artistsBooking
                (segue.destinationViewController as DetailsViewController).artistsManagement = artistsManagement
                (segue.destinationViewController as DetailsViewController).artistSoundcloudID = artistSoundcloudID
                (segue.destinationViewController as DetailsViewController).artistFacebookID = artistFacebookID
            }
        }
    }
}
