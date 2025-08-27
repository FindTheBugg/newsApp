import UIKit

protocol PostViewProtocol: AnyObject {
    func displayNews(_ articles: [Article])
    func showError(_ error: Error)
}
