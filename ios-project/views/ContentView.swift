//
//  ContentView.swift
//  ios-project
//
//  Created by Kaining Xin on 24/03/2021.
//

import SwiftUI



class RecordsViewModel: ObservableObject {
    
    @Published var records:[Record<Field>]
    @Published var locationRecords:[Record<LocationField>]
    @Published var speakersRecords:[Record<SpeakerField>]
    @Published var sponsorsRecords:[Record<SponsorField>]
    
    init() {
        records = []
        locationRecords = []
        speakersRecords = []
        sponsorsRecords = []
    }
    
    func loadRecords(){
        HttpServices.getScheduleList().done{[weak self] res in
            self?.records = res
        }
        
//        HttpServices.getLocationList().done{[weak self] res in
//            self?.locationRecords = res
//        }
//
//        HttpServices.getSponsorList().done{[weak self] res in
//            print(res)
//            self?.sponsorsRecords = res
//        }
//
//        HttpServices.getSpeakersOrAttendsList().done{[weak self] res in
//            self?.speakersRecords = res
//        }
    }
}

struct ContentView: View {
    @ObservedObject var recordsViewModel:RecordsViewModel = RecordsViewModel()
    
    init() {
        recordsViewModel.loadRecords()
    }
    
    var body: some View {
        ScheduleView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
