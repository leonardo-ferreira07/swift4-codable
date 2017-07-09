
import Foundation
import PlaygroundSupport

//Simple Pastebin Type

struct PasteBin: Codable {
    let id: String?
    let created_at: String?
    let width: Int?
    let height: Int?
    let color: String?
    let likes: Int?
    let liked_by_user: Bool?
    let user: User?
    let categories: [Categorie]?
    let links: Link?
}

struct User: Codable {
    let id: String?
    let username: String?
    let name: String?
    let nickname: String?
    let links: Link?
    let profile_image: ProfileImage?
}

struct ProfileImage: Codable {
    let small: String?
    let medium: String?
    let large: String?
}

struct Categorie: Codable {
    let id: Int?
    let title: String?
    let photo_count: Int?
}

struct Link: Codable {
    let photos: String?
    let html: String?
    let likes: String?
    let download: String?
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
            print(pasteBin[0])
        }
    }
})
task.resume()

PlaygroundPage.current.needsIndefiniteExecution = true
