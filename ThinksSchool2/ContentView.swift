//
//  ContentView.swift
//  ThinksSchool2
//
//  Created by HoangCuong on 12/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var size: CGFloat = 0.95
    @State var phone: String = ""
    @State var password: String = ""
    @State var isSecure: Bool = true
    
    var repeatingCloudBounce: Animation {
        Animation
            .easeOut(duration: 0.5)
            .repeatForever()
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(#colorLiteral(red: 0.9777191281, green: 0.7951946259, blue: 0.1993733943, alpha: 1))
            Image("logo")
                .resizable()
                .frame(width: 120, height: 120)
                .padding(.top, 77)
            HStack {
                Spacer()
                Image("cloud1")
                    .resizable()
                    .frame(width: 94, height: 59)
                    .padding(.top, 67)
                    .scaleEffect(y: size, anchor: .center)
                    .onAppear(perform: {
                        withAnimation(self.repeatingCloudBounce) { self.size = 1 }
                    })
            }
            HStack {
                Image("cloud2")
                    .resizable()
                    .frame(width: 101, height: 72)
                    .padding(.top, 117)
                    .scaleEffect(y: size, anchor: .center)
                    .onAppear(perform: {
                        withAnimation(self.repeatingCloudBounce) { self.size = 1 }
                    })
                Spacer()
            }
            HStack {
                Spacer()
                Image("cloud3")
                    .resizable()
                    .frame(width: 99, height: 40)
                    .padding(.top, 199)
                    .scaleEffect(y: size, anchor: .center)
                    .onAppear(perform: {
                        withAnimation(self.repeatingCloudBounce) { self.size = 1 }
                    })
                Spacer()
                    .frame(width: 40)
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        ZStack(alignment: .top) {
                            Rectangle().fill(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                            VStack {
                                ZStack {
                                    Color(#colorLiteral(red: 0.4041166306, green: 0.275357306, blue: 0.06064149737, alpha: 1))
                                    Text("Sign in")
                                        .foregroundColor(Color(#colorLiteral(red: 0.9777191281, green: 0.7951946259, blue: 0.1993733943, alpha: 1)))
                                        .font(.title2)
                                        .fontWeight(.bold)
                                }
                                .frame(height: 63)
                                VStack(spacing: 24) {
                                    CustomTF(value: $phone, placeholder: "phone number", icon: "phone")
                                    ZStack {
                                        CustomTF(value: $password, placeholder: "password", icon: "lock", isSecure: isSecure)
                                        HStack {
                                            Spacer()
                                            Button(action: {
                                                isSecure.toggle()
                                            }, label: {
                                                Image("_eye-open")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 32)
                                                    .padding(.trailing, 20)
                                            })
                                        }
                                    }
                                    HStack {
                                        Spacer()
                                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                            Text("Forgot password?")
                                                .font(.footnote)
                                                .foregroundColor(Color(#colorLiteral(red: 0.4041166306, green: 0.275357306, blue: 0.06064149737, alpha: 1)))
                                                .underline()
                                        })
                                    }
                                    Spacer()
                                }
                                .padding(.leading, 17)
                                .padding(.trailing, 17)
                                .padding(.top, 20)
                            }
                        }
                        .cornerRadius(30, corners: [.topLeft, .topRight])
                        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    ZStack {
                                        Rectangle()
                                            .fill(Color(#colorLiteral(red: 0.4041166306, green: 0.275357306, blue: 0.06064149737, alpha: 1)))
                                            .frame(width: 68, height: 68)
                                            .cornerRadius(.infinity)
                                        Image("arrow")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 28)
                                    }
                                })
                                .padding(.trailing, 17)
                                .padding(.bottom, -34)
                            }
                        }
                    }
                    .frame(width: 374, height: 320)
                    Spacer()
                }
                Spacer()
            }
            VStack {
                Spacer()
                ZStack(alignment: .bottom) {
                    Image("city")
                        .resizable()
                        .frame(width: 415, height: 171)
                    ZStack {
                        Image("grass")
                            .resizable()
                            .frame(width: 415, height: 87)
                        Text("v4.6.9.2289")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    HStack {
                        Spacer()
                        Image("rightBush")
                            .resizable()
                            .frame(width: 80, height: 54)
                    }
                    HStack {
                        Image("leftBush")
                            .resizable()
                            .frame(width: 82, height: 68)
                        Spacer()
                    }
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct CustomTF: View {
    @Binding var value: String
    var placeholder: LocalizedStringKey = ""
    var icon: String = ""
    var isSecure: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color.white)
            HStack {
                Image(icon)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                if isSecure {
                    SecureField(placeholder, text: $value)
                } else {
                    TextField(placeholder, text: $value)
                }
                Color.clear.frame(width: 20)
            }
        }
        .frame(height: 56)
        .cornerRadius(5)
        .shadow(color: .gray, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
