//
//  ErrorHandlingSpec.swift
//  QuickSample
//
//  Created by akatsuki174 on 2016/03/13.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import Quick
import Nimble

class ErrorHandlingSpec : QuickSpec {

    override func spec() {
        describe("catch error") {
            context("when occur error") {
                it("pass with throwError") {
                    let str = ""
                    expect{ try self.printStr(str) }.to(throwError())
                    
                    expect{ try self.printStr(str) }.to(throwError { (error: Error) in
                        expect(error._domain).to(equal("the value is empty"))
                        expect(error._code).to(equal(-1))
                    })
                    
                    expect{ try self.requestLogin(str) }.to(throwError(RequestError.unknown))
                    expect{ try self.requestLogin(str) }.to(throwError(errorType: RequestError.self))
                }
            }
        }
    }
    
    func printStr(_ str: String) throws {
        if str.isEmpty {
            throw NSError(domain: "the value is empty", code: -1, userInfo: nil)
        } else {
            print(str)
        }
    }
    
    func requestLogin(_ name: String) throws {
        if name.isEmpty {
            throw RequestError.unknown
        }
        // request processing...
    }
    
    enum RequestError: Error {
        case network
        case unknown
    }
}
