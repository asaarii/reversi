//
//  File.swift
//  reversi
//
//  Created by 萬治佐友里 on 2017/04/27.
//  Copyright © 2017年 Monolith Works Inc. All rights reserved.
//

import UIKit

class Test: UIViewController {
    var x = 3
    var y = 3
    var color = 1
    var board = [[0,0,0,0,0,0,0,0],
                 [0,0,0,0,0,0,0,0],
                 [0,0,0,0,0,0,0,0],
                 [0,0,0,1,2,0,0,0],
                 [0,0,0,2,1,0,0,0],
                 [0,0,0,0,0,0,0,0],
                 [0,0,0,0,0,0,0,0],
                 [0,0,0,0,0,0,0,0]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//
//            for (row, cols) in board.enumerated() {
//                for (index, elements) in cols.enumerated() {
//                    var cols = cols
//                    if elements != color {
//                        continue
//                    } else if elements == 0 {
//                        break
//                    } else if elements == color {
//                        cols[elements - index] = 2
//                    }
//                }
//            }
//        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func check(/*  #置いた所の座標(h,w)#, #置いた色#  を受け取る*/) {
        //横を調べる
        for i in 0..<x {
            if board[y][x - i] == 0 {
                break
            } else if board [y][x - i] != 0 {
                continue
            } else if board[y][x - i] == color {
                for j in 0..<i {
                    board[y][x - j] = color
                }
            }
        }
        for i in x...7 {
            if board[y][x + i] == 0 {
                break
            } else if board [y][x + i] != 0 {
                continue
            } else if board[y][x + i] == color {
                for j in 0..<i {
                    board[y][x + j] = color
                }
            }
            
        }
        
        //縦を調べる
        for i in 0..<y {
            if board[y - i][x] == 0 {
                break
            } else if board [y - i][x] != 0 {
                continue
            } else if board[y - i][x] == color {
                for j in 0..<i {
                    board[y - j][x] = color
                }
            }
        }
        for i in y...7 {
            if board[y + i][x] == 0 {
                break
            } else if board [y + i][x] != 0 {
                continue
            } else if board[y + i][x] == color {
                for j in 0..<i {
                    board[y + j][x] = color
                }
            }
            
        }
        
        //斜め
        for i in 0..<x {
            if board[y - i][x - i] == 0 {
                break
            } else if board [y - i][x - i] != 0 {
                continue
            } else if board[y - i][x - i] == color {
                for j in 0..<i {
                    board[y - j][x - j] = color
                }
            }
        }
        for i in x...7 {
            if board[y + i][x + i] == 0 {
                break
            } else if board [y + i][x + i] != 0 {
                continue
            } else if board[y + i][x + i] == color {
                for j in 0..<i {
                    board[y + i][x + j] = color
                }
            }
            
        }
        for i in 0..<x {
            if board[y + i][x - i] == 0 {
                break
            } else if board [y + i][x - i] != 0 {
                continue
            } else if board[y + i][x - i] == color {
                for j in 0..<i {
                    board[y + j][x - j] = color
                }
            }
        }
        for i in x...7 {
            if board[y - i][x + i] == 0 {
                break
            } else if board [y - i][x + i] != 0 {
                continue
            } else if board[y - i][x + i] == color {
                for j in 0..<i {
                    board[y - j][x + j] = color
                }
            }
            
        }


    }
}
