
import SwiftUI

struct noNetworkView: View {
    var body: some View {
        
        VStack(spacing: 12){
            Image(systemName: "wifi.slash")
                .font(.largeTitle)
                .foregroundColor(.red)
            Text("Network connection\nseems to be offline. \nPlease check your \nconnectivity.")
                .font(.title2)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            Button("Retry") {
                
            }.padding(.top,10)
        }
    }
}

struct noNetworkView_Previews: PreviewProvider {
    static var previews: some View {
        noNetworkView()
    }
}




