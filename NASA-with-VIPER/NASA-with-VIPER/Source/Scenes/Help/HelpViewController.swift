//
//  HelpViewController.swift
//  NASA-with-VIPER
//
//  Created by Arturo Carretero Calvo on 03/10/2018.
//  Copyright © 2018 Arturo Carretero Calvo. All rights reserved.
//

import UIKit
import WebKit

// MARK: - Protocols

protocol HelpViewControllerInputProtocol: class {
    var presenter: HelpPresenterInputProtocol? { get set }
    
    // Input functions from presenter to view
    // Funciones de entrada que van desde el presenter a la vista
    
    func loadURL(url: URL)
}

// MARK: - Class

class HelpViewController: UIViewController {
    // MARK: - Properties

    var presenter: HelpPresenterInputProtocol?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var closeButton: UIButton!

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configView()
        
        self.presenter?.viewDidLoad()
    }
    
    // MARK: - Config
    
    func configView() {
        self.closeButton.setTitle("Close", for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction func closeButton(_ sender: Any) {
        self.presenter?.userNeedCloseModule()
    }
}

extension HelpViewController: HelpViewControllerInputProtocol {
    // Implementations for input functions from presenter to view
    // Implementación de las funciones de entrada que van desde el presenter a la vista
    
    func loadURL(url: URL) {
        self.webView.navigationDelegate = self
        self.webView.allowsBackForwardNavigationGestures = true
        self.webView.load((URLRequest(url: url)))
    }
}

extension HelpViewController: WKNavigationDelegate {
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        debugPrint(#function)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        debugPrint(#function)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        debugPrint(#function)
        
        self.activityIndicator.stopAnimating()
        self.activityIndicator.alpha = 0.0
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        debugPrint(#function)
        
        self.activityIndicator.startAnimating()
        self.activityIndicator.alpha = 1.0
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        debugPrint(#function)
        
        debugPrint("webView:didFail: \(error.localizedDescription)")
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        debugPrint(#function)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        debugPrint(#function)
        
        debugPrint("webView:didFailProvisionalNavigation: \(error.localizedDescription)")
    }
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge,
                 completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        debugPrint(#function)
        completionHandler(.performDefaultHandling,nil)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        debugPrint(#function)
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        debugPrint(#function)
        decisionHandler(.allow)
    }
}
