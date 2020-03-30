//
//  MarvelAPI.swift
//  HeroisMarvel
//
//  Created by Glayce on 30/03/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPI {
    
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static private let privateKey = "7c35b1241e7da0f24e04d9c1d7b5360804c38cc4"
    static private let publicKey = "939a0aa82c5e5eb59b9f101ee831d037"
    static private let limit = 50
    
    class func loadHeros(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?
        ) -> Void) {
        let offset = page * limit
        let startsWith: String
        
        if let name = name, !name.isEmpty{
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = ""
        }
        
        let url = basePath + "offset=\(offset)&limit=\(limit)&" + startsWith + getCredentials()
        print(url)
        
        //Realiza a comunicacao com a api da marvel atraves do alamofire
        AF.request(url).responseJSON { (response) in
            //Obtem o retorno da api
            guard let data = response.data else {
                onComplete(nil)
                return
            }
            
            do {
                //Convertendo para o tipo marvelInfo
                let marvelInfo = try JSONDecoder().decode(MarvelInfo.self, from: data)
                onComplete(marvelInfo)
            } catch {
                print(error.localizedDescription)
                onComplete(nil)
            }
        }
    }
    
    private class func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
