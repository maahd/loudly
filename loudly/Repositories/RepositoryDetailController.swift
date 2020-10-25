//
//  RepositoryDetailController.swift
//  loudly
//
//  Created by Maahd Shahzad on 10/24/20.
//  Copyright © 2020 Maahd Shahzad. All rights reserved.
//

import Foundation

// send the query and decode it based on the Repositories struct
class RepositoryDetailController {
    func fetchRepositories(completion: @escaping (Repositories?) -> Void) {
        let baseURL = URL(string: "https://api.github.com/search/repositories")!

        let query: [String: String] = [
            "q": "tetris"
//            "page": "1",
//            "per_page": "10"
        ]

        let url = baseURL.withQueries(query)!

        let task = URLSession.shared.dataTask(with: url) { (data, respone, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let repositories = try? jsonDecoder.decode(Repositories.self, from: data) {
                completion(repositories)
            } else {
                print("Either no data was returned, or data was not properly decoded.")
                completion(nil)
            }
        }

        task.resume()
    }
}
