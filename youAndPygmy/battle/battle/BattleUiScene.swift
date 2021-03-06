//
//  BattleUiScene.swift
//  youAndPygmy
//
//  Created by tomonori takada on 2018/03/10.
//  Copyright © 2018年 tomonori takada. All rights reserved.
//

import Foundation
import SpriteKit

class BattleUiScene{
    private static let mScene=createScene()
    //シーン表示
    static func display(){
        gGameViewController.set2dScene(aScene:mScene)
    }
    //シーン生成
    static func createScene()->SKScene{
        let tScene=SKScene(fileNamed:"battleDataUi")!
        //キャラ,マス情報表示変更
        tScene.childNode(withName:"selectedDataBox")!.childNode(withName:"changeButton")!.setElement("tapFunction",{()->()in BattleDataUi.changeInfo()})
        //移動,攻撃ボタン
        tScene.childNode(withName:"charaControlButton0")!.setElement("tapFunction",{()->()in
            CharaControlUi.pushedButton0()})
        tScene.childNode(withName:"charaControlButton1")!.setElement("tapFunction",{()->()in
            CharaControlUi.pushedButton1()})
        tScene.childNode(withName:"charaControlButton2")!.setElement("tapFunction",{()->()in
            CharaControlUi.pushedButton2()})
        //使用可能スキル
        let tSkillBox=tScene.childNode(withName:"choiceSkillBox")!
        for i in 0...3{
            tSkillBox.childNode(withName:"skill"+String(i))!.setElement("tapFunction",{()->()in
                CharaController.tapSkillBar(aNum:i)
                })
        }
        //使用可能アイテム
        tSkillBox.childNode(withName:"itemBox")!.setElement("tapFunction",{()->()in
            CharaController.tapSkillBar(aNum:4)
            })
        return tScene
    }
    //シーン初期化
    static func initScene(){
        //行動するキャラのデータ
        mScene.childNode(withName:"turnCharaDataBox")!.childNode(withName:"charaData")!.alpha=0
        //タップされたマスのデータ
        let tSelectedBox=mScene.childNode(withName:"selectedDataBox")!
        tSelectedBox.childNode(withName:"charaData")!.alpha=0
        tSelectedBox.childNode(withName:"troutData")!.alpha=0
        //スキルのデータ
        mScene.childNode(withName:"selectedCharaSkillBox")!.childNode(withName:"data")!.alpha=0
        //ユーザの操作用のボタン
        mScene.childNode(withName:"charaControlButton0")!.alpha=0
        mScene.childNode(withName:"charaControlButton1")!.alpha=0
        //使用可能スキル表示
        mScene.childNode(withName:"choiceSkillBox")!.alpha=0
        //スキルアラート
        mScene.childNode(withName:"skillAlert")!.alpha=0
        //ダメージ予測
        mScene.childNode(withName:"predictionBox")!.alpha=0
    }
    //ノード取得
    static func getNode(aName:String)->SKNode?{
        return mScene.childNode(withName:aName)
    }
}
