import Foundation

protocol NetworkServiceProtocol {
    func generationAPINewsURL() -> String
    func fetchNews(completion: @escaping (Result<[Article], Error>) -> Void)
}
