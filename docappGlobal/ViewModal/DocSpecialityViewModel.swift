//
//  DocSpecialityViewModel.swift
//  docappNew
//
//  Created by DarkMoon on 20/01/23.
//

import Foundation

struct DocSpecialityViewModel{
    
    var doSpecialityData = [DocSpeciality]()
    
    mutating func loadEmployeeData() {
        doSpecialityData.append(DocSpeciality(docSpeciality: "Neurology",
                                              specialityImg: "brain",
                                              docSpecialityNum: 2029))
        doSpecialityData.append(DocSpeciality(docSpeciality: "Genetics",
                                              specialityImg: "dna",
                                              docSpecialityNum: 1870))
        doSpecialityData.append(DocSpeciality(docSpeciality: "Dentistry",
                                              specialityImg: "dentist",
                                              docSpecialityNum: 1064))
        doSpecialityData.append(DocSpeciality(docSpeciality: "Surgery",
                                              specialityImg: "surgery",
                                              docSpecialityNum: 964))
      
     }
    
    
    
}
