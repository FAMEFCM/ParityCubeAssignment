//
//  CommonFunction.swift
//  LocumDay
//
//  Created by Bhuvan Sharma on 11/30/15.
//  Copyright © 2015 Bhuvan Sharma. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration
import CoreTelephony
let charactesAllowed = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

let kRememberLogin      = "userRememberLogin"
let kProjectName        = "FAI SEMINAR"
let kLocumId            = "FAI SEMINAR Id"
let kRegisterUserInfo   = "RegisterUserInfo"
let kImageProfile       = "profileImage"
let kImageProof         = "proofImage"
let kImageVisa          = "visaImage"
let kImagePolicy        = "policyImage"
let kImageQualification = "QualificationImage"
let kPasswordChange     = "changePassword"
let kPasswordForgot     = "forgotPassword"
let kUpdateProfile      = "UpdateProfile"
let kNotloggedJobAppliedId = "NotloggedJobAppliedid"

let lightGreyColor = UIColor(red: 197/255, green: 205/255, blue: 205/255, alpha: 1.0)
let darkGreyColor = UIColor(red: 52/255, green: 42/255, blue: 61/255, alpha: 1.0)
let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)

public enum Message: String
{
    case kUserTitleBlank                =        "Please select Title."
    case kUserNameBlank                 =        "Please enter user name."
    case kUserLastNameBlank             =        "Please enter last name."
    case kUserFirstNameBlank            =        "Please enter first name."
    
    
    case kUserPasswordBlank             =        "Please enter password."
    case kUserOldPasswordBlank          =        "Please enter old password."
    case kUserNewPasswordBlank          =        "Please enter new password."
    case kUserPasswordSpaceError        =        "Space Not Allowed in password"
    case kUserCPasswordBlank            =        "Please enter confirm password."
    case kUserPasswordValidation        =        "Password must be 8-16 characters."
    case kUserPasswordMatchError        =        "Confirm password doesn't match."

    
    case kNoInterNet                    =        "No internet available"
    case kUserEmailBlank                =        "Please enter email."
    case kUserEmailValid                =        "Please enter valid email."
    case kUserChooseTypeError           =        "Please select you are pharmacists or dispensing technician."
    case kUserAgreeMentError            =        "Please accept terms and conditions."
    case kUserGenderBlank               =        "Please select Gender."
    case kUserAddressBlankError         =        "Please enter address."
    case kUserCityBlankError            =        "Please enter city."
    case kUserStateBlankError           =        "Please enter county or state"
    case kUserPostcodeBlankError        =        "Please enter post code"
    case kUserPostcodeValidError        =        "Postcode must be less then 8 charaters"
    case kUserPhoneBlankError           =        "Please enter phone number."
    case kUserPhoneValidError           =        "Phone Number's length should be maximum 11 digits."
    case kUserMobileBlankError          =        "Please enter mobile number."
    case kUserMObileValidError          =        "Mobile Number's length should be maximum 11 digits."
    
    case kUserNIBlankError              =        "Please enter NI Number "
    case kUserGphcBlankError            =        "Please enter GphC Reference Number."
    case kUserGphcValidError            =        "GphC Reference Number's length should be maximum 20 digits."
    case kUserProofIdBlankError         =        "Please select Photo Id verification."
    
    //case kUserNatioanlityChooseError =      "Please confirm! Are you a GB/EU nationality?"
    //case kUserVisaChooseError =             "Please confirm! Do you require a Work Visa?"
    //case kUserResideChooseError =           "Please confirm! Do you permanently reside in the UK?"
    
    case kUserNatioanlityChooseError    =        "Please select GB/EU nationality"
    case kUserVisaChooseError           =        "Please select Work Visa"
    case kUserResideChooseError         =        "Please select reside in UK"
    
    case kUserUploadProofImageError     =        "Please upload proof id image."
    case kUserUploadVisaImageError      =        "Please upload Visa image."
    case kUserUploadInsuranceImageError      =        "Please upload insurance proof image."
    
    
    //shobhit
    case kIsVatRegisteredError          =        "Please confirm! Are you VAT Registered?"
    case kIsPersonalProfessnalError     =        "Please confirm! Do you have personal professional indemnity insurance?"
    case kIsNHSSmartCardError           =        "Please confirm! Do you have current NHS smart card?"
    
    case kRefusedFitnessError           =        "Please confirm! Have you been refused any fitness to practice applications?"
    case kDisciplinaryprocedureError    =        "Please confirm! Have you ever been involed, or are you currently involved with any disciplinary procedures relating to you work?"
    
    case kRegistrationConditionError    =        "Please confirm! Do you have any conditions applied to your registration?"
    
    case kSafeGuardError    =        "Please confirm! Have you had training on safe guarding children and vulnerable adults?"
    
    case kCriminalOffenceError          =        "Please confirm! Have you ever been convicted of a criminal offence?"
    case kOnlyConvictedError            =        "Please confirm! Is this your only conviction?"
    
    
    case kUserAccountNameBlankError     =        "Please enter account holder name."
    case kUserBankNameBlankError        =        "Please enter bank name."
    case kUserAccountNumberBlankError   =        "Please enter account number."
    case kUserAccountValidError =                "Account should have 8 digits."
    case kUserBankSortCodeBlankError    =        "Please enter bank sort code."
    case kUserBankSortCodeValidError    =        "Bank Sort Code should have 6 digits."
    
    case kUserAgeError                  =        "Age should be greater then 21."
    case kUserChoosePmrSystemError      =        "Please select at least one pmr system"
    case kUserDeleteQualificationError  =        "Are you sure you want to remove qualification?"
    case kUserDeleteExperienceError     =        "Are you sure you want to remove experience?"
    case kUserDeleteServiceError        =        "Are you sure you want to remove service?"
    case kUserOtherPmrBlankError        =        "Please fill other PMR system."
    
    case kUserStartEndDateError         =        "End Date should be greater then Start Date"
}


public enum NotificationName: String
{
    case kNotificationProgressBar   =       "NotificationProgressBar"
    case kNotificationBackProgressBar   =   "NotificationBackProgressBar"
    case kNotificationCompleteApplication   =   "NotificationCompleteApplication"
    case kNotificationUpdateViewController   =   "NotificationUpdateViewController"
    
    case kNotificationSearchNewJObData  =   "NotificationSearchNewJObData"
}

public enum UserProfileType: Int
{
    case kUserPharmacist   =   1
    case kUserDispencist   =   2
}

class CommonFunction : NSObject
{
    static let sharedInstance = CommonFunction()
    
    
    static func setLayerForView(vsType : UIView, borderColor bColor : UIColor, boderWidth width : CGFloat, cornerRadius radius : CGFloat)
    {
        vsType.layer.borderColor = bColor.cgColor
        vsType.layer.borderWidth = width
        vsType.layer.cornerRadius = radius
        vsType.layer.masksToBounds = true
    }
    
    
    func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    static func changeDateFormat(changeDate : NSDate, format : String) ->String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format //Set date style
        dateFormatter.timeZone = NSTimeZone() as TimeZone!
        let localDate = dateFormatter.string(from: changeDate as Date)
        return localDate
    }

   static func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func fetchErrorMessage(errors :[String?]) -> String {
        
        if errors.count > 0
        {
            var msg : String? = ""
            for object in errors{
                
                if object != nil {
                    if msg == "" {
                        msg = msg == nil ? object : "\(String(describing: object))"
                    }else {
                        msg = msg == nil ? object : "\(msg!)" + "\n" + "\(String(describing: object))"
                    }
                }
            }
            return msg!;
            
        }else {
            return "";
        }
    }
    
    static func priceControl(price :Double) ->  String
    {
        var priceConv :String?
        var priceC :Double?
        if  (price / 100)<999
        {
            
            priceC = price
            var prc = String(format: "%.2f" , priceC!)
            prc = prc.replacingOccurrences(of: " ", with: "")
            prc = prc.replacingOccurrences(of: ".00", with: "")
           // prc = prc.stringByReplacingOccurrencesOfString(".0", withString: "")
            priceConv = String(prc)
            
        }
        else if (price / 100000)<99
        {
            priceC = price / 100000
            var prc = String(format: "%.2f" , priceC!)
            prc = prc.replacingOccurrences(of: " ", with: "")
            prc = prc.replacingOccurrences(of: ".00", with: "")
           // prc = prc.stringByReplacingOccurrencesOfString(".0", withString: "")
            priceConv = String(prc) + "" + " L"
        }
        else
        {
            priceC = price / 10000000
            var prc = String(format: "%.2f" , priceC!)
            prc = prc.replacingOccurrences(of: " ", with: "")
            prc = prc.replacingOccurrences(of: ".00", with: "")
            // prc = prc.stringByReplacingOccurrencesOfString(".0", withString: "")
            priceConv = String(prc) + "" + " cr"
            


        }
        return  priceConv!
    }

    func compressImage (_ image: UIImage) -> UIImage {
        let actualHeight:CGFloat = image.size.height
        let actualWidth:CGFloat = image.size.width
        let imgRatio:CGFloat = actualWidth/actualHeight
        let maxWidth:CGFloat = 1024.0
        let resizedHeight:CGFloat = maxWidth/imgRatio
        let compressionQuality:CGFloat = 0.5
        
        let rect:CGRect = CGRect(x: 0, y: 0, width: maxWidth, height: resizedHeight)
        UIGraphicsBeginImageContext(rect.size)
        image.draw(in: rect)
        let img: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        let imageData:Data = UIImageJPEGRepresentation(img, compressionQuality)!
        UIGraphicsEndImageContext()
        
        return UIImage(data: imageData)!
        
    }

    func getTodayString() -> String{
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        
        let today_string = String(year!) + "-" + String(month!) + "-" + String(day!) + " " + String(hour!)  + ":" + String(minute!) + ":" +  String(second!)
        
        return today_string
        
    }
    
 ////////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: - validation
    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
    
    func isValidPincode(value: String) -> Bool {
        if value.characters.count == 6{
            return true
        }
        else{
            return false
        }
    }

    func validate(value: String) -> Bool {
        if value.characters.count == 10{
            return true
        }
        else{
            return false
        }
    }

    func ShadowEffect(view:UIView)  {
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 0.8, height: 0.4)
        view.layer.shadowRadius = 5.0
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
        view.layer.shouldRasterize = true
    }
    
    func connectionType() -> String{
        let networkInfo = CTTelephonyNetworkInfo()
        let networkString = networkInfo.currentRadioAccessTechnology
        var value = String()
        if networkString == CTRadioAccessTechnologyLTE{
            value = "4G"
        }else if networkString == CTRadioAccessTechnologyWCDMA{
            value = "3G"
        }else if networkString == CTRadioAccessTechnologyEdge{
            value = "2G"
        }
        return value
    }
    
    func load(URL: NSURL) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        let request = NSMutableURLRequest(url: URL as URL)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request as URLRequest) { (data: Data!, response: URLResponse!, error: Error!) in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("Success: \(statusCode)")
            }
            else {
                // Failure
                print("Failure: %@", error.localizedDescription);
            }
        }
        task.resume()
        
        
    }
}


