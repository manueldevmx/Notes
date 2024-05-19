//
//  ContentView.swift
//  Notas
//
//  Created by Manuel Hernandez De la Cruz on 06/04/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var viewModel: ViewModel = .init()
    @State var showCreateNote: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes) { note in
                    NavigationLink(value: note) {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .foregroundStyle(.primary)
                            Text(note.getText)
                                .foregroundStyle(.secondary)
                        }                   }
                }
            }
            .toolbar{
                ToolbarItem(placement: .status) {
                    Button(action: {
                        showCreateNote.toggle()
                    }, label: {
                        Label("Crear Nota", systemImage: "square.and.pencil")
                            .labelStyle(TitleAndIconLabelStyle())
                    })
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    .bold()
                }
            }
            .navigationTitle("Mis Notas")
            .navigationDestination(for: Note.self, destination: {
                note in
                UpdateNoteView(viewModel: viewModel, id: note.id, title: note.title, text: note.getText)
            })
            .fullScreenCover(isPresented: $showCreateNote, content: {
                CreateNoteView (viewModel: viewModel)
            })
        }
    }

    
}

#Preview {
    ContentView(viewModel: .init(notes: [
        .init(title: "SwiftUI Test", text: "texto ejemplo", createdAt: .now),
        .init(title: "SwiftUI Test2", text: "texto ejemplo2", createdAt: .now),
    ]))
   
}
