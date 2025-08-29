import UIKit

class AuthViewController: UIViewController {
    
    private let authStack = UIStackView()
    private let loginLabel = UILabel()
    private let loginTextField = UITextField()
    private let passLabel = UILabel()
    private let passTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Авторизация"
        setupStackView()
        addViews()
        setupConstraints()
    }
    
    private func setupStackView() {
        authStack.translatesAutoresizingMaskIntoConstraints = false
        authStack.axis = .vertical
        authStack.spacing = 10
        authStack.distribution = .fillEqually
        authStack.alignment = .center
        loginLabel.text = "Логин"
        loginTextField.placeholder = "Введите логин"
        passLabel.text = "Пароль"
        passTextField.placeholder = "Введите пароль"
        
    }
    
    private func addViews() {
        view.addSubview(authStack)
        authStack.addArrangedSubview(loginLabel)
        authStack.addArrangedSubview(loginTextField)
        authStack.addArrangedSubview(passLabel)
        authStack.addArrangedSubview(passTextField)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            authStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            authStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            authStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            authStack.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
}
