//
//  SentVC.swift
//  FAI Annual Seminar
//
//  Created by IKSL_IT on 18/08/17.
//  Copyright © 2017 IKSL_IT. All rights reserved.
//

import UIKit
import SDWebImage
import Font_Awesome_Swift
class TopDealsVC: RootViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet var tblTopDeals: UITableView!
    @IBOutlet var lblNoData: UILabel!
     
    var arrTopDeals = [DealsDataResModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
//
//        tblTopDeals.rowHeight = UITableViewAutomaticDimension
//        tblTopDeals.estimatedRowHeight = 300
//        //self.tblAppointment.contentInset = UIEdgeInsetsMake(-36, 0, -20, 0);
        lblNoData.isHidden = true
        callTopDealsApi()
    }
    

    func callTopDealsApi() {
        if CommonFunction.sharedInstance.isConnectedToNetwork(){
            self.showActivityIndicator()
          
            userService.TopDealsData(callback: callbackTopDetails(flag:response:msg:isinternet:))
        }
        else{
            self.showNormalAlert(title: kProjectName, msg: Message.kNoInterNet.rawValue)
        }
    }

    func callbackTopDetails(flag : Bool, response: DealsResModel?, msg: String?,isinternet : Bool ) {
        self.hideActivityIndicator()
        if flag{
            arrTopDeals = (response ?? DealsResModel()).data
            if arrTopDeals.count != 0{
                tblTopDeals.delegate = self
                tblTopDeals.dataSource = self
                tblTopDeals.reloadData()
            }else{
                lblNoData?.isHidden = false
            }
        }else{
            self.view.makeToast(message: msg ?? "Network Error", duration: 2.0, position: HRToastPositionCenter as AnyObject)
            lblNoData?.isHidden = false
        }
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTopDeals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblTopDeals.dequeueReusableCell(withIdentifier: "DealsTVCell", for: indexPath) as!  DealsTVCell
    
        cell.lblTitle.text = arrTopDeals[indexPath.row].title ?? ""
        
        let attr: [NSAttributedStringKey: Any] = [NSAttributedStringKey(rawValue: kCTFontAttributeName as String): UIFont(name: "OpenSans", size: 15)!]
        let htmlText = arrTopDeals[indexPath.row].des ?? ""
        if let htmlData = htmlText.data(using: String.Encoding.unicode) {
            do {
                let attributedText = try NSMutableAttributedString(data: htmlData, options: [NSAttributedString.DocumentReadingOptionKey.documentType:NSAttributedString.DocumentType.html], documentAttributes: nil)
                attributedText.addAttributes(attr, range: NSRange(location: 0, length: attributedText.length))
                
                cell.lblDetail.attributedText = attributedText
            } catch let e as NSError {
                print("Couldn't translate \(htmlText): \(e.localizedDescription) ")
            }
        }
        
        if arrTopDeals[indexPath.row].off_percent != ""{
            cell.imgOfferWidth.constant = 50
            cell.imgOfferHeight.constant = 50
            cell.lblOffer.text = "\(arrTopDeals[indexPath.row].off_percent ?? "")% \n off"
        }else{
            cell.imgOfferWidth.constant = 0
            cell.imgOfferHeight.constant = 0
            cell.lblOffer.text = ""
        }

        cell.imgDeal.sd_setImage(with: URL(string: "\(arrTopDeals[indexPath.row].image ?? "")"), placeholderImage: UIImage(named: "noimage"))
        cell.lblChat.setFAText(prefixText: "", icon: FAType.FAWeixin, postfixText: " \(arrTopDeals[indexPath.row].comments_count ?? 0)", size: 15.0)
        cell.lblShare.setFAText(prefixText: "", icon: FAType.FAShare, postfixText: " \(arrTopDeals[indexPath.row].view_count ?? 0)", size: 15.0)
        cell.lblPrice.text = "₹ "+"\(arrTopDeals[indexPath.row].current_price ?? 0)"
        let val = arrTopDeals[indexPath.row].merchant ?? MarchantResModel()
        cell.lblPriceType.text = val.name ?? ""
        
        return cell
    }

}

