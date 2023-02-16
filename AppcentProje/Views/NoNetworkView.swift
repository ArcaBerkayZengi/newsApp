
import SwiftUI

struct NoNetworkView: View {
    @StateObject var networkMonitor = NetworkManager()
    var body: some View {
        
        VStack(spacing: 12){
            Image("BadNews")
                .resizable()
                .frame(width: 350, height: 250)
                .foregroundColor(.red)
                .padding(.bottom,1)
            Text("Something went wrong ")
                .fontWeight(.bold)
                .font(.title)
            Text("Please check your connection, \n Don't miss the international news. ")
                .font(.title2)
                .foregroundColor(.gray)
                
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            Button(action: {
                networkMonitor.objectWillChange.send()
            },label:{
                Text("Retry")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Color.red.cornerRadius(10)
                        .shadow(radius: 10))
                    .padding(.top,20)
                    
            })
        }
    }
}

struct noNetworkView_Previews: PreviewProvider {
    static var previews: some View {
        NoNetworkView()
    }
}




