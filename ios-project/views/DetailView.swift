//
//  DetailView.swift
//  ios-project
//
//  Created by Kaining Xin on 30/03/2021.
//

import SwiftUI

class DetailViewModel: ObservableObject {
    
    @Published var locations:[Record<LocationField>]
    @Published var speakers:[Record<SpeakerField>]
    @Published var topics:[Record<TopicField>]
    
    init() {
        locations = []
        speakers = []
        topics = []
    }
    
    //get locations
    func load(locationsId: [String],speakersId:[String],topicsId:[String]){
        if locationsId.count > 0 {
            for id in locationsId {
                HttpServices.getLocation(id: id).done{[weak self] record in
                    self?.locations += record
                }
            }
        }
        // get speakers
        if speakersId.count > 0 {
            for id in speakersId {
                HttpServices.getSpeaker(id: id).done{[weak self] record in
                    self?.speakers.append(record[0])
                }
            }
        }
        //get topices
        if topicsId.count > 0 {
            for id in topicsId {
                HttpServices.getTopic(id: id).done{[weak self] record in
                    self?.topics += record
                }
            }
        }
    }
}

struct DetailView: View {
    
    let record: Record<Field>
    
    @ObservedObject var detailViewModel: DetailViewModel = DetailViewModel()
    
    init(record: Record<Field>) {
        self.record = record
        detailViewModel.load(locationsId: record.fields.locations,speakersId: record.fields.speakers,topicsId: record.fields.topics)
    }
    
    var body: some View {
        
        
        List {
            Section(header: Text("Activity")){
                HStack {
                    Label("Name", systemImage: "play")
                    Spacer()
                    Text("\(record.fields.activity)").font(.body)
                }
                
                HStack{
                    Label("Type", systemImage: "flag")
                        .font(.headline)
                    Spacer()
                    Text("\(record.fields.type)").font(.body)
                }
                
                HStack {
                    Label("Start", systemImage: "calendar")
                    Spacer()
                    Text("\(TimeFormatConverter.convert(date:record.fields.start) )").font(.body)
                }
                
                HStack {
                    Label("End", systemImage: "calendar")
                    Spacer()
                    Text("\(TimeFormatConverter.convert(date:record.fields.end))").font(.body)
                }
                
            } .foregroundColor(.pink)
            Section(header: Text("Locations")){
                ForEach(detailViewModel.locations){ location in
                    NavigationLink(destination: LocationDetailView(location:location)) {
                        Label("\(location.fields.spaceName)",systemImage:"mappin")
                    }
                }
            }.foregroundColor(.pink)
            
            Section(header: Text("Speakers")){
                
                ForEach(detailViewModel.speakers){ speaker in
                    NavigationLink(destination: SpeakerDetailView(speaker: speaker)){
                        Label("\(speaker.fields.name)",systemImage:"person")
                    }
                }
                
            }.foregroundColor(.pink)
            
            Section(header: Text("Topic / Theme")){
                ForEach(detailViewModel.topics){ topic in
                    Label("\(topic.fields.topic)",systemImage:"folder")
                }
            }.foregroundColor(.pink)
        }.listStyle(GroupedListStyle())
        
    }
}

//struct DetailView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        NavigationView {
//            DetailView()
//        }
//    }
//}
