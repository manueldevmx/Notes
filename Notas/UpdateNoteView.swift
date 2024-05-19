//
//  UpdateNoteView.swift
//  Notas
//
//  Created by Manuel Hernandez De la Cruz on 07/04/24.
//

import SwiftUI

struct UpdateNoteView: View {
    var viewModel: ViewModel
    let id: UUID
    @State var title: String = ""
    @State var text: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    
    
    var body: some View {
        VStack{
            Form {
                Section {
                    TextField ("", text: $title, prompt: Text("*Titulo"), axis: .vertical)
                    TextField ("", text: $text, prompt: Text("*Texto"), axis: .vertical)
                }
            }
            Button(action: {
                viewModel.removeNoteWith(id: id)
                    dismiss()
            }, label: {
                Text("Eliminar nota")
                    .foregroundStyle(.gray)
                    .underline()
            })
            .buttonStyle(BorderlessButtonStyle())
            Spacer()
        }
        .background(Color(uiColor: .systemGroupedBackground))
        .toolbar {
            ToolbarItem{
                Button{
                    viewModel.updateNoteWith(id: id, newTitle: title, newText: text)
                    dismiss()
                }label: {
                    Text("Guardar")
                        .bold()
                       
                }
            }
        }
        .navigationTitle("Editar Nota:")    }
}

#Preview {
    NavigationStack{
    UpdateNoteView(viewModel: .init(), id: .init(), title: "Nota para editar", text: "Vas a editar esta nota")
    }
}
