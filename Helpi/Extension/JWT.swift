//
//  JWT.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 21/07/22.
//

import JWTDecode

extension JWT {
  var email: String? {
    return claim(name: "email").string
  }

  var idUser: String? {
    return claim(name: "sub").string
  }
}
