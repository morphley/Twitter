//
//  HomeDatasourceController.swift
//  Twitter
//
//  Created by Morphley on 21.03.17.
//  Copyright © 2017 Morphley. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceController: DatasourceController {
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        setupNavigationBarItems()
        //
        //        let homeDateSource = HomeDatasource()
        //        self.datasource = homeDateSource // 3 items in my collectionView
        
        fetchHomeFeed()
    }
    
    
    // create the tron object
    
    let tron = TRON(baseURL: "http://api.letsbuildthatapp.com")
    
    
    class Home: JSONDecodable{
        
        let users: [User]
        
        required init(json: JSON) throws {
           // print("Now ready to parse json: \n", json)
            
            var users = [User]()
            
            let array = json["users"].array
            for userJson in array! {
                let name = userJson["name"].stringValue
                let username = userJson["username"].stringValue
                let bio = userJson["bio"].stringValue
                
                let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            
              //  print(userJson["name"].stringValue)
            
                print(user.username)
                users.append(user)
                
            }
            self.users = users
            
        }
        }
    
    
    class JSONError: JSONDecodable{
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
    
    
    fileprivate func fetchHomeFeed(){
        // start our json fetch
        
        // returns a request object Generics left success right failure
        let request: APIRequest<HomeDatasource,JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDatasource) in
            print("Succesfully fetched our json objects")
            
            
            print(homeDatasource.users.count)
            self.datasource = homeDatasource
            
            
        }, failure: { (err) in
            print("Failed to fetch json...", err)
        })
        
        
        
        //normal you make a network request  and then parse the json using library lets
        //use tron instead
        //URLSession.shared.dataTask(with: <#T##URL#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        
        
        
    }
    
    
    //gap between two cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 1{
            
            return .zero
        } else{
            return CGSize(width: view.frame.width, height: 50)
            
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = self.datasource?.item(indexPath) as? User {
            //   user.bioText
            // estimation for the height of our cells based on user.bioText
            
            let approximatedWidthOfBioTextView = view.frame.width - 12-50-12-2
            let size = CGSize(width: approximatedWidthOfBioTextView, height: 1000)
            
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
            
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
            
        }
        
        
        
        
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
    //Footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        
        if section == 1{
            
            return .zero
        } else{
            return CGSize(width: view.frame.width, height: 64)
            
        }
    }
    
}






