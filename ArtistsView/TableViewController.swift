//
//  TableViewController.swift
//  ArtistsView
//
//  Created by Developer on 10/24/14.
//  Copyright (c) 2014 gregbarbosa. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var artists = NSMutableArray()
    
//    var artists = ["Alex Sin", "Downlink", "Dr. Ozi", "Killabyte", "Mark Instinct", "Pyramid Scheme", "Rekoil", "River Accorsi", "Said the Sky", "Supreme", "Trollphace", "Twine", "Twofold"]
    
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
        NSLog("The array: \([data!.count])")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return artists.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        var dict = artists.objectAtIndex(indexPath.row) as NSDictionary
        let artist = dict.objectForKey("Artist") as String
        cell.textLabel.text = artist
        return cell
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
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
                (segue.destinationViewController as DetailsViewController).artistName = artist
                (segue.destinationViewController as DetailsViewController).artistBio = artistBio
                (segue.destinationViewController as DetailsViewController).artistFacebook = artistBio
                (segue.destinationViewController as DetailsViewController).artistTwitter = artistBio
                (segue.destinationViewController as DetailsViewController).artistSoundcloud = artistBio
                (segue.destinationViewController as DetailsViewController).artistsBooking = artistBio
                (segue.destinationViewController as DetailsViewController).artistsManagement = artistBio
            }
        }
    }


}
