

import UIKit

class RootViewController: UIViewController{

    internal let  userService         =  UserServices()
    internal let  commonFunction       =  CommonFunction()


    func showNormalAlert(title : String!, msg : String!)
    {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            alert.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertMsg(title : String!, msg : String,arrAction: NSArray!)
    {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showActivityIndicator() {
            self.view.makeToastActivity(message: "Loading...")
           // UIApplication.shared.beginIgnoringInteractionEvents();
    }
    
    func hideActivityIndicator(){
            self.view.hideToastActivity()
            //UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    func pushTransiction(controlllerName:UIViewController){
        let transition:CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.pushViewController(controlllerName, animated: false)
    }
}
