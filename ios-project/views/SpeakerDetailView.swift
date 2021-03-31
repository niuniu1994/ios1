//
//  SpeakerDetailView.swift
//  ios-project
//
//  Created by Kaining Xin on 31/03/2021.
//

import SwiftUI
class SpeakerViewModel: ObservableObject{
    @Published var activities:[Record<Field>]
    @Published var sponsors:[Record<SponsorField>]
    
    init() {
        activities = []
        sponsors = []
    }
    
    func load(activitiesId:[String], sponsorsId:[String]) {
        if activitiesId.count > 0 {
            for id in activitiesId {
                HttpServices.getDetailOfActivity(id: id).done{[weak self] record in
                    self?.activities += record
                }
            }
        }
        
        if sponsorsId.count > 0 {
            for id in sponsorsId {
                HttpServices.getSponsor(id: id).done{[weak self] record in
                    self?.sponsors += record
                }
            }
        }
    }
}


struct SpeakerDetailView: View {
    @ObservedObject var speakerDetailViewModel: SpeakerViewModel = SpeakerViewModel()
    let speaker: Record<SpeakerField>
    
    init(speaker: Record<SpeakerField>) {
        self.speaker = speaker
        speakerDetailViewModel.load(activitiesId: speaker.fields.speakingAt,sponsorsId: speaker.fields.company)
    }
    var body: some View {
        List{
            Section(header: Text("Speaker / Attendee")){
                HStack{
                    Label("Name", systemImage: "mappin")
                    Spacer()
                    Text("\(speaker.fields.name)").font(.body)
                }
                HStack{
                    Label("Type", systemImage: "mappin")
                    Spacer()
                    Text("\(speaker.fields.type)").font(.body)
                }
                HStack{
                    Label("Role", systemImage: "person")
                    Spacer()
                    Text("\(speaker.fields.role)").font(.body)
                }
                HStack{
                    Label("Email", systemImage: "at.circle.fill")
                    Spacer()
                    Text("\(speaker.fields.email)").font(.body)
                }
                HStack{
                    Label("Phone", systemImage: "phone")
                    Spacer()
                    Text("\(speaker.fields.phone)").font(.body)
                }
                HStack{
                    Label("Status", systemImage: "mappin")
                    Spacer()
                    Text("\(speaker.fields.status)").font(.body)
                }
            }.foregroundColor(.pink)
            Section(header: Text("Company")){
                ForEach(speakerDetailViewModel.sponsors){sponsor in
                    HStack{
                        Label("\(sponsor.fields.company)", systemImage: "latch.2.case")
                    }
                }
            }.foregroundColor(.pink)
            Section(header: Text("Speaking at")){
                ForEach(speakerDetailViewModel.activities){ activity in
                    NavigationLink(destination: DetailView(record: activity)) {
                        Label("\(activity.fields.activity)",systemImage:"mappin")
                    }
                }
            }.foregroundColor(.pink)
        }.listStyle(InsetGroupedListStyle())
    }
}

//struct SpeakerDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpeakerDetailView()
//    }
//}
