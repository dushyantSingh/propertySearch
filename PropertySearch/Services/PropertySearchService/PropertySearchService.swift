//
//  PropertySearchService.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 26/10/21.
//

import RxSwift

enum Environment {
    case Dev
}

extension Environment {
    func path() -> URL {
        return URL(string: "https://ninetyninedotco-b7299.asia-southeast1.firebasedatabase.app/listings.json")!
    }
    func detailPath(_ id: Int) -> URL {
        return URL(string: "https://ninetyninedotco-b7299.asia-southeast1.firebasedatabase.app/details/\(id).json")!
    }
}

class PropertySearchService: PropertySearchType {
    func getPropertyDetails(_ id: Int) -> Observable<PropertyDetail?> {
        Observable.create { observe in
            URLSession.shared.dataTask(with: Environment.Dev.detailPath(id)) { (data, response, error) -> Void in
                let decoder = JSONDecoder()
                if let data = data,
                   let details = try? decoder.decode(PropertyDetail.self,
                                                        from: data) {
                    observe.onNext(details)
                    observe.onCompleted()
                } else {
                    observe.onNext(nil)
                    observe.onCompleted()
                }
            }
            .resume()
            return Disposables.create {}
        }
    }
    
    func getDefaultProperties() -> Observable<[Property]> {
        Observable.create { observe in
            URLSession.shared.dataTask(with: Environment.Dev.path()) { (data, response, error) -> Void in
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let data = data,
                   let properties = try? decoder.decode([Property].self,
                                                        from: data) {
                    observe.onNext(properties)
                    observe.onCompleted()
                } else {
                    observe.onNext([])
                    observe.onCompleted()
                }
            }
            .resume()
            return Disposables.create {}
        }
    }
}
