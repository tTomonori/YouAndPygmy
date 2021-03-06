//
//  define.swift
//  youAndPygmy
//
//  Created by tomonori takada on 2018/02/13.
//  Copyright © 2018年 tomonori takada. All rights reserved.
//

import Foundation
import SpriteKit
import SceneKit

let gEmptyFunction={()->()in}

//小数点以下取得
func decimal(aNum:Float)->Float{
    return aNum-floor(aNum)
}
//Double * Int
func * (left:Double,right:Int)->Double{
    return left * Double(right)
}
//Int / Double
func / (left:Int,right:Double)->Double{
    return Double(left) / right
}
//float + int
func + (left: Float, right: Int) -> Float{
    return left + Float(right)
}
//int + float
func + (left: Int, right: Float) -> Float{
    return Float(left) + right
}
//float * int
func * (left: Float, right: Int) -> Float{
    return left * Float(right)
}
//int + CGFloat
func + (left: Int, right: CGFloat) -> Float{
    return left + Float(right)
}
//int * CGFloat
func * (left: Int, right: CGFloat) -> CGFloat{
    return CGFloat(left) * right
}
//cgpoint - cgpoint
func - (left:CGPoint,right:CGPoint)->CGPoint{
    return CGPoint(x:left.x-right.x,y:left.y-right.y)
}
//指定方向の逆向きを返す
func getReverseDirection(aDirection:String)->String{
    switch aDirection {
    case "up":return "down"
    case "down":return "up"
    case "left":return "right"
    case "right":return "left"
    default:print("逆方向がない方向だよ→",aDirection)
    }
    return "error"
}

//3d座標
struct FeildPosition{
    let x:Int
    let y:Int
    let z:Int
}
//2d座標
struct BattlePosition{
    let x:Int
    let y:Int
    func convertVector()->SCNVector3{
        return SCNVector3(x*gTroutSizeCG,0.5*gTroutSizeCG,y*gTroutSizeCG)
    }
}
//BattlePosition + (Int,Int)
func + (left:BattlePosition,right:(Int,Int))->BattlePosition{
    return BattlePosition(x:left.x+right.0,y:left.y+right.1)
}
//sksceneのサイズ
let gSceneSize=CGSize(width:800,height:450)

extension NSObject{
    func getAccessibilityElement(_ key:String)->Any?{
        if(self.accessibilityElements==nil){return nil}
        return (self.accessibilityElements![0] as! Dictionary<String,Any>)[key]
    }
    func setElement(_ key:String,_ value:Any?){
        var tDictionary:Dictionary<String,Any>
        if(self.accessibilityElements==nil){tDictionary=[:];self.accessibilityElements=[[:]]}
        else{tDictionary=self.accessibilityElements![0] as! Dictionary<String, Any>}
        tDictionary[key]=value
        self.accessibilityElements![0]=tDictionary
    }
}
/*
 switch aDirection {
 case "up":
 case "down":
 case "left":
 case "right":
 default:print("不正な方向→",aDirection)
 }
 */

/*
 mScene=SKScene(fileNamed:"")
 //タップ時関数セット
 for tNode in mScene.children{
 if(tNode.name==nil){continue}
 switch tNode.name! {
 case "menu":
 default:break
 }
 }
*/
