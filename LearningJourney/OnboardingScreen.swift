import SwiftUI

struct UnderlinedTextField: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        VStack(alignment: .leading) {
            TextField(placeholder, text: $text)
                .padding(.bottom, 5)
                .padding(.horizontal)
                .background(Color.clear)
                .accentColor(Color.color1)// Ensure the background is clear
                .overlay(
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.gray.opacity(0.3)) // Change to desired color
                        .padding(.leading, -20),
                    // Adjust position of underline
                    alignment: .bottom
                )
        }
    }
}

struct OnboardingScreen: View {
    @State private var text: String = ""
    @State private var selectedChoice: String? = nil
    
    var body: some View {
        VStack(alignment: .center) {
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 140)
                
                Text("🔥")
                    .font(.system(size: 60))
            }
            .padding(.bottom, 40.0)
            
            VStack(alignment: .leading) {
                Text("Hello Learner!")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                
                Text("This app will help you learn everyday")
                    .foregroundColor(.gray.opacity(0.4))
                
                Text("I want to learn")
                    .font(.headline)
                    .padding(.top, 20.0)
                    .bold()
                
                UnderlinedTextField(
                    text: $text,
                    placeholder: "Swift"
                )
                .padding(.top, -8.0)
                
                Text("I want to learn it in a")
                    .font(.headline)
                    .padding(.top, 20.0)
                    .bold()
                
                HStack {
                    Button(action: { selectedChoice = "Week" }) {
                        Text("Week")
                            .frame(width: 70, height: 40)
                            .background(selectedChoice == "Week" ? Color.color1 : Color.gray.opacity(0.3))
                            .foregroundColor(selectedChoice == "Week" ? Color.black : Color.color1)
                            .cornerRadius(8)
                    }
                    
                    Button(action: { selectedChoice = "Month" }) {
                        Text("Month")
                            .frame(width: 70, height: 40)
                            .background(selectedChoice == "Month" ? Color.color1 : Color.gray.opacity(0.3))
                            .foregroundColor(selectedChoice == "Month" ? Color.black : Color.color1)
                            .cornerRadius(8)
                    }
                    
                    Button(action: { selectedChoice = "Year" }) {
                        Text("Year")
                            .frame(width: 70, height: 40)
                            .background(selectedChoice == "Year" ? Color.color1 : Color.gray.opacity(0.3))
                            .foregroundColor(selectedChoice == "Year" ? Color.black : Color.color1)
                            .cornerRadius(8)
                    }
                }
                
                // Centered Start Button
                HStack {
                    Spacer()
                    
                    Button(action: {
                        // Action when Start button is pressed
                    }) {
                        HStack {
                            Text("Start")
                            Image(systemName: "arrow.right") // Add arrow icon
                        }
                        .frame(width: 160, height: 50) // Set button size
                        .background(Color.color1) // Change to desired color
                        .foregroundColor(Color.black)
                        .cornerRadius(8)
                        .font(.headline) // Make text bold
                    }
                    
                    Spacer()
                }
                .padding(.top, 50.0)
            }
            .padding(.top, 2.0) // Overall padding for the VStack
        }
        .padding(.bottom, 150.0)
        .padding(.leading, 20.0)
    }
}

#Preview {
    OnboardingScreen()
}
