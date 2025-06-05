//
//  TestDomainConstants.swift
//  InterTest
//
//  Created by Daniel Crespo Duarte on 3/06/25.
//

import Foundation
@testable import InterTest

struct TestDomainConstants {
    static let userParams: UserParamsObject = {
        .init(
            mac: "",
            nameAplication: "Controller APP",
            password: "SW50ZXIyMDIx\n",
            path: "",
            userName: "cGFtLm1lcmVkeTIx\n"
        )
    }()
    
    static let versionResponse: String = {
        "100"
    }()
    
    static let oAuthResponse: OauthObject = {
        return .init(id: "987204545", name: "Meredy Grey", user: "pam.meredy21")
    }()
    
    static let localitiesResponse: [LocalityObject] = {
        return [
            .init(id: "05001000", name: "MEDELLIN\\ANT\\COL", cityAbbreviation: "MDE"),
            .init(id: "05002000", name: "ABEJORRAL\\ANT\\COL", cityAbbreviation: "ABE"),
            .init(id: "05045000", name: "APARTADO\\ANT\\COL", cityAbbreviation: "APA")
        ]
    }()
    
    static let schemeResponse: SchemeObject = {
        .init(
            nameTable: "AbreviaturasDireccion",
            primaryKey: "AD_id",
            queryCreation: "CREATE TABLE AbreviaturasDireccion( \r\nAD_id int NOT NULL,\r\nAD_abreviatura nvarchar (50) NOT NULL,\r\nAnchor varbinary (8) NOT NULL,PRIMARY KEY (AD_id))\r\n",
            batchSize: 300,
            filter: "",
            numberOfFields: 3,
            updateDate: "2024-02-15T15:46:45.777")
    }()
    static let schemesResponse: [SchemeObject] = {
        return [
            .init(
                nameTable: "AbreviaturasDireccion",
                primaryKey: "AD_id",
                queryCreation: "CREATE TABLE AbreviaturasDireccion( \r\nAD_id int NOT NULL,\r\nAD_abreviatura nvarchar (50) NOT NULL,\r\nAnchor varbinary (8) NOT NULL,PRIMARY KEY (AD_id))\r\n",
                batchSize: 300,
                filter: "",
                numberOfFields: 3,
                updateDate: "2024-02-15T15:46:45.777"),
            .init(
                nameTable: "Agencia_PUA",
                primaryKey: "AGE_IdAgencia",
                queryCreation: "CREATE TABLE Agencia_PUA( \r\nAGE_IdAgencia bigint NOT NULL,\r\nAGE_IdCentroLogistico bigint NOT NULL,\r\nAGE_IdTipoAgencia nchar (3) NOT NULL,\r\nAGE_FechaGrabacion datetime NOT NULL,\r\nAGE_CreadoPor nvarchar (20) NOT NULL,\r\nanchor varbinary (8) NOT NULL,\r\nAGE_Operacional bit NULL,\r\nAGE_AplicaReo bit NOT NULL,PRIMARY KEY (AGE_IdAgencia))\r\n",
                batchSize: 300,
                filter: "",
                numberOfFields: 8,
                updateDate: "2024-02-15T15:46:45.777"
            )
        ]
    }()
}
