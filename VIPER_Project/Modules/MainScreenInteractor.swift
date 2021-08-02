//
//  MainScreenInteractor.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 23.07.2021.
//

import Foundation
import UIKit

protocol MainScreenInteractorProtocol: AnyObject {
    func loadPicturesList(completion: ([PictureObject]) -> Void)
    func loadImage(index: Int, completion: (UIImage) -> Void)
}

final class MainScreenInteractor {
    private var mocPictureList: [PictureObject] = [PictureObject(id: 1, title:
                                                                    """
aerial view of green trees during daytime
""",
                                                                 url: """
aerial view of green trees during daytime
"""),
                                                   PictureObject(id: 2,
                                                                 title: """
white and pink flower in tilt shift lens
""",
                                                                 url: """
white and pink flower in tilt shift lens
"""),
                                                   PictureObject(id: 3,
                                                                 title:
                                                                    """
black and white ceramic mugs on brown wooden table
""",
                                                                 url: """
black and white ceramic mugs on brown wooden table
"""),
                                                   PictureObject(id: 4,
                                                                 title: """
white concrete building under blue sky during daytime
""",
                                                                 url: """
white concrete building under blue sky during daytime
""")]
}

// MARK: - MainScreenInteractorProtocol
extension MainScreenInteractor: MainScreenInteractorProtocol {
    func loadPicturesList(completion: ([PictureObject]) -> Void) {
        completion(mocPictureList)
    }

    func loadImage(index: Int, completion: (UIImage) -> Void) {
        let imageName = mocPictureList[index].url
        let fileManager = FileManager.default
        guard  let path = Bundle.main.resourcePath else { fatalError() }
        guard let items = try? fileManager.contentsOfDirectory(atPath: path) else { fatalError() }
        for item in items {
            if item.hasPrefix(imageName) {
                print(item)
                guard let returnImage = UIImage(named: item) else { fatalError()}
                    completion(returnImage)
                }
            }
        }
    }
