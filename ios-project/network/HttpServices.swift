//
//  HttpServices.swift
//  ios-project
//
//  Created by Kaining Xin on 29/03/2021.
//

import Foundation
import PromiseKit

class HttpServices {
    
//    get all activities
    static func getScheduleList() -> Promise<[Record<Field>]>{
        let urlRequest = "\(Constants.baseUrl)\(Constants.urlListSchedule)"
        return HttpClient.get(url: urlRequest,isList: true)
    }
    // get all locations
    static func getLocationList()->Promise<[Record<LocationField>]>{
        let urlRequest = "\(Constants.baseUrl)\(Constants.urlListLocation)"
        return HttpClient.get(url: urlRequest,isList: true)
    }
    
    //    get all sponsonrs
    static func getSponsorList() -> Promise<[Record<SponsorField>]>{
        let urlRequest = "\(Constants.baseUrl)\(Constants.urlListSponsors)"
        return HttpClient.get(url: urlRequest,isList: true)
    }
    
    //    get all speakers or attends
    static func getSpeakersOrAttendsList() -> Promise<[Record<SpeakerField>]>{
        let urlRequest = "\(Constants.baseUrl)\(Constants.urlListSpeakers)"
        return HttpClient.get(url: urlRequest,isList: true)
    }
    
    
    
    
    
    
    
//    get detail of activity
    static func getDetailOfActivity(id: String) -> Promise<[Record<Field>]>{
        let urlRequest = "\(Constants.baseUrl)\(Constants.urlRetrieveScheduleRecord)\(id)"
        return HttpClient.get(url: urlRequest,isList: false)
    }

    
//    get location by id
    static func getLocation(id: String) -> Promise<[Record<LocationField>]>{
        let urlRequest = "\(Constants.baseUrl)\(Constants.urlRetrieveLocation)\(id)"
        return HttpClient.get(url: urlRequest,isList: false)
    }
    
//    get speakers by id
    static func getSpeaker(id: String) -> Promise<[Record<SpeakerField>]>{
        let urlRequest = "\(Constants.baseUrl)\(Constants.urlRetriveSpeaker)\(id)"
        return HttpClient.get(url: urlRequest, isList: false)
    }
//    get sponsonr by id
    static func getSponsor(id: String) -> Promise<[Record<SponsorField>]>{
        let urlRequest = "\(Constants.baseUrl)\(Constants.urlRetriveSponsor)\(id)"
        return HttpClient.get(url: urlRequest, isList: false)
    }
    
//    get topic by id
    static func getTopic(id: String) -> Promise<[Record<TopicField>]>{
        let urlRequest = "\(Constants.baseUrl)\(Constants.urlRetriveTopic)\(id)"
        return HttpClient.get(url: urlRequest, isList: false)
    }
}
