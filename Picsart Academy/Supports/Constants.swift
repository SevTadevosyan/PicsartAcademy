//
//  Constants.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 15.06.22.
//

import UIKit

class Constants {
    static let shared = Constants()
    init(){}
    let picsartTelegram = "https://t.me/picsartacademy"
    let picsartYoutube = "https://www.youtube.com/c/CodeRepublic"
    let picsartLinkedin = "https://www.linkedin.com/company/picsart-academy/"
    let picsartInstagram = "https://www.instagram.com/picsart.academy/"
    let phoneNumberFirst = "tel://043477447"
    let phoneNumberSecond = "tel://012256512"
    let enrollUrl = "https://docs.google.com/forms/d/e/1FAIpQLSeTVcKEimR9-XHxkKYWc840GEQvqZqCMMgDVfE_vqsyS9rWtw/viewform"
    let armenianUsers = [User(image: "vardan", name: "Վարդան Գրիգորյան", position: "Փիքսարթ Ակադեմիայի Տնօրեն"),
                         User(image: "john", name: "Ջոն Ասատրյան", position: "Քոդ Րիփաբլիք Լաբի Ղեկավար"),
                         User(image: "nuard", name: "Նուարդ Խաչատրյան", position: "Տնօրենի գլխավոր օգնական"),
                         User(image: "ella", name: "Էլլա Խաչատուրյան", position: "Ուսուցման և զարգացման բաժնի ղեկավար"),
                         User(image: "gayane", name: "Գայանե Հովհաննիսյան", position: "Ուսուցման համակարգող"),
                         User(image: "gohar", name: "Գոհար Հովհաննիսյան", position: "Տնօրենի օգնական"),
                         User(image: "hayk", name: "Հայկ Դարբինյան", position: "Դասընթացավար Փիքսարթ Ակադեմիայում"),
                         User(image: "harut", name: "Հարություն Բաբայան", position: "Լինուքսի Դասընթացավար"),
                         User(image: "arman", name: "Արման Խաչատրյան", position: "Փայթնի Դասընթացավար"),
                         User(image: "anna", name: "Աննա Խաչատրյան", position: "Նախագծի Ղեկավար"),
                         User(image: "haykv", name: "Հայկ Սահակյան", position: "Տեսանկարահանող մասնագետ")]
    let englishUsers = [User(image: "vardan", name: "Vardan Grigoryan", position: "Director at Picsart Academy"),
                        User(image: "john", name: "John Asatryan", position: "Head of Code Republic Lab"),
                        User(image: "nuard", name: "Nuard Khachatryan", position: "Executive Assistant to the Director"),
                        User(image: "ella", name: "Ella Khachaturyan", position: "Head of Learning and Development"),
                        User(image: "gayane", name: "Gayane Hovhannisyan", position: "Training Coordinator"),
                        User(image: "gohar", name: "Gohar Hovhannisyan", position: "Assinstent of Director"),
                        User(image: "hayk", name: "Hayk Darbinyan", position: "Teacher at Picsart Academy"),
                        User(image: "harut", name: "Harutyun Babayan", position: "Teacher of Linux"),
                        User(image: "arman", name: "Arman Khachatryan", position: "Python Instructor"),
                        User(image: "anna", name: "Anna Khachatryan", position: "Product Developer"),
                        User(image: "haykv", name: "Hayk Sahakyan", position: "Video Producer")]
    let armenianNames = ["Փիքսարթ Ակադեմիա",
                         "Սենդբող",
                         "ԼեվլԱփ Բութքեմփ",
                         "Քոդ Րիփաբլիք Լաբ",
                         "Թրեքս",
                         "Աշխատակազմ",
                         "Կարգավորումներ"]
    let englishNames = ["Home",
                        "Sandbox",
                        "LevelUp Bootcamp",
                        "Code Republic Lab",
                        "Career Track",
                        "Staff",
                        "Settings"]
    let sideMenuIcons = [UIImage(systemName: "graduationcap.fill"),
                         UIImage(systemName: "atom"),
                         UIImage(systemName: "swift"),
                         UIImage(systemName: "arkit"),
                         UIImage(systemName: "server.rack"),
                         UIImage(systemName: "person.3.fill"),
                         UIImage(systemName: "gear")]
}
