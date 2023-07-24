//
//  DoctorModal.swift
//  docappNew
//
//  Created by DarkMoon on 11/01/23.
//

import Foundation

struct DoctorViewModel {
    
    var doctorData = [Doctor]()
    
    mutating func loadEmployeeData() {
        doctorData.append(Doctor(docName: "Dr. Bellamy N",
                                 docImage: "doc1",
                                 docActive: "Active",
                                 docType: "Viralogist",
                                 docRateId:  4.5,
                                 docReviewsNum: 135,
                                 docStatus: true,
                                 docUserId: 1))
        doctorData.append(Doctor(docName: "Dr. Mensah T",
                                 docImage: "doc2",
                                 docActive: "1 day ago",
                                 docType: "Oncologists",
                                 docRateId: 4.3,
                                 docReviewsNum: 130,
                                 docStatus: false,
                                 docUserId: 2))
        doctorData.append(Doctor(docName: "Dr. Klimisch J",
                                 docImage: "doc3",
                                 docActive: "Active",
                                 docType: "Surgeon",
                                 docRateId: 4.5,
                                 docReviewsNum: 135,
                                 docStatus: true,
                                 docUserId: 3))
        doctorData.append(Doctor(docName: "Dr. Martinez K",
                                 docImage: "doc4",
                                 docActive: "a day ago",
                                 docType: "Pediatrician",
                                 docRateId: 4.3,
                                 docReviewsNum: 130,
                                 docStatus: false, docUserId: 4))
        doctorData.append(Doctor(docName: "Dr. Marc M",
                                 docImage: "doc5",
                                 docActive: "Active",
                                 docType: "Rheumatologists",
                                 docRateId: 4.3,
                                 docReviewsNum: 130,
                                 docStatus: true, docUserId: 5))
        doctorData.append(Doctor(docName: "Dr. O’Boyle J",
                                 docImage: "doc6",
                                 docActive: "Active",
                                 docType: "Radiologists",
                                 docRateId: 4.5 ,
                                 docReviewsNum: 135,
                                 docStatus: false, docUserId: 6))
        doctorData.append(Doctor(docName: "Dr. Bellamy N",
                                 docImage: "doc1",
                                 docActive: "Active",
                                 docType: "Viralogist",
                                 docRateId:  4.5,
                                 docReviewsNum: 135,
                                 docStatus: true, docUserId: 7))
        doctorData.append(Doctor(docName: "Dr. Mensah T",
                                 docImage: "doc2",
                                 docActive: "1 day ago",
                                 docType: "Oncologists",
                                 docRateId: 4.3,
                                 docReviewsNum: 130,
                                 docStatus: false, docUserId: 8))
        doctorData.append(Doctor(docName: "Dr. Klimisch J",
                                 docImage: "doc3",
                                 docActive: "Active",
                                 docType: "Surgeon",
                                 docRateId: 4.5,
                                 docReviewsNum: 135,
                                 docStatus: true, docUserId: 9))
        doctorData.append(Doctor(docName: "Dr. Martinez K",
                                 docImage: "doc4",
                                 docActive: "a day ago",
                                 docType: "Pediatrician",
                                 docRateId: 4.3,
                                 docReviewsNum: 130,
                                 docStatus: false, docUserId: 10))
        doctorData.append(Doctor(docName: "Dr. Marc M",
                                 docImage: "doc5",
                                 docActive: "Active",
                                 docType: "Rheumatologists",
                                 docRateId: 4.3,
                                 docReviewsNum: 130,
                                 docStatus: true, docUserId: 11))
        doctorData.append(Doctor(docName: "Dr. O’Boyle J",
                                 docImage: "doc6",
                                 docActive: "Active",
                                 docType: "Radiologists",
                                 docRateId: 4.5 ,
                                 docReviewsNum: 135,
                                 docStatus: false, docUserId: 12))
        
    }
    
    
}
