//
//  ViewController.swift
//  newsApp
//
//  Created by gurtovoy.v on 15.08.2025.
//

import UIKit

class FirstViewController: UIViewController, PostViewProtocol {
    
    //MARK: - Property
    private let textView = UITextView()
    private var presenter: PostPresenterProtocol!
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Новостная лента"
        setupView()
        setupPresenter()
    }
    
    //MARK: - Setup Func
    private func setupView() {
        textView.isScrollEnabled = true
        textView.frame = view.bounds
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textColor = .darkGray
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 8
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        NSLayoutConstraint.activate([
                    // Констрейнты для TextView
                    textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                    textView.heightAnchor.constraint(equalToConstant: 650),
                ])
    }
    
//    @objc private func didTapNextButton() {
//        let secondViewController = SecondViewController()
//
//        navigationController?.pushViewController(secondViewController, animated: true)
//    }
    
    private func setupPresenter() {
        let networkService = NetworkService()
        presenter = PostPresenter(view: self, networkService: networkService)
        presenter.fetchNews()
    }
    
    func displayNews(_ articles: [Article]) {
        DispatchQueue.main.async {
            let newsText = articles.map { article in
                   """
                   \(article.title)
                   \(article.description ?? "No description")
                   \(article.url)
                   
                   """
            }.joined(separator: "\n---\n")
            
            self.textView.text = newsText
        }
    }
    
    func showError (_ error: Error) {
        DispatchQueue.main.async {
            self.textView.text = "Error: \(error.localizedDescription)"
        }
    }
}
