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
    @IBOutlet weak var feedView: UIImageView!
    @IBOutlet weak var listView: UIImageView!
    @IBOutlet weak var laterView: UIImageView!
    
    var messageOriginalCenter: CGPoint!
    var messageLeftOffset: CGFloat!
    var messageLeft: CGPoint!
    var messageRightOffset: CGFloat!
    var messageRight: CGPoint!
    
    var archiveOriginalCenter: CGPoint!
    var archiveOffset: CGFloat!
    var archiveRight: CGPoint!
    
    var deleteOriginalCenter: CGPoint!
    var deleteOffset: CGFloat!
    var deleteRight: CGPoint!
    
    var laterOriginalCenter: CGPoint!
    var laterOffset: CGFloat!
    var laterLeft: CGPoint!
    
    var listOriginalCenter: CGPoint!
    var listOffset: CGFloat!
    var listLeft: CGPoint!
    
    let greenColor = UIColor(red: 112/255.0, green: 217/255.0, blue: 98/255.0, alpha: 1.0)
    let redColor = UIColor(red: 235/255.0, green: 84/255.0, blue: 51/255.0, alpha: 1.0)
    let orangeColor = UIColor(red: 250/255.0, green: 211/255.0, blue: 51/255.0, alpha: 1.0)
    let brownColor = UIColor(red: 216/255.0, green: 166/255.0, blue: 117/255.0, alpha: 1.0)
    let greyColor = UIColor(red: 170/255.0, green: 170/255.0, blue: 170/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: 320, height: 1288)
        
        listView.hidden = true
        laterView.hidden = true
        listView.alpha = 0
        laterView.alpha = 0
        
        messageLeftOffset = -320
        messageRightOffset = 320
        messageLeft = CGPoint(x: messageImageView.center.x + messageLeftOffset, y: messageImageView.center.y)
        messageRight = CGPoint(x: messageImageView.center.x + messageRightOffset, y: messageImageView.center.y)
        
        archiveOffset = 260
        archiveRight = CGPoint(x: archiveIcon.center.x + archiveOffset, y: archiveIcon.center.y)
        
        deleteOffset = 260
        deleteRight = CGPoint(x: deleteIcon.center.x + deleteOffset, y: deleteIcon.center.y)
        
        laterOffset = -260
        laterLeft = CGPoint(x: laterIcon.center.x + laterOffset, y: laterIcon.center.y)
        
        listOffset = -260
        listLeft = CGPoint(x: listIcon.center.x + listOffset, y: listIcon.center.y)
        
        archiveIcon.alpha = 0.3
        deleteIcon.alpha = 0
        laterIcon.alpha = 0.3
        listIcon.alpha = 0
        
        let listTapGestureRecognizer = UITapGestureRecognizer(target: self, action: "OnCustomListTap:")
        let laterTapGestureRecognizer = UITapGestureRecognizer(target: self, action: "OnCustomLaterTap:")
        
        listView.userInteractionEnabled = true
        laterView.userInteractionEnabled = true
        
        listView.addGestureRecognizer(listTapGestureRecognizer)
        laterView.addGestureRecognizer(laterTapGestureRecognizer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanMessage(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        //let velocity = sender.velocityInView(view)
        
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
            
            if translation.x >= 60 && translation.x < 260 {
                
                laterIcon.alpha = 0
                listIcon.alpha = 0
                archiveIcon.alpha = 1
                deleteIcon.alpha = 0
                
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.messageImageView.center = self.messageRight
                    self.archiveIcon.center = self.archiveRight
                })
                
                delay(0.4) {
                    UIView.animateWithDuration(0.2, animations: { () -> Void in
                        self.backgroundView.alpha = 0
                        self.feedView.transform = CGAffineTransformMakeTranslation(0, -86)
                    })
                }
                
            } else if translation.x >= 260 {
                
                laterIcon.alpha = 0
                listIcon.alpha = 0
                archiveIcon.alpha = 0
                deleteIcon.alpha = 1
                
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.messageImageView.center = self.messageRight
                    self.deleteIcon.center = self.deleteRight
                })
                
                delay(0.4) {
                    UIView.animateWithDuration(0.2, animations: { () -> Void in
                        self.backgroundView.alpha = 0
                        self.feedView.transform = CGAffineTransformMakeTranslation(0, -86)
                    })
                }
                
            } else if translation.x <= -60 && translation.x > -260 {
                
                laterIcon.alpha = 1
                listIcon.alpha = 0
                archiveIcon.alpha = 0
                deleteIcon.alpha = 0
                
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.messageImageView.center = self.messageLeft
                    self.laterIcon.center = self.laterLeft
                })
                
                delay(0.2) {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.laterView.hidden = false
                        self.laterView.alpha = 1
                    })
                }
                
            } else if translation.x <= -260 {
                
                laterIcon.alpha = 0
                listIcon.alpha = 1
                archiveIcon.alpha = 0
                deleteIcon.alpha = 0
                
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.messageImageView.center = self.messageLeft
                    self.listIcon.center = self.listLeft
                })
                
                delay(0.2) {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.listView.hidden = false
                        self.listView.alpha = 1
                    })
                }
                
            } else {
                
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    self.messageImageView.center = self.messageOriginalCenter
                })
                
            }
            
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func OnCustomListTap(tapGestureRecognizer: UITapGestureRecognizer) {
        UIView.animateWithDuration(0.2) { () -> Void in
            self.listView.hidden = true
        }
        
        delay(0.1) {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.backgroundView.alpha = 0
                self.feedView.transform = CGAffineTransformMakeTranslation(0, -86)
            })
        }
    }
    
    func OnCustomLaterTap(tapGestureRecognizer: UITapGestureRecognizer) {
        UIView.animateWithDuration(0.2) { () -> Void in
            self.laterView.hidden = true
        }
        
        delay(0.1) {
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.backgroundView.alpha = 0
                self.feedView.transform = CGAffineTransformMakeTranslation(0, -86)
            })
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
