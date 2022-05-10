//
//  Messaging.swift
//  dnd-planner
//
//  Created by Kierstyn Just on 4/28/22.
//

import SwiftUI

struct Messaging: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    List {
                        NavigationLink(destination: MessageThreadView()) {
                            VStack {
                                HStack {
                                    Text("bigverl").font(.headline)
                                    Spacer()
                                    Text("12:20 PM").font(.subheadline)
                                }
                                HStack {
                                    Text("HI KIERSTYN!").font(.subheadline)
                                    Spacer()
                                }
                                
                            } // end of VStack
                        } // end of NavigationLink
                    } // end of list
                } // End of VStack
                .navigationBarTitle("Messages", displayMode: .inline)
                .navigationBarHidden(false)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: NewMessageView()) {
                            Image(systemName: "square.and.pencil")
                        }
                    } // end of ToolbarItem
                } // end of toolbar
            } // end of NavigationView
        }// end of GeometryReader
    }
}

struct Messaging_Previews: PreviewProvider {
    static var previews: some View {
        Messaging()
        MessageThreadView()
        NewMessageView()
    }
}

// screen displaying message thread
struct MessageThreadView: View {
    @SceneStorage("text") var text: String = ""
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    MessageTextView(text: "HI KIERSTYN", isSent: false)
                    MessageTextView(text: "wanna play a one shot soon?", isSent: false)
                    MessageTextView(text: "HI WESTON", isSent: true)
                    MessageTextView(text: "yeeee", isSent: true)
                } // end of VStack
                Spacer()
                HStack {
                    TextField("Type Message Here", text: $text)
                        .padding(5)
                        .frame(width: geometry.size.width / 1.3, alignment: .topLeading)
                        .border(Color.black)
                        .cornerRadius(8)
                        .background(Color.white)
                    
                    Button(action: {}) {
                        Text("Send")
                            .padding(5)
                            .background(Color.primary)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }.frame(width: geometry.size.width / 7)
                } // end of HStack
                .padding(7)
                .frame(width: geometry.size.width)
                .background(Color.secondary)
            } // end of VStack
            .padding()
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
            .navigationBarTitle("bigverl", displayMode: .inline)
            .navigationBarHidden(false)
        }
    }
}

// message chat bubble object
struct MessageTextView: View {
    var text: String
    var isSent: Bool
    
    var body: some View {
        HStack {
            if isSent {
                Spacer()
                Text(text).modifier(SentMessageText())
            } else {
                Text(text).modifier(ReceivedMessageText())
                Spacer()
            }
        }
    }
}

// screen for starting new message thread
struct NewMessageView: View {
    @State var text: String = ""
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    TextField("Type Message Here", text: $text)
                        .padding(5)
                        .frame(width: geometry.size.width / 1.3, alignment: .topLeading)
                        .border(Color.black)
                        .cornerRadius(8)
                        .background(Color.white)
                    
                    Button(action: {}) {
                        Text("Send")
                            .padding(5)
                            .background(Color.primary)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }.frame(width: geometry.size.width / 7)
                } // end of HStack
                .padding(7)
                .frame(width: geometry.size.width)
                .background(Color.secondary)
            }
            .padding()
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
            .navigationBarTitle("New Message", displayMode: .inline)
            .navigationBarHidden(false)
        }
    }
}

// MODIFIERS
struct SentMessageText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(10)
    }
}

struct ReceivedMessageText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .foregroundColor(Color.black)
            .background(Color.orange)
            .cornerRadius(10)
    }
}
