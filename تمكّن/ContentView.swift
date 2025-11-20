//
//  ContentView.swift
//  تمكّن
//
//  Created by shahad khaled on 27/05/1447 AH.
//

import SwiftUI

import AVFoundation
import SwiftUI



struct ContentView: View {
    @StateObject var audioVM = AudioRecordingViewModel()
    @State var isRecording = false
    @State var size :CGFloat = 1
    @State var size1 :CGFloat = 1
    @State private var animationTimer: Timer?

    
    func startSizeLoop() {
        // Reset before starting
        size = 1
        size1 = 1
        
        // Invalidate any old timer
        animationTimer?.invalidate()
        
        // Make a timer that fires every 1 second
        animationTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 0.8)) {
                size = (size == 1) ? 1.2 : 1
                size1 = (size1 == 1.3) ? 1 : 1.3
            }
        }
    }

    func stopSizeLoop() {
        animationTimer?.invalidate()
        animationTimer = nil
        size = 1
    }

    var body: some View {
        VStack {
            Button(isRecording ? "" : "") {
                if isRecording {
                    audioVM.stopRecording()
                } else {
                    audioVM.startRecording()
                }
                isRecording.toggle()
            }
            ZStack{
                Circle()
                    .blur(radius: 10)
                    .frame(width: 200 * size, height: 200 * size)
                    .foregroundStyle(Color.aud1)

                
                Circle()
                    .blur(radius: 4)
                    .frame(width: 150 * size1, height: 150 * size1)
                    .foregroundStyle(Color.aud2)

                Circle()
                    .blur(radius: 4)
                    .frame(width: 100 * size, height: 100 * size)
                    .foregroundStyle(Color.aud3)

                Circle()
                    .blur(radius: 5)
                    .frame(width: 65 * size1, height: 65 * size1)
                    .foregroundStyle(Color.white)
                
                
                Circle()
                    .blur(radius: 5)
                    .frame(width: 50 * size, height: 50 * size)
                    .foregroundStyle(Color.black)
                
                Circle()
                    .frame(width: 50 , height: 50 )
                    .foregroundStyle(Color.black)
                
                Button {
                        if isRecording {
                            audioVM.stopRecording()
                            stopSizeLoop()
                            
                        } else {
                            audioVM.startRecording()
                            startSizeLoop()
                        }
                        isRecording.toggle()
                    } label: {
                        Image(isRecording ? "Mic4" : "Mic")   // changes image while recording
                            .frame(width: 60, height: 60)
                            .padding()
                    }
                
            }
            

            Button("تت") {
                           audioVM.playRecording()
                       }
        }
        .padding()
    }
}//struct

#Preview {
    ContentView()
}


