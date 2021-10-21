//
//  StarwarsModel.swift
//  StarwarsFinalSteps
//
//  Created by Rodrigo Leyva on 10/20/21.
//

import Foundation
import Alamofire

class StarwarsModel{
    
    static func getAllPeople(completionHandler:@escaping (_ model: PeopleResult?) -> Void){
        
        AF.request("https://swapi.dev/api/people/?format=json").responseDecodable(of: PeopleResult.self){ response in
            
            if let peopleData = response.value{
                
                    completionHandler(peopleData)
                
            }
            
        }
        
    }
    
    
    static func getAllFilms(completionHandler:@escaping (_ model: FilmResult?) -> Void){
        AF.request("https://swapi.dev/api/films/?format=json").responseDecodable(of: FilmResult.self){
            response in
            
            if let filmData = response.value{
                completionHandler(filmData)
            }
        }
    }
    
    static func getSpecies(urlString: String,completionHandler:@escaping (_ model: Species?) -> Void){
        AF.request(urlString).responseDecodable(of: Species.self){
            response in
            
            if let speciesData = response.value{
                completionHandler(speciesData)
            }
        }
    }
}
