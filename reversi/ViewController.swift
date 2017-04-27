//
//  ViewController.swift
//  reversi
//
//  Created by 萬治佐友里 on 2017/04/27.
//  Copyright © 2017年 Monolith Works Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var board = [[0,0,0,0,0,0,0,0],
                 [0,0,0,0,0,0,0,0],
                 [0,0,0,0,0,0,0,0],
                 [0,0,0,0,0,0,0,0],
                 [0,0,0,0,0,0,0,0],
                 [0,0,0,0,0,0,0,0],
                 [0,0,0,0,0,0,0,0],
                 [0,0,0,0,0,0,0,0]]
    var tapCount = 0
    var color: Int!
    //押された、押されてない状態を管理する
    var tapChecker: Int!
    var views: Array<Array<UIView>> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /* let screenView = ScreenView(
         frame: CGFloat(x:0, y:0, height: self.view.frame.height, width: self.view.frame.width),
         tapped: { (tapChecker) in
         
         })
         */
        
        
        var count: Int = 0
        
        for i in 0...7 {
            var horizontalViews: Array<UIView> = []
            for j in 0...7 {
                
                let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapCell(sender:)))  //Swift3
                tap.numberOfTapsRequired = 1
                
                let cell = UIView()
                cell.translatesAutoresizingMaskIntoConstraints = false
                cell.backgroundColor = UIColor.lightGray
                cell.addGestureRecognizer(tap)
                cell.tag = count
                view.addSubview(cell)
                
                count = count + 1
                horizontalViews.append(cell)
                
                // Constraints
                NSLayoutConstraint.activate([
                    cell.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat((667 - 66) / 8 * (i + 1))),
                    cell.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat(j * 46)),
                    cell.heightAnchor.constraint(equalToConstant: (view.frame.height - 66) / 8),
                    cell.widthAnchor.constraint(equalToConstant: 46)
                    ])
                
                let line = UIView()
                line.translatesAutoresizingMaskIntoConstraints = false
                line.backgroundColor = UIColor.black
                cell.addSubview(line)
                
                // Constraints
                NSLayoutConstraint.activate([
                    line.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0),
                    line.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 0),
                    line.heightAnchor.constraint(equalToConstant: 1),
                    line.widthAnchor.constraint(equalToConstant: 46)
                    ])
                
                let verticalLine = UIView()
                verticalLine.translatesAutoresizingMaskIntoConstraints = false
                verticalLine.backgroundColor = UIColor.black
                cell.addSubview(verticalLine)
                
                // Constraints
                NSLayoutConstraint.activate([
                    verticalLine.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0),
                    verticalLine.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 0),
                    verticalLine.heightAnchor.constraint(equalToConstant: 83),
                    verticalLine.widthAnchor.constraint(equalToConstant: 1)
                    ])
                
                
            }
            views.append(horizontalViews)
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tapCell(sender: UITapGestureRecognizer) {
        let view = sender.view
        
        tapCount = tapCount + 1
        if tapCount % 2 == 0 {
            color = 2
            //view?.backgroundColor = .black
        } else {
            color = 1
            //view?.backgroundColor = .white
        }
        
        print("TAPPED", view?.tag)
        let x = Int((view?.tag)! / 8)
        let y = (view?.tag)! % 8
        print("x,y = \(x, y)", color)
        check(x: x, y: y, color: color)
        
        view?.removeGestureRecognizer(sender)
    }
    
    func check(x: Int, y: Int, color: Int) {
        //横を調べる
        board[x][y] = color
        for i in 0..<x {
            if board[x - i][y] == 0 {
                break
                //     } else if board [y][x - i] != 0 {
                //continue
            } else if board[x - i][y] == color {
                for j in 0...i {
                    board[x - j][y] = color
                }
            }
        }
        for i in x..<7 {
            if board[i + 1][y] == 0 {
                break
                //      } else if board [y][i] != 0 {
                //          continue
            } else if board[i + 1][y] == color {
                for j in x..<i {
                    board[x + j][y] = color
                }
            }
            
        }
        
        //縦を調べる
        for i in 0..<y {
            if board[x][y - i] == 0 {
                break
                //        } else if board [y - i][x] != 0 {
                //           continue
            } else if board[x][y - i] == color {
                for j in 0..<i {
                    board[x][y - j] = color
                }
            }
        }
        for i in y...7 {
            if board[x][i] == 0 {
                break
                //        } else if board [i][x] != 0 {
                //           continue
            } else if board[x][i] == color {
                for j in y..<i {
                    board[x][y + j] = color
                }
            }
            
        }
        
        //斜め
        for i in 0..<x {
            if board[y - i][x - i] == 0 {
                break
                //         } else if board [y - i][x - i] != 0 {
                //             continue
            } else if board[y - i][x - i] == color {
                for j in 0..<i {
                    board[y - j][x - j] = color
                }
            }
        }
        //        for i in x...7 {
        //            if board[i][i] == 0 {
        //                break
        //     //       } else if board [i][i] != 0 {
        //     //           continue
        //            } else if board[i][i] == color {
        //                for j in 0..<i {
        //                    board[j][j] = color
        //                }
        //            }
        //
        //        }
        //        for i in 0..<x {
        //            if board[y + i][x - i] == 0 && (y + i) <= 7 {
        //                break
        //      //      } else if board [y + i][x - i] != 0 && (y + i) <= 7 {
        //      //          continue
        //            } else if board[y + i][x - i] == color && (y + i) <= 7 {
        //                for j in 0..<i {
        //                    board[y + j][x - j] = color
        //                }
        //            }
        //        }
        //        for i in x...7 {
        //            if (x + i) <= 7 && (y - i) >= 0 {
        //                if board[y - i][x + i] == 0  {
        //                    break
        //      //          } else if board [y - i][x + i] != 0 {
        //      //              continue
        //                } else if board[y - i][x + i] == color {
        //                    for j in 0..<i {
        //                        board[y - j][x + j] = color
        //                    }
        //                }
        //                
        //            }
        //        }*/
        
        
        //print(board)
        updateColor()
    }
    
    func updateColor() {
        //print(board)
        //print("VIEWS", views[0][0])
       // views[0][0].backgroundColor = .red
        for (x, i) in board.enumerated() {
            for (y, j) in i.enumerated() {
                if board[x][y] == 1 {
                    let h = x
                    let v = y
                    print("HV1", h, v)
                    views[h][v].backgroundColor = .white
                } else if board[x][y] == 2 {
                    let h = x
                    let v = y
                    print("HV2", h, v)
                    views[h][v].backgroundColor = .black
                }
                
            }
        }
        
    }
    
}
