//
//  DetailsViewController.swift
//  Phase Management
//
//  Created by Developer on 10/24/14.
//  Copyright (c) 2014 gregbarbosa. All rights reserved.
//

import UIKit
import MessageUI

class DetailsViewController: UIViewController, UIActionSheetDelegate, MFMailComposeViewControllerDelegate {

    // MARK: Variables
    var artistName = String()
    var artistBio = String()
    var artistFacebook = String()
    var artistTwitter = String()
    var artistSoundcloud = String()
    var artistSoundcloudID = Int()
    var artistFacebookID = Int()
    var artistsBooking = String()
    var artistsManagement = String()
    @IBOutlet weak var artistBioTextView: UITextView!
    @IBOutlet weak var artistImageView: UIImageView!

    // MARK: View Loading
    func configureView() {
        self.title = artistName
        artistBioTextView.hidden = true
        artistBioTextView.text = artistBio
        artistImageView.image = UIImage(named: "\(artistName)")
        artistImageView.clipsToBounds = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.toolbarHidden = false

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.view.backgroundColor = UIColor.clearColor()

    }

    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // View Labels
    @IBAction func showArtistBiography(sender: AnyObject) {
        if(artistBioTextView.hidden) {
            artistBioTextView.hidden = false
        } else {
            artistBioTextView.hidden = true
        }
    }

    // MARK: Artist's Social Links
    @IBAction func twitter(sender: AnyObject) {
        if (UIApplication.sharedApplication().canOpenURL(NSURL(string: "tweetbot:")!)) {
            UIApplication.sharedApplication().openURL(NSURL(string: "tweetbot:///user_profile/\(artistTwitter)")!)
            println("Tweetbot installed!")
        } else if (UIApplication.sharedApplication().canOpenURL(NSURL(string: "twitter:")!)) {
            UIApplication.sharedApplication().openURL(NSURL(string: "twitter:///user?screen_name=\(artistTwitter)")!)
            println("Twitter installed!")
        } else {
            UIApplication.sharedApplication().openURL(NSURL(string: "https://www.twitter.com/\(artistTwitter)")!)
        }
    }
    @IBAction func facebook(sender: AnyObject) {
        if (UIApplication.sharedApplication().canOpenURL(NSURL(string: "fb:")!)) {
            UIApplication.sharedApplication().openURL(NSURL(string: "fb://profile/\(artistFacebookID)")!)
            println("Facebook installed!")
        } else {
            UIApplication.sharedApplication().openURL(NSURL(string: artistFacebook)!)
            println("Facebook not installed!")
        }
    }
    @IBAction func soundcloud(sender: AnyObject) {
        if (UIApplication.sharedApplication().canOpenURL(NSURL(string: "soundcloud:")!)) {
            UIApplication.sharedApplication().openURL(NSURL(string: "soundcloud://users/\(artistSoundcloudID)")!)
            println("Soundcloud installed!")
        } else {
            UIApplication.sharedApplication().openURL(NSURL(string: artistSoundcloud)!)
            println("Soundcloud not installed!")
        }
    }

    // MARK: Artist Contact and Sharing
    @IBAction func mail(sender: AnyObject) {
//        if (artistsBooking == artistsManagement) {
//            println("Booking and Management are the same. \(artistsManagement)")
//        }

        // Mail Action Sheet
        let alertController = UIAlertController(title: "Mail", message: "What are you looking for?", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let bookingOption = UIAlertAction(title: "Booking", style: .Default) { (action) in
            println("Booking")
            // ...
        }
        alertController.addAction(bookingOption)
        
        let mgmtOption = UIAlertAction(title: "Management", style: .Default) { (action) in
            println("Management")
            // ...
        }
        alertController.addAction(mgmtOption)
        
        self.presentViewController(alertController, animated: true) {
            // ...
        }
        
    }
    @IBAction func share(sender: AnyObject) {
        println("Share Sheet")
    }

    
    // MARK: - Navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//    }

}
