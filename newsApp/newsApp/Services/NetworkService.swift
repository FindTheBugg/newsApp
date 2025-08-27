import Foundation

class NetworkService: NetworkServiceProtocol {
    
    func generationAPINewsURL() -> String {
        
        let currentDate = Date()
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy-MM-dd"
        let dateString = dateFormatter.string(from: yesterday)
        let apiKey = "2b9408d64efc4866a02610dd27023251"
        let urlString = "https://newsapi.org/v2/everything?q=tesla&from=\(dateString )&sortBy=publishedAt&language=ru&apiKey=\(apiKey)"
        
        return urlString
    }
    
    func fetchNews(completion: @escaping (Result<[Article], Error>) -> Void) {
        
        let newsURL = generationAPINewsURL()
        
        guard let url = URL(string: newsURL) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(NewsResponse.self, from: data)
                completion(.success(response.articles))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
