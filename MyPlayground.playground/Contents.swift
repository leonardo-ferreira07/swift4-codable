
import Foundation
import PlaygroundSupport

//Simple Pastebin Type

struct PasteBin: Codable {
    let id: String
    let created_at: String
    let width: Int
    let height: Int
    let color: String
    let likes: Int
    let liked_by_user: Bool
    let user: User
}

struct User: Codable {
    let username: String
    let name: String
}

let session = URLSession.shared
let task = session.dataTask(with: URLRequest(url: URL(string: "http://pastebin.com/raw/wgkJgazE")!), completionHandler: {
    (data, response, error) in
    guard error == nil else {
        return
    }
    if let data = data {
//        print(try? JSONSerialization.jsonObject(with: data, options: .allowFragments))
        let pasteBin: [PasteBin]
        if let decoded = try? JSONDecoder().decode([PasteBin].self, from: data) {
            pasteBin = decoded
            print(pasteBin[1].user)
        }
    }
})
task.resume()

PlaygroundPage.current.needsIndefiniteExecution = true
