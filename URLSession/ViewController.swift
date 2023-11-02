//
//  ViewController.swift
//  URLSession
//
//  Created by Татьяна Магнушевская on 25.10.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var immageOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func GetImageButton(_ sender: Any) {
        
        // 1) Получить API
        let api = "https://picsum.photos/1024/1024"
        // 2) Создать URL (создать get запрос)
        guard let apiURL = URL(string: api) else {
            fatalError("Some error")
        }
        // 3) Инициализировать сессию
        let session = URLSession(configuration: .default)
        // 4) Cоздать запрос dataTask
        let task = session.dataTask(with: apiURL) {(data, response, error) in
        // 5) Обработать полученные данные
            guard let data = data, error == nil else {return}
        // После полученные данные передать в immageView в главном потоке асинхронно чтобы не заблокироваь интерфейс
            DispatchQueue.main.async {
        // data = .jpg
                self.immageOutlet.image = UIImage(data: data)
            }
        }
        //Запустить запрос
        task.resume()
        
        
    }
    
    
}

