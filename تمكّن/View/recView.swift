//
//  ContentView.swift
//  تمكّن
//
//  Created by shahad khaled on 27/05/1447 AH.
//

import SwiftUI
import AVFoundation
import Combine

struct recView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var recViewModel: RecViewModel
    @StateObject var audioVM = AudioRecordingViewModel()
    @State var isRecording = false
    
    func formatText(_ text: String) -> String {
        let words = text.split(separator: " ")
        var lines: [String] = []

        // Split into chunks of 5 words
        for i in stride(from: 0, to: words.count, by: 5) {
            let end = min(i + 5, words.count)
            let line = words[i..<end].joined(separator: " ")
            lines.append(line)
            if lines.count == 2 { break } // only two lines
        }

        // Fill empty line if less than 2 lines
        while lines.count < 2 { lines.append("") }

        return lines.joined(separator: "\n")
    }

    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack(spacing: 50){
                    Spacer()
                    // Top image positioned to the top-right and partly out of frame
                    Image("effect")
                        .alignmentGuide(.leading) { d in d[.trailing] }
                        .offset(x: 150, y: -40)
                    
                    Spacer()
                    Image("effect")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                
                VStack{
                    VStack(alignment: .leading){
                        // HERE 👇 YOUR LIVE TRANSCRIPTION
                        Text(audioVM.finalText.isEmpty ? "Say something..." : audioVM.displayText)
                            .font(.system(size: 24))
                            .lineLimit(2)
                            .frame(width: 300, alignment: .leading)
                            .animation(.easeInOut, value: audioVM.finalText)

                        Button(action: {
                            audioVM.playRecording()
                        }) { Text("Play Recording") }
                    }
                    
                    ZStack{
                        Circle()
                            .blur(radius: 10)
                            .frame(width: 200, height: 200)
                            .foregroundStyle(Color.aud1)
                            .scaleEffect(recViewModel.size)

                        Circle()
                            .blur(radius: 4)
                            .frame(width: 150, height: 150)
                            .foregroundStyle(Color.aud2)
                            .scaleEffect(recViewModel.size1)

                        Circle()
                            .blur(radius: 4)
                            .frame(width: 100, height: 100)
                            .foregroundStyle(Color.aud3)
                            .scaleEffect(recViewModel.size)

                        Circle()
                            .blur(radius: 5)
                            .frame(width: 65, height: 65)
                            .foregroundStyle(Color.white)
                            .scaleEffect(recViewModel.size1)
                        
                        Circle()
                            .blur(radius: 5)
                            .frame(width: 50, height: 50)
                            .foregroundStyle(Color.black)
                            .scaleEffect(recViewModel.size)
                        
                        Circle()
                            .frame(width: 50 , height: 50 )
                            .foregroundStyle(Color.black)
                        
                        Button {
                            if isRecording {
                                audioVM.stopRecording()
                                recViewModel.stopSizeLoop()
                                recViewModel.stopTimer()
                            } else {
                                audioVM.startRecording()
                                recViewModel.startSizeLoop()
                                recViewModel.startTimer()
                            }
                            isRecording.toggle()
                        } label: {
                            Image(isRecording ? "Mic4" : "Mic")
                                .frame(width: 60, height: 60)
                                .padding()
                        }
                        
                    }
                    .frame(width: 200, height: 200)
                    .offset(x: 0, y: 60)
                    .padding(.bottom, 8)
                    
                    let hours = Int(recViewModel.time) / 3600
                    let minutes = (Int(recViewModel.time) % 3600) / 60
                    let seconds = Int(recViewModel.time) % 60
                    let milliseconds = Int((recViewModel.time.truncatingRemainder(dividingBy: 1)) * 100)
                    
                    Text(String(format : "%02d:%02d:%02d.%02d", hours, minutes, seconds, milliseconds, recViewModel.time))
                        .offset(x: 0, y: 55)
                        .monospacedDigit()
                    
                    ZStack{
                        Text("Take a Breath")
                            .bold()
                            .padding()
                            .frame(minWidth: 350, minHeight: 180, alignment: .topLeading)
                            .glassEffect(.clear, in: .rect(cornerRadius: 35))
                            .offset(x: 0, y: 80)
                        
                        Button("Skip") {
                            
                        }
                        .buttonStyle(.glass)
                        .offset(x: 125, y: 130)
                    }
                }
                .ignoresSafeArea()
            }
            .onAppear {
                audioVM.context = context
            }
            .navigationTitle("")
            .toolbarTitleDisplayMode(.inline)
             
        }

    }
}

#Preview {
    recView()
        .environmentObject(RecViewModel())
}
