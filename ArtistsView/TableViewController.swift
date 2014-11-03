//
//  TableViewController.swift
//  Phase Management
//
//  Created by Developer on 10/24/14.
//  Copyright (c) 2014 gregbarbosa. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

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

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as TableViewCell

        // Load data from plist
        var dict = artists.objectAtIndex(indexPath.row) as NSDictionary
        let artist = dict.objectForKey("Artist") as String
        
        // Configure cell
        cell.artistNameLabel.text = artist
        cell.artistImageView.image = UIImage(named: "bnr_\(artist)")!
        
        return cell
        
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "artistDetails" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                var dict = artists.objectAtIndex(indexPath.row) as NSDictionary
                let artist = dict.objectForKey("Artist") as String
                let artistBio = dict.objectForKey("Bio") as String
                let artistFacebook = dict.objectForKey("Facebook") as String
                let artistTwitter = dict.objectForKey("Twitter") as String
                let artistSoundcloud = dict.objectForKey("Soundcloud") as String
                let artistsBooking = dict.objectForKey("Booking") as String
                let artistsManagement = dict.objectForKey("Management") as String
                let artistSoundcloudID = dict.objectForKey("Soundcloud_ID") as Int
                (segue.destinationViewController as DetailsViewController).artistName = artist
                (segue.destinationViewController as DetailsViewController).artistBio = artistBio
                (segue.destinationViewController as DetailsViewController).artistFacebook = artistFacebook
                (segue.destinationViewController as DetailsViewController).artistTwitter = artistTwitter
                (segue.destinationViewController as DetailsViewController).artistSoundcloud = artistSoundcloud
                (segue.destinationViewController as DetailsViewController).artistsBooking = artistsBooking
                (segue.destinationViewController as DetailsViewController).artistsManagement = artistsManagement
                (segue.destinationViewController as DetailsViewController).artistSoundcloudID = artistSoundcloudID
            }
        }
    }
}