//
//  ViewController.swift
//  Develop
//
//  Created by Artem Shimanski on 27.11.16.
//  Copyright © 2016 Artem Shimanski. All rights reserved.
//

import UIKit
import EVEAPI
import Alamofire

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	var session: URLSession?
	
	@IBAction func onButton(_ sender: Any) {
		let configuration = URLSessionConfiguration.default
		configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
		
		/*session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
		let task = session!.dataTask(with: URL(string: "http://refreshyourcache.com/cache-test/test.php")!)
		task.resume()*/
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}


extension ViewController: URLSessionDataDelegate {
	func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
		let image = UIImage(data: data)
		print("\(image)")
	}
	
	func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
		print("\(error)")
	}
}
