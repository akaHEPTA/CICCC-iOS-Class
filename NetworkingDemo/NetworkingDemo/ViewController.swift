//
//  ViewController.swift
//  NetworkingDemo
//
//  Created by Derrick Park on 5/14/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import UIKit

extension URL {
  func withQueries(_ queries: [String: String]) -> URL? {
    var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
    components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1) }
    return components?.url
  }
}

struct PhotoInfo: Codable {
  var title: String
  var description: String
  var url: String
  var copyright: String?
  
  enum CodingKeys: String, CodingKey {
    case title
    case description = "explanation"
    case url
    case copyright
  }
}

struct PhotoInfoAPI {
  static func fetchPhotoInfo(withQueries: [String: String], completion: @escaping (PhotoInfo) -> Void) {
    print(#function)
    // 1. url
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    
    let url = baseURL.withQueries(withQueries)!
    // 2. URLSession data task
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let data = data {
        if let photoInfo = try? JSONDecoder().decode(PhotoInfo.self, from: data) {
          // update UI or do something with the data
          print("got the photo info")
          completion(photoInfo)
        }
      }
    }
    
    // 3. resume
    task.resume()
  }
}

class ViewController: UIViewController {
  
  @IBOutlet var titleLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(#function)
    PhotoInfoAPI.fetchPhotoInfo(withQueries: [
      "date": "2005-2-22",
      "api_key": "DEMO_KEY"
    ]) { (photoInfo) in
      // Main thread (update UI)
      DispatchQueue.main.async {
        self.titleLabel.text = photoInfo.title
      }
    }
    print("after fetch photo")
  }
  
}
