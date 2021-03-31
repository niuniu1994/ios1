//
//  Structs.swift
//  ios-project
//
//  Created by Kaining Xin on 28/03/2021.
//

import Foundation
struct Response<T: Decodable> : Decodable {
    let records:[Record<T>]
}

struct Record<T : Decodable>: Decodable,Identifiable {
    let id: String
    let fields:T
    let createdTime: String
    
    private enum CodingKeys: String, CodingKey {
         case id, createdTime
         case fields
     }
}

struct LocationField:Decodable {
    let description: String
    let spaceName: String
    let photos:[Photo]
    let buildingLocation: String
    let maxCapacity: Int
 
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        description = try values.decodeIfPresent(String.self, forKey: .description) ?? ""
        spaceName = try values.decodeIfPresent(String.self, forKey: .spaceName) ?? ""
        photos = try values.decodeIfPresent([Photo].self, forKey: .photos) ?? []
        buildingLocation = try values.decodeIfPresent(String.self, forKey: .buildingLocation) ?? ""
        maxCapacity = try values.decodeIfPresent(Int.self, forKey: .maxCapacity) ?? 0
    }
    
    private enum CodingKeys: String, CodingKey {
          case description = "Description"
          case spaceName = "Space name"
          case photos = "Photo(s)"
          case buildingLocation = "Building location"
          case maxCapacity = "Max capacity"
     }
}

struct SpeakerField:Decodable{
    let role: String
    let company: [String]
    let status: String
    let email: String
    let type: String
    let speakingAt:[String]
    let name: String
    let phone: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        role = try values.decodeIfPresent(String.self, forKey: .role) ?? ""
        company = try values.decodeIfPresent([String].self, forKey: .company) ?? []
        status = try values.decodeIfPresent(String.self, forKey: .status) ?? ""
        email = try values.decodeIfPresent(String.self, forKey: .email) ?? ""
        type = try values.decodeIfPresent(String.self, forKey: .type) ?? ""
        speakingAt = try values.decodeIfPresent([String].self, forKey: .speakingAt) ?? []
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        phone = try values.decodeIfPresent(String.self , forKey: .phone) ?? ""
        
    }
    
    private enum CodingKeys: String, CodingKey {
          case role = "role"
          case company = "Company"
          case status = "Status"
          case email = "Email"
          case type = "Type"
          case speakingAt = "Speaking at"
          case name = "Name"
          case phone = "Phone"
     }
}


struct Field: Decodable {
    //        activity
    var end: String
    var activity: String
    var type: String
    var start: String
    var locations:[String]
    var topics: [String]
    var speakers: [String]

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        end = try values.decode(String.self, forKey: .end)
        activity = try values.decode(String.self, forKey: .activity)
        type = try values.decode(String.self, forKey: .type)
        start = try values.decode(String.self, forKey: .start)
        locations = try values.decodeIfPresent([String].self, forKey: .locations) ?? []
        topics = try values.decodeIfPresent([String].self, forKey: .topics) ?? []
        speakers = try values.decodeIfPresent([String].self, forKey: .speakers) ?? []
    }
    
 
    private enum CodingKeys: String, CodingKey {
          case end = "End"
          case activity = "Activity"
          case type = "Type"
          case start = "Start"
          case locations = "Location"
          case topics = "Topic / theme"
          case speakers = "Speaker(s)"
     }
}

struct SponsorField: Decodable {
    var company: String
    var contacts: [String]
    var previous: Bool
    var notes: String
    var amount: Double
    var status: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        company = try values.decodeIfPresent(String.self, forKey: .company) ?? ""
        contacts = try values.decodeIfPresent([String].self, forKey: .contacts) ?? []
        previous = try values.decodeIfPresent(Bool.self, forKey: .previous) ?? false
        notes = try values.decodeIfPresent(String.self, forKey: .notes) ?? ""
        amount = try values.decodeIfPresent(Double.self, forKey: .amount) ?? 0
        status = try values.decodeIfPresent(String.self, forKey: .status) ?? ""
    }
 
    private enum CodingKeys: String, CodingKey {
        case company = "Company"
        case contacts = "Contact(s)"
        case previous = "Previous sponsor"
        case notes = "Notes"
        case amount = "Sponsored amount"
        case status = "Status"
     }
    
}

struct TopicField: Decodable{
    var relevantEvents:[String]
    var topic: String
    var count:Int
    
    private enum CodingKeys: String, CodingKey {
        case relevantEvents = "Relevant event(s)"
        case topic = "Topic / theme"
        case count = "Count"
     }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        relevantEvents = try values.decodeIfPresent([String].self, forKey: .relevantEvents) ?? []
        topic = try values.decodeIfPresent(String.self, forKey: .topic) ?? ""
        count = try values.decodeIfPresent(Int.self, forKey: .count) ?? 0
    }
 
}

struct Photo:Decodable {
    let url: String
    private enum CodingKeys: String, CodingKey {
         case url
     }
}

struct Location: Identifiable {
    let id:String
    let description: String
    let spaceName: String
    let photos: Photo
    let buildingLocation: String
    let maxCapacity:Int
}




//, description:String="",spaceName:String="", buildingLocation:String="",maxCapacity:Int=0
