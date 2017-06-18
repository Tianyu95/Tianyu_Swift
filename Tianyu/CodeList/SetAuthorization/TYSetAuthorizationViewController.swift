//
//  TYSetAuthorizationViewController.swift
//  Tianyu
//
//  Created by ChenTianyu on 2017/6/2.
//  Copyright © 2017年 ChenTianyu. All rights reserved.
//

import UIKit
import CoreLocation
import UserNotifications
import Photos
import CoreTelephony
import Contacts
import EventKit
import Foundation


class TYSetAuthorizationViewController: UIViewController {

    var locationManager: CLLocationManager?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false

        let titlesArray = ["开启定位","开启通知","开启照片","开启相机","开启权限","开启蜂窝数据","开启麦克风","开启通讯录","开启提醒","开启日历"]
        
        for i in 0 ..< titlesArray.count
        {
            let btn = UIButton()
            btn.tag = i + 100
            btn.setTitle(titlesArray[i], for: .normal)
            btn.frame = CGRect(x: (self.view.frame.size.width-160)/2, y: 70+50*CGFloat(i), width: 160, height: 40)
            btn.backgroundColor = UIColor.lightGray
            btn.addTarget(self, action: #selector(btnAction(btn:)), for: .touchUpInside)
            self.view.addSubview(btn)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func btnAction(btn:UIButton) {
        let tag = btn.tag
        
        switch tag {
        case 100://获取定位权限
            locationManager = CLLocationManager()
            let authorizationStatus = CLLocationManager.authorizationStatus()
            if authorizationStatus == .notDetermined || authorizationStatus == .denied {
                self.showTipsAlertViewWith(Title: "提示", Message: "请在设置->隐私->定位服务里打开", Url: "app-Prefs:root=Privacy&path=LOCATION")
            }
            break
            
        case 101://获取推送通知权限
            if #available(iOS 10.0, *) {
                let notificationCenter = UNUserNotificationCenter.current()
                notificationCenter.getNotificationSettings(completionHandler: { (notificationSettings) in
                    if notificationSettings.authorizationStatus != .denied ||
                        notificationSettings.authorizationStatus != .notDetermined
                        {
                            self.showTipsAlertViewWith(Title: "提示", Message: "请在设置->通知->SwiftDemos里打开", Url: "app-Prefs:root=NOTIFICATIONS_ID&path=com.HemingTai.SwiftDemos")
                    }
                })
            }
            break
        case 102://获取照片权限
            let photoLibraryStatus = PHPhotoLibrary.authorizationStatus()
            if photoLibraryStatus == .notDetermined || photoLibraryStatus == .denied{
                self.showTipsAlertViewWith(Title: "提示", Message: "请在设置->隐私->照片里打开", Url: "app-Prefs:root=Privacy&path=PHOTOS")
            }
            break
        case 103://获取相机权限
            let cameraStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo)
            if cameraStatus == .notDetermined || cameraStatus == .denied {
                self.showTipsAlertViewWith(Title: "提示", Message: "请在设置->隐私->相机里打开", Url: "app-Prefs:root=Privacy&path=CAMERA")
            }
            
            break
        case 104://获取联网权限
            let cellularData = CTCellularData()
            let cellularDataStatus = cellularData.restrictedState
            if cellularDataStatus == .restrictedStateUnknown || cellularDataStatus == .restricted {
                self.showTipsAlertViewWith(Title: "提示", Message: "请在设置->蜂窝移动网络里打开", Url: "app-Prefs:root=MOBILE_DATA_SETTINGS_ID")
            }
            
            break
        case 105://获取麦克风权限
            let audioStatus = AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeAudio)
            if audioStatus == .notDetermined || audioStatus == .denied {
                self.showTipsAlertViewWith(Title: "提示", Message: "请在设置->隐私->麦克风里打开", Url: "app-Prefs:root=Privacy&path=MICROPHONE")
            }
            
            break
        case 106: //获取通讯录权限
            //@available(iOS 9.0, *) 9.0之前用ABAddressBook
            let contactStoreStatus = CNContactStore.authorizationStatus(for: .contacts)
            if contactStoreStatus == .notDetermined || contactStoreStatus == .denied {
                self.showTipsAlertViewWith(Title: "提示", Message: "请在设置->隐私->通讯录里打开", Url: "app-Prefs:root=Privacy&path=CONTACTS")
            }
            
            break
        case 107://获取提醒事项权限
            let eventStoreStatus = EKEventStore.authorizationStatus(for: .reminder)
            if eventStoreStatus == .notDetermined || eventStoreStatus == .denied {
                self.showTipsAlertViewWith(Title: "提示", Message: "请在设置->隐私->提醒事项里打开", Url: "app-Prefs:root=Privacy&path=REMINDER")
            }
            
            break
        case 108://获取定位权限
            
            break
        case 109://获取日历权限
            let calendarStatus = EKEventStore.authorizationStatus(for: .event)
            if calendarStatus == .notDetermined || calendarStatus == .denied {
                self.showTipsAlertViewWith(Title: "提示", Message: "请在设置->隐私->日历里打开", Url: "app-Prefs:root=Privacy&path=CALENDARS")
            }
            
            break

        default:
            self.showTipsAlertViewWith(Title: "提示", Message: "请在设置->SwiftDemos里打开相应权限", Url: "app-Prefs:root=com.HemingTai.SwiftDemos")

        }
    }
    
    func showTipsAlertViewWith(Title title:String, Message message:String, Url url:String ) {
        
        let tipsAlertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel)
        {
            (action) in
            self.dismiss(animated: true, completion: nil)
        }
        let sureAction = UIAlertAction(title: "确定", style: .default)
        {
            (action) in
            if UIApplication.shared.canOpenURL(URL(string:url)!)
            {
                if #available(iOS 10.0, *)
                {
                    UIApplication.shared.open(URL(string: url)!, options:[:], completionHandler: nil)
                }
            }
        }
        
        tipsAlertView.addAction(cancelAction)
        tipsAlertView.addAction(sureAction)
        
        self.present(tipsAlertView, animated: true, completion: nil)
    }

}
