//
//  Calendar.swift
//  Sustainify
//
//  Created by Ravia Bhullar on 6/24/24.
//

import SwiftUI

// Define the Activity model
struct Activity: Identifiable, Codable {
    var id = UUID()
    var date: Date
    var description: String
}

// Define the ActivityViewModel
class ActivityViewModel: ObservableObject {
    @Published var activities: [Activity] = [] {
        didSet {
            saveActivities()
        }
    }
    
    init() {
        loadActivities()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func saveActivities() {
        if let encoded = try? JSONEncoder().encode(activities) {
            let url = getDocumentsDirectory().appendingPathComponent("activities.json")
            try? encoded.write(to: url)
        }
    }
    
    private func loadActivities() {
        let url = getDocumentsDirectory().appendingPathComponent("activities.json")
        if let data = try? Data(contentsOf: url) {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: data) {
                activities = decoded
            }
        }
    }
    
    func addActivity(description: String, date: Date) {
        let newActivity = Activity(date: date, description: description)
        activities.append(newActivity)
    }
}

// Define the ContentView for the activity log
struct ActivityLogView: View {
    @StateObject private var viewModel = ActivityViewModel()
    @State private var showingAddActivityView = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.activities) { activity in
                        Text("\(activity.date, formatter: dateFormatter): \(activity.description)")
                    }
                    .onDelete(perform: deleteActivity)
                }
                
                Button(action: {
                    showingAddActivityView = true
                }, label: {
                    Text("Add Activity")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                .sheet(isPresented: $showingAddActivityView) {
                    AddActivityView(viewModel: viewModel, dismissAction: {
                        showingAddActivityView = false
                    })
                }
                .padding()
            }
            .navigationTitle("Activity Log")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    EditButton()
                }
            }
        }
    }
    
    private func deleteActivity(at offsets: IndexSet) {
        viewModel.activities.remove(atOffsets: offsets)
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
}

// Define the AddActivityView
struct AddActivityView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ActivityViewModel
    @State private var description = ""
    
    var dismissAction: () -> Void
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Activity")) {
                    TextField("Description", text: $description)
                }
                
                Button("Save") {
                    viewModel.addActivity(description: description, date: Date())
                    dismissAction() // Call dismissAction to update ContentView
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .padding()
            .frame(width: 400, height: 200)
            .navigationTitle("Add Activity")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}
