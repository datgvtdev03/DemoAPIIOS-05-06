//
//  ViewController.swift
//  DemoAPIIOS
//
//  Created by Thanh Dat on 05/06/2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var conversations: [ConversationResponse] = []
    
    @IBOutlet weak var tblConversations: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //                callAPIGetConversations()
        //        callAPICreatAConversation()
        //        callAPIPutConversation()
        //        callAPIDeleteConversation()
        getConversations()
        tblConversations.delegate = self
        tblConversations.dataSource = self
    }
    
        func callAPIGetConversations() {
            AF.request("https://647df67daf984710854ab269.mockapi.io/conversations").response { response in
                debugPrint(response)
            }
    
        }
    
        func callAPICreatAConversation() {
            let conversation1 = Conversation(id: "51", name: "Lop hoc vui ve", avatar: "avt1.png")
            AF.request("https://647df67daf984710854ab269.mockapi.io/conversations",
                       method: .post,
                       parameters: conversation1,
                       encoder: JSONParameterEncoder.default).response { response in
                debugPrint(response)
    
            }
        }
    
        func callAPIPutConversation() {
            let newConversation1 = Conversation(id: "51", name: "K17", avatar: "avt2.png")
            AF.request("https://647df67daf984710854ab269.mockapi.io/conversations/51",
                       method: .put,
                       parameters: newConversation1,
                       encoder: JSONParameterEncoder.default).response { response in
                debugPrint(response)
    
            }
        }
    
        func callAPIDeleteConversation() {
            AF.request("https://647df67daf984710854ab269.mockapi.io/conversations/52",
                       method: .delete).response { response in
                debugPrint(response)
    
            }
    
        }
    
    func getConversations() {
        AF.request("https://647df67daf984710854ab269.mockapi.io/conversations",
                   method: .get).responseDecodable(of: Conversations.self) { response in
            if let listConversations = response.value {
                self.conversations = listConversations
                self.tblConversations.reloadData()
                debugPrint("Data:", response.value![1])
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblConversations.dequeueReusableCell(withIdentifier: "ConversationIdentifier")!
        let nameConversation = cell.viewWithTag(101) as! UILabel
        nameConversation.text = conversations[indexPath.row].name
        let avatarConversation = cell.viewWithTag(102) as! UILabel
        avatarConversation.text = conversations[indexPath.row].avatar
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
