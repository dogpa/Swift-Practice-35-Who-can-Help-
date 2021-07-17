//
//  ContentView.swift
//  Swift Practice # 35 Who can Help?
//
//  Created by CHEN PEIHAO on 2021/7/17.
//

import SwiftUI

//先定義一個struct裡面放置定義照片名稱segmented controller跟顯示的文字
struct picture {
    var img: String
    var name: String
    var word: String
}

struct ContentView: View {

    //透過剛剛定義的struct picture放入四組照片後續使用
    let roles: [picture] = [
        picture(img: "風景", name: "地方", word: "望洋山日出"),
        picture(img: "地方", name: "地方", word: "老梅綠槽"),
        picture(img: "城市", name: "城市", word: "中環軌跡"),
        picture(img: "創意", name: "創意", word: "鋼絲絨軌跡")
        ]
    
    //透過@State private var讓var變成可以改變的狀態
    @State private var pickindex = 0
    
    //背景圖片置入
    var body: some View{
        ZStack{
            Image("background")
                .resizable()
                .scaledToFit()
            
            
            //random亂數按鈕
            HStack{
                Button(action:{
                    let randomdice = 0..<self.roles.count
                    self.pickindex = randomdice.randomElement()!
                    
                }){
                    Text("🎲")
                        .font(.system(size: 65))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(45)
                        .shadow(radius: 30)
                }
                Picker(selection: $pickindex, label: Text("")) {
                    ForEach(0..<roles.count) {
                        i in Text(self.roles[i].name).tag(i)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.gray)
                .border(Color.white)
                .cornerRadius(35)
                .shadow(radius: 15)
                .frame(width:300)
            
        }
            
            Image("\(roles[pickindex].img)")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
                .offset(x: 0, y: 200 )
            Text("\(roles[pickindex].word)")
                .offset(x: 50, y: -100)
                .font(.system(size: 40))
                .foregroundColor((Color.white))
    }

        .edgesIgnoringSafeArea(.all)
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
