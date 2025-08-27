import UIKit

class SecondViewController: UIViewController {
    
    let label: UILabel = {
          let label = UILabel()
          label.numberOfLines = 0
          label.textAlignment = .center
          label.font = UIFont.boldSystemFont(ofSize: 20)
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        setupConstraints()
        view.backgroundColor = .white
                title = "избранное"
    }
    
    private func setupConstraints() {
            NSLayoutConstraint.activate([
                
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        }
    
}
