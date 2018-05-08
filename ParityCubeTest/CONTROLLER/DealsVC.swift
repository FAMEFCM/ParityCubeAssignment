//
//  ScheduleDetailVC.swift
//  FAI Annual Seminar
//
//  Created by IKSL_IT on 27/07/17.
//  Copyright © 2017 IKSL_IT. All rights reserved.
//

import UIKit
import Font_Awesome_Swift
class DealsVC: RootViewController{
    
    var pageMenu : CAPSPageMenu?
    @IBOutlet var btnSide: UIButton!
    @IBOutlet var btnMenu: UIButton!
    @IBOutlet var btnBottom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSide.setFAIcon(icon: .FAThList, forState: .normal)
        btnMenu.setFAIcon(icon: .FAThLarge, forState: .normal)
        btnBottom.setFAIcon(icon: .FAClose, forState: .normal)
        
        PageMenuData()
    }
    
    func PageMenuData(){
        var controllerArray : [UIViewController] = []
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller1 : TopDealsVC = storyboard.instantiateViewController(withIdentifier: "TopDealsVC") as! TopDealsVC
        controller1.title = "Top"
        controllerArray.append(controller1)
        
        let controller2 : PopularDealsVC = storyboard.instantiateViewController(withIdentifier: "PopularDealsVC") as! PopularDealsVC
        controller2.title = "Popular"
        controllerArray.append(controller2)
        
//        var size = CGFloat()
//        switch UIDevice.current.userInterfaceIdiom {
//        case .phone:
//            size =  14.0
//            break
//        case .pad:
//            size = 20.0
//            break
//        default:
//            size = 14.0
//            break
//        }
//        
        let parameters: [CAPSPageMenuOption] = [

            .ScrollMenuBackgroundColor(UIColor.white),
            .ViewBackgroundColor(UIColor.clear),
            .SelectionIndicatorColor(UIColor(hex:"00A4E7")),
            .MenuItemFont(UIFont(name: "OpenSans-SemiBold", size: 16.0)!),
            .MenuHeight(40.0),
            .MenuItemWidth(CGFloat(self.view.frame.size.width/2) - 20),
            .CenterMenuItems(true),
            .SelectedMenuItemLabelColor(UIColor(hex:"00A4E7")),
            
            .UnselectedMenuItemLabelColor(UIColor.black)
        ]
        let scrollSize = CGSize(width: self.view.frame.size.width/3,height: 40.0)
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x:0.0,y: 64.0,width: self.view.frame.width,height: self.view.frame.height-64-50), pageMenuOptions: parameters)
        self.addChildViewController(pageMenu!)
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray
        label.frame = CGRect(x: 0, y: 40, width: self.view.frame.size.width, height: 1.0)
        pageMenu?.view.addSubview(label)
        pageMenu?.menuScrollView.contentSize = scrollSize
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMove(toParentViewController: self)
        
    }
    
    override func shouldAutomaticallyForwardRotationMethods() -> Bool {
        return true
    }

}
