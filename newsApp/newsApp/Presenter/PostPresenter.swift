import Foundation

class PostPresenter: PostPresenterProtocol {
    private weak var view: PostViewProtocol?
    private let networkService: NetworkServiceProtocol
    
    init(view: PostViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
    }
    
    func fetchNews() {
        networkService.fetchNews { [weak self] result in
            switch result {
            case .success(let articles):
                self?.view?.displayNews(articles)
            case .failure(let error):
                self?.view?.showError(error)
            }
        }
    }
}
