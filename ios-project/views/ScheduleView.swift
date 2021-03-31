//
//  ScheduleView.swift
//  ios-project
//
//  Created by Kaining Xin on 30/03/2021.
//

import SwiftUI

class ScheduleViewModel: ObservableObject {
    
    @Published var records:[Record<Field>]
    
    init() {
        records = []
    }
    
    func loadRecords(){
        HttpServices.getScheduleList().done{[weak self] res in
            self?.records = res
        }
    }
}

struct ScheduleView: View {
    @ObservedObject var scheduleViewModel:ScheduleViewModel = ScheduleViewModel()
    
    init() {
        scheduleViewModel.loadRecords()
    }
    
    var body: some View {
        NavigationView{
            List {
                ForEach(scheduleViewModel.records) { record in
                    NavigationLink(destination: DetailView(record: record)) {
                        CardView(record:record)
                    }
                }
            }.listStyle(SidebarListStyle())
            .navigationTitle("Schedule")
            .navigationBarItems(trailing: Button(action: {}) {
                Image(systemName: "line.horizontal.3.circle").foregroundColor(.black)
            })
        }
        
  }
        
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
