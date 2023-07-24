//
//  NewData.swift
//  docappGlobal
//
//  Created by DarkMoon on 29/03/23.
//

import Foundation


class ChatMessageViewModel{
    
    var messages: [ChatMessage] = []
    
    func loadChatMessages(userIdData: Int) {
       
            messages.append(ChatMessage(text: "Hello Doctor", userid: 0))
            messages.append(ChatMessage(text: "Hi there!",  userid: userIdData))
            messages.append(ChatMessage(text: "How are you?",  userid: userIdData))
            messages.append(ChatMessage(text: "I'm doing well, thanks. How about you?", userid: userIdData))
            messages.append(ChatMessage(text: "Yes Fine, Doctor",  userid: 0))
            messages.append(ChatMessage(text: "How can help you ", userid: userIdData))
            messages.append(ChatMessage(text: "I have the coronavirus as i am experiencing mild symptoms, what do i do?", userid: 0))
            messages.append(ChatMessage(text: "fever   dry cough   tiredness   sore throat",  userid: 0))
            messages.append(ChatMessage(text: "oh so sorry about that. do you have any underlying diseases?",  userid: 0))
                    
    }

}
