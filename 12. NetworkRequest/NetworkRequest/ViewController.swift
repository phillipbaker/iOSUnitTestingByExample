//
//  ViewController.swift
//  NetworkRequest
//
//  Created by Phillip Baker on 5/11/21.
//

import UIKit

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

class ViewController: UIViewController {

    @IBOutlet private(set) var button: UIButton!
    private var dataTask: URLSessionDataTask?
    
    var session: URLSessionProtocol = URLSession.shared
    
    private(set) var results: [SearchResult] = [] {
        didSet {
            handleResults(results)
        }
    }
    
    var handleResults: ([SearchResult]) -> Void = {
        print($0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonTapped() {
        searchForBook(terms: "out from boneville")
    }
    
    private func searchForBook(terms: String) {
        guard let encodedTerms = terms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: "https://itunes.apple.com/search?" + "media=ebook&term=\(encodedTerms)") else { return }
        
        let request = URLRequest(url: url)
        dataTask = session.dataTask(with: request) { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let self = self else { return }
//            let decoded = String(data: data ?? Data(), encoding: .utf8)
//            print("response: \(String(describing: response))")
//            print("data: \(String(describing: decoded))")
//            print("error: \(String(describing: error))")
            
            var decoded: Search?
            var errorMessage: String?
            
            if let error = error {
                errorMessage = error.localizedDescription
            }
            else if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                errorMessage = "Response: " + HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
            } else if let data = data {
                do {
                    decoded = try JSONDecoder().decode(Search.self, from: data)
                } catch {
                    errorMessage = error.localizedDescription
                }
            }
            
            DispatchQueue.main.async { [weak self] in
                guard let self  = self else { return }
               
                if let decoded = decoded     {
                    self.results = decoded.results
                }
                if let errorMessage = errorMessage {
                    self.showError(errorMessage)
                }
                
                self.dataTask = nil
                self.button.isEnabled = true
            }
        }
        button.isEnabled = false
        dataTask?.resume()
    }
    
    private func showError(_ message: String) {
        let title = "Network problem"
        print("\(title): \(message)")
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension URLSession: URLSessionProtocol {}

struct Search: Decodable {
    let results: [SearchResult]
}

struct SearchResult: Decodable, Equatable {
    let artistName: String
    let trackName: String
    let averageUserRating: Float
    let genres: [String]
}
