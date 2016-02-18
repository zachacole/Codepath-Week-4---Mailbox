//
//  MailboxViewController.swift
//  Mailbox
//
//  Created by Zach Cole on 2/17/16.
//  Copyright © 2016 Zach Cole. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var archiveIcon: UIImageView!
    @IBOutlet weak var deleteIcon: UIImageView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var listIcon: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    
    var messageOriginalCenter: CGPoint!
    var archiveOriginalCenter: CGPoint!
    var deleteOriginalCenter: CGPoint!
    var laterOriginalCenter: CGPoint!
    var listOriginalCenter: CGPoint!
    
    let greenColor = UIColor(red: 112/255.0, green: 217/255.0, blue: 98/255.0, alpha: 1.0)
    let redColor = UIColor(red: 235/255.0, green: 84/255.0, blue: 51/255.0, alpha: 1.0)
    let orangeColor = UIColor(red: 250/255.0, green: 211/255.0, blue: 51/255.0, alpha: 1.0)
    let brownColor = UIColor(red: 216/255.0, green: 166/255.0, blue: 117/255.0, alpha: 1.0)
    let greyColor = UIColor(red: 170/255.0, green: 170/255.0, blue: 170/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: 320, height: 1288)
        archiveIcon.alpha = 0.3
        deleteIcon.alpha = 0
        laterIcon.alpha = 0.3
        listIcon.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanMessage(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            
            messageOriginalCenter = messageImageView.center
            archiveOriginalCenter = archiveIcon.center
            deleteOriginalCenter = deleteIcon.center
            laterOriginalCenter = laterIcon.center
            listOriginalCenter = listIcon.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            messageImageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            
            if translation.x >= 60 && translation.x < 260 {
                
                archiveIcon.center = CGPoint(x: archiveOriginalCenter.x + translation.x - 60, y: archiveOriginalCenter.y)
                deleteIcon.center = CGPoint(x: deleteOriginalCenter.x + translation.x - 60, y: deleteOriginalCenter.y)
                
                backgroundView.backgroundColor = greenColor
                
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.archiveIcon.alpha = 1
                })
                deleteIcon.alpha = 0
                
            } else if translation.x >= 260 {
                
                archiveIcon.center = CGPoint(x: archiveOriginalCenter.x + translation.x - 60, y: archiveOriginalCenter.y)
                deleteIcon.center = CGPoint(x: deleteOriginalCenter.x + translation.x - 60, y: deleteOriginalCenter.y)
                
                backgroundView.backgroundColor = redColor
                archiveIcon.alpha = 0
                deleteIcon.alpha = 1
                laterIcon.alpha = 0
                listIcon.alpha = 0
                
            } else if translation.x <= -60 && translation.x > -260 {
                
                laterIcon.center = CGPoint(x: laterOriginalCenter.x + translation.x + 60, y: laterOriginalCenter.y)
                listIcon.center = CGPoint(x: listOriginalCenter.x + translation.x + 60, y: listOriginalCenter.y)
                
                backgroundView.backgroundColor = orangeColor
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.laterIcon.alpha = 1
                })
                listIcon.alpha = 0
            
            } else if translation.x <= -260 {
                
                laterIcon.center = CGPoint(x: laterOriginalCenter.x + translation.x + 60, y: laterOriginalCenter.y)
                listIcon.center = CGPoint(x: listOriginalCenter.x + translation.x + 60, y: listOriginalCenter.y)
                
                backgroundView.backgroundColor = brownColor
                laterIcon.alpha = 0
                listIcon.alpha = 1
                archiveIcon.alpha = 0
                deleteIcon.alpha = 0
                
            } else {
                
                backgroundView.backgroundColor = greyColor
                laterIcon.alpha = 0.3
                listIcon.alpha = 0
                archiveIcon.alpha = 0.3
                deleteIcon.alpha = 0
                
            }
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
