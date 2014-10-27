//
//  DetailsViewController.swift
//  ArtistsView
//
//  Created by Developer on 10/24/14.
//  Copyright (c) 2014 gregbarbosa. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    // View Labels
    @IBOutlet weak var artistBioTextView: UITextView!
    @IBOutlet weak var artistImageView: UIImageView!
    
    @IBAction func showArtistBiography(sender: AnyObject) {
        if (artistBioTextView.hidden) {
            artistBioTextView.hidden = false
        } else {
            artistBioTextView.hidden = true
        }
    }
    
    @IBAction func twitter(sender: AnyObject) {
        var tweetBotInstalled : Bool = UIApplication.sharedApplication().canOpenURL(NSURL(string: "tweetbot:")!)
        var twitterInstalled : Bool = UIApplication.sharedApplication().canOpenURL(NSURL(string: "twitter:")!)
        if (tweetBotInstalled) {
            UIApplication.sharedApplication().openURL(NSURL(string:"tweetbot:///user_profile/DrOziOfficial")!)
            println("Tweetbot installed!")
        } else if (twitterInstalled) {
            UIApplication.sharedApplication().openURL(NSURL(string:"twitter:///user?screen_name=DrOziOfficial")!)
            println("Twitter installed!")
        } else {
            UIApplication.sharedApplication().openURL(NSURL(string: artistTwitter)!)
        }
    }
    
    @IBAction func facebook(sender: AnyObject) {
        println("Facebook")
        var installed : Bool = UIApplication.sharedApplication().canOpenURL(NSURL(string: "facebook:")!)
        if (installed) {
            UIApplication.sharedApplication().openURL(NSURL(string: "facebook:")!)
            println("Facebook installed!")
        } else {
            UIApplication.sharedApplication().openURL(NSURL(string: artistFacebook)!)
            println("Facebook not installed!")
        }
    }
    
    @IBAction func soundcloud(sender: AnyObject) {
        println("Soundcloud")
        var installed : Bool = UIApplication.sharedApplication().canOpenURL(NSURL(string: "soundcloud:")!)
        if (installed) {
            UIApplication.sharedApplication().openURL(NSURL(string: "soundcloud://users/\(artistSoundcloudID)")!)
            println("Soundcloud installed!")
        } else {
            UIApplication.sharedApplication().openURL(NSURL(string: artistSoundcloud)!)
            println("Soundcloud not installed!")
        }
    }
    
    @IBAction func mail(sender: AnyObject) {
        println("Mail")
    }
    @IBAction func share(sender: AnyObject) {
        println("Share Sheet")
    }

    // Variables
    var artistName = String()
    var artistBio = String()
    var artistFacebook = String()
    var artistTwitter = String()
    var artistSoundcloud = String()
    var artistSoundcloudID = Int()
    var artistsBooking = String()
    var artistsManagement = String()

    
    func configureView() {
        self.title = artistName
        artistBioTextView.hidden = true
        artistBioTextView.text = artistBio
//        artistImageView.image = UIImage(named: "\(artistName)")
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "\(artistName)")!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()

    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.toolbarHidden = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }

}
