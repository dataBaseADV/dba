//
//  Queries.swift
//  Netflix_Clone
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2021 YODA. All rights reserved.
//

import Foundation
import SQLite3

class Queries {
    static let shared = Queries()
    var db: OpaquePointer? = nil

    
    private init() {
        openDatabase()
    }
    
   
    func getVieos() -> [NetflixVideoModel] {
        var queryStatement: OpaquePointer?
        var model: [NetflixVideoModel] = []
        if sqlite3_prepare_v2(db, "SELECT * FROM netflix_titles", -1, &queryStatement, nil) == SQLITE_OK {
        print("\n")
        while (sqlite3_step(queryStatement) == SQLITE_ROW) {
            var row: [String] = []
            
            
            row.append(String(cString: sqlite3_column_text(queryStatement, 0)))
            if let type = sqlite3_column_text(queryStatement, 1) {
                row.append(String(cString: type))
            } else {
                row.append("-")
            }
            if let title = sqlite3_column_text(queryStatement, 2) {
                row.append(String(cString: title))
            } else {
                row.append("-")
            }
            if let director = sqlite3_column_text(queryStatement, 3) {
                row.append(String(cString: director))
            } else {
                row.append("-")
            }
            if let cast = sqlite3_column_text(queryStatement, 4) {
                row.append(String(cString: cast))
            } else {
                row.append("-")
            }
            if let country = sqlite3_column_text(queryStatement, 5) {
                row.append(String(cString: country))
            } else {
                row.append("-")
            }
            if let date_added = sqlite3_column_text(queryStatement, 6) {
                row.append(String(cString: date_added))
            } else {
                row.append("-")
            }
            if let release_year = sqlite3_column_text(queryStatement, 7) {
                row.append(String(cString: release_year))
            } else {
                row.append("-")
            }
            if let rating = sqlite3_column_text(queryStatement, 8) {
                row.append(String(cString: rating))
            } else {
                row.append("-")
            }
            if let duration = sqlite3_column_text(queryStatement, 9) {
                row.append(String(cString: duration))
            } else {
                row.append("-")
            }
            if let listed_in = sqlite3_column_text(queryStatement, 10) {
                row.append(String(cString: listed_in))
            } else {
                row.append("-")
            }
            if let description = sqlite3_column_text(queryStatement, 11) {
                row.append(String(cString: description))
            } else {
                row.append("-")
            }
            
            model.append(NetflixVideoModel(show_id: row[0],
                                                type: row[1],
                                                title: row[2],
                                                director: row[3],
                                                cast: [row[4]],
                                                coutry: row[5],
                                                date_added: row[6],
                                                release_year: row[7],
                                                rating: row[8],
                                                duration: row[9],
                                                listed_in: row[10],
                                                description: row[11]
            ))
        }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("\nQuery is not prepared \(errorMessage)")
        }
        sqlite3_finalize(queryStatement)
        return model
    }

        func openDatabase() -> Bool {
            do {
                let manager = FileManager.default

                let documentsURL = try manager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("netflix.db")
                

                var rc = sqlite3_open_v2(documentsURL.path, &db, SQLITE_OPEN_READWRITE, nil)
                if rc == SQLITE_CANTOPEN {
                    let bundleURL = Bundle.main.url(forResource: "netflix", withExtension: "db")!
                    try manager.copyItem(at: bundleURL, to: documentsURL)
                    rc = sqlite3_open_v2(documentsURL.path, &db, SQLITE_OPEN_READWRITE, nil)
                    print("Successfully opened connection database!!")
                }

                if rc != SQLITE_OK {
                    print("Error: \(rc)")
                    return false
                }

                return true
            } catch {
                print(error)
                return false
            }
        }
        
        func getTvShows() -> [NetflixVideoModel]  {
            var model: [NetflixVideoModel] = []
          var queryStatement: OpaquePointer?
          if sqlite3_prepare_v2(db, "select * from netflix_titles where type=\"TV Show\"", -1, &queryStatement, nil) == SQLITE_OK {
            print("\n")
            while (sqlite3_step(queryStatement) == SQLITE_ROW) {
                var row: [String] = []
                
                row.append(String(cString: sqlite3_column_text(queryStatement, 0)))
                if let type = sqlite3_column_text(queryStatement, 1) {
                    row.append(String(cString: type))
                } else {
                    row.append("-")
                }
                if let title = sqlite3_column_text(queryStatement, 2) {
                    row.append(String(cString: title))
                } else {
                    row.append("-")
                }
                if let director = sqlite3_column_text(queryStatement, 3) {
                    row.append(String(cString: director))
                } else {
                    row.append("-")
                }
                if let cast = sqlite3_column_text(queryStatement, 4) {
                    row.append(String(cString: cast))
                } else {
                    row.append("-")
                }
                if let country = sqlite3_column_text(queryStatement, 5) {
                    row.append(String(cString: country))
                } else {
                    row.append("-")
                }
                if let date_added = sqlite3_column_text(queryStatement, 6) {
                    row.append(String(cString: date_added))
                } else {
                    row.append("-")
                }
                if let release_year = sqlite3_column_text(queryStatement, 7) {
                    row.append(String(cString: release_year))
                } else {
                    row.append("-")
                }
                if let rating = sqlite3_column_text(queryStatement, 8) {
                    row.append(String(cString: rating))
                } else {
                    row.append("-")
                }
                if let duration = sqlite3_column_text(queryStatement, 9) {
                    row.append(String(cString: duration))
                } else {
                    row.append("-")
                }
                if let listed_in = sqlite3_column_text(queryStatement, 10) {
                    row.append(String(cString: listed_in))
                } else {
                    row.append("-")
                }
                if let description = sqlite3_column_text(queryStatement, 11) {
                    row.append(String(cString: description))
                } else {
                    row.append("-")
                }
                

                model.append(NetflixVideoModel(show_id: row[0],
                                                type: row[1],
                                                title: row[2],
                                                director: row[3],
                                                cast: [row[4]],
                                                coutry: row[5],
                                                date_added: row[6],
                                                release_year: row[7],
                                                rating: row[8],
                                                duration: row[9],
                                                listed_in: row[10],
                                                description: row[11]))
            }
          } else {
              let errorMessage = String(cString: sqlite3_errmsg(db))
              print("\nQuery is not prepared \(errorMessage)")
          }
          sqlite3_finalize(queryStatement)
            return model
        }
        
        func getMovies() -> [NetflixVideoModel]  {
          var queryStatement: OpaquePointer?
            var model: [NetflixVideoModel] = []
          if sqlite3_prepare_v2(db, "select * from netflix_titles where type=\"Movie\"", -1, &queryStatement, nil) == SQLITE_OK {
            print("\n")
            while (sqlite3_step(queryStatement) == SQLITE_ROW) {
                var row: [String] = []
                
                row.append(String(cString: sqlite3_column_text(queryStatement, 0)))
                if let type = sqlite3_column_text(queryStatement, 1) {
                    row.append(String(cString: type))
                } else {
                    row.append("-")
                }
                if let title = sqlite3_column_text(queryStatement, 2) {
                    row.append(String(cString: title))
                } else {
                    row.append("-")
                }
                if let director = sqlite3_column_text(queryStatement, 3) {
                    row.append(String(cString: director))
                } else {
                    row.append("-")
                }
                if let cast = sqlite3_column_text(queryStatement, 4) {
                    row.append(String(cString: cast))
                } else {
                    row.append("-")
                }
                if let country = sqlite3_column_text(queryStatement, 5) {
                    row.append(String(cString: country))
                } else {
                    row.append("-")
                }
                if let date_added = sqlite3_column_text(queryStatement, 6) {
                    row.append(String(cString: date_added))
                } else {
                    row.append("-")
                }
                if let release_year = sqlite3_column_text(queryStatement, 7) {
                    row.append(String(cString: release_year))
                } else {
                    row.append("-")
                }
                if let rating = sqlite3_column_text(queryStatement, 8) {
                    row.append(String(cString: rating))
                } else {
                    row.append("-")
                }
                if let duration = sqlite3_column_text(queryStatement, 9) {
                    row.append(String(cString: duration))
                } else {
                    row.append("-")
                }
                if let listed_in = sqlite3_column_text(queryStatement, 10) {
                    row.append(String(cString: listed_in))
                } else {
                    row.append("-")
                }
                if let description = sqlite3_column_text(queryStatement, 11) {
                    row.append(String(cString: description))
                } else {
                    row.append("-")
                }
                

                model.append(NetflixVideoModel(show_id: row[0],
                                                type: row[1],
                                                title: row[2],
                                                director: row[3],
                                                cast: [row[4]],
                                                coutry: row[5],
                                                date_added: row[6],
                                                release_year: row[7],
                                                rating: row[8],
                                                duration: row[9],
                                                listed_in: row[10],
                                                description: row[11]))
            }
          } else {
              let errorMessage = String(cString: sqlite3_errmsg(db))
              print("\nQuery is not prepared \(errorMessage)")
          }
          sqlite3_finalize(queryStatement)
            return model
        }

    func getCountries() -> [NetflixVideoModel]  {
//        var model: [NetflixVideoModel] = []
//      var queryStatement: OpaquePointer?
//      if sqlite3_prepare_v2(db, "Select country from netflix_titles group by country", -1, &queryStatement, nil) == SQLITE_OK {
//        print("\n")
//        while (sqlite3_step(queryStatement) == SQLITE_ROW) {
//            var row: [String] = []
//
//            if let coutry = sqlite3_column_text(queryStatement, 0),
//
//               !row.contains(String(String(cString: coutry).split(separator: ",")[0])){
//
//                row.append(oneCountry)
//            } else {
//                row.append("-")
//            }
//            model.append(NetflixVideoModel(show_id: row[0],
//                                            type: "-",
//                                            title: "-",
//                                            director: "-",
//                                            cast: ["-"],
//                                            coutry: "-",
//                                            date_added: "-",
//                                            release_year: "-",
//                                            rating: "-",
//                                            duration: "-",
//                                            listed_in: "-",
//                                            description: "-"))
//        }
//      } else {
//          let errorMessage = String(cString: sqlite3_errmsg(db))
//          print("\nQuery is not prepared \(errorMessage)")
//      }
//      sqlite3_finalize(queryStatement)
        return []
    }
}
