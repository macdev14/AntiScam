//
//  ModalView.swift
//  SwiftUIAuthTutorial
//
//  Created by Lauro Pimentel on 26/06/24.
//

import SwiftUI
  
struct ModalView: View {
    @Environment(\.modelContext) private var modelContext
    @State var ocorrencia = ""
    @Binding var show : Bool
    var body: some View {
        
        VStack(alignment: .center, spacing: 30) {
            HStack{
                Button{
                    withAnimation(.snappy)
                    {
                        show.toggle()
                    }
                }label: {
                    Image(systemName: "xmark.circle").imageScale(.large)
                        .foregroundStyle(.black)
            }
                Spacer()
                
                if !ocorrencia.isEmpty{
                    Button("Clear"){
                        ocorrencia = ""
                    }.foregroundStyle(.black)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                
                
                
            }.padding(.horizontal)
            
            Text("Cadastrar Caso de Golpe").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.semibold)
            VStack( spacing: 30){
             
                ExtractedView(ocorrencia: $ocorrencia)
                
                ExtractedView(ocorrencia: $ocorrencia)
                Spacer()
                Button{
                  addItem()
                }label: {
                    HStack {
                        Text("Salvar")
                    }.frame(width: 320, height: 44)
                    
                        .padding(.horizontal)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color(.blue))
                    }
                }
            }.padding()
            Spacer()
        }.padding(.vertical, 30).background(Color(.systemGray6))
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }
}

#Preview {
    ModalView(show: .constant(false))
}

struct ExtractedView: View {
    @Binding var ocorrencia : String;
    var body: some View {
        HStack(alignment: .center) {
            TextField("Ocorrencia: ",text: $ocorrencia)
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
        }  .frame(height: 54)
            .padding(.horizontal)
            .overlay{
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(Color(.systemGray4))
            }
    }
}
