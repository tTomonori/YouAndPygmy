//
//  DataUi.swift
//  youAndPygmy
//
//  Created by tomonori takada on 2018/03/08.
//  Copyright © 2018年 tomonori takada. All rights reserved.
//

import Foundation
import SpriteKit

class BattleDataUi{
    static func setTurnCharaData(aChara:BattleChara){
        setCharaBox(
            aNode:Battle.getNodeFromScene(aName:"turnCharaDataBox")!.childNode(withName:"charaData")!,
            aChara:aChara
        )
    }
    static func setTroutData(aTrout:BattleTrout){
        let tSelectedBox=Battle.getNodeFromScene(aName:"selectedDataBox")!
        let tChara=aTrout.getRidingChara()
        let tTroutBox=tSelectedBox.childNode(withName:"troutData")!
        let tCharaBox=tSelectedBox.childNode(withName:"charaData")!
        let tButton=tSelectedBox.childNode(withName:"changeButton")!
        //マスの情報
        setTroutBox(aNode:tTroutBox,aTrout:aTrout)
        //キャラ,スキルの情報
        if(tChara != nil){
            setCharaBox(aNode:tCharaBox,aChara:tChara!)
            setSkillBox(aChara:tChara!)
        }
        else{
            resetSkillBox()
        }
        
        if(tChara != nil){
            //キャラがいる
            tTroutBox.alpha=0
            tCharaBox.alpha=1
            tButton.alpha=1
        }
        else{
            //キャラがいない
            tTroutBox.alpha=1
            tCharaBox.alpha=0
            tButton.alpha=0
        }
    }

    static func setCharaBox(aNode:SKNode,aChara:BattleChara){
        //画像
        PygmyImageMaker.setImage(aNode:aNode.childNode(withName:"charaImage")!,aImageData:aChara.getImage())
        //レベル
        (aNode.childNode(withName:"level") as! SKLabelNode).text=String(aChara.getLevel())
        //名前
        (aNode.childNode(withName:"name") as! SKLabelNode).text=aChara.getName()
        //元気
        StatusBarMaker.setGage(aNode:aNode.childNode(withName:"hpBox")!,aCurrent:aChara.getCurrentHp(),aMax:aChara.getMaxHp())
        //やる気
        StatusBarMaker.setGage(aNode:aNode.childNode(withName:"mpBox")!,aCurrent:aChara.getCurrentMp(),aMax:aChara.getMaxMp())
        //アイテム
        ItemBarMaker.setItemLabel(aNode:aNode.childNode(withName:"itemBox")!,aItem:aChara.getItem())
        //ステータス
        let tStatusBox=aNode.childNode(withName:"statusBox")!
        for tStatusName in ["atk","def","ini","spt"]{
            let tStatus=aChara.getStatus(aStatus:tStatusName)
            (tStatusBox.childNode(withName:tStatusName+"Box")!.childNode(withName:"value") as! SKLabelNode).text=String(tStatus)
        }
    }
    static func setTroutBox(aNode:SKNode,aTrout:BattleTrout){
        //画像
        (aNode.childNode(withName:"troutImage") as! SKSpriteNode).texture=SKTexture(imageNamed:aTrout.getTroutImageName())
        //地形名
        (aNode.childNode(withName:"terrainBox")!.childNode(withName:"terrain") as! SKLabelNode).text=aTrout.getTerrain()
        //地形属性
        (aNode.childNode(withName:"attributeBox")!.childNode(withName:"attribute") as! SKLabelNode).text
            = aTrout.getAttribute().getName()
    }
    static func setSkillBox(aChara:BattleChara){
        
    }
    static func resetSkillBox(){
        
    }
    //情報変更ボタンが押された
    static func changeInfo(){
        let tSelectedBox=Battle.getNodeFromScene(aName:"selectedDataBox")!
        let tButton=tSelectedBox.childNode(withName:"changeButton")!
        if(tButton.alpha==0){return}//キャラがいないマス(ボタンが非表示)だったら何もしない
        let tTroutBox=tSelectedBox.childNode(withName:"troutData")!
        let tCharaBox=tSelectedBox.childNode(withName:"charaData")!
        tTroutBox.alpha=1-tTroutBox.alpha
        tCharaBox.alpha=1-tCharaBox.alpha
    }
}