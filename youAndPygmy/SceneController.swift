//
//  SceneController.swift
//  youAndPygmy
//
//  Created by tomonori takada on 2018/02/21.
//  Copyright © 2018年 tomonori takada. All rights reserved.
//

import Foundation

class SceneController{
    //アプリ起動
    static func didLoad(){
        Title.display()
        gGameViewController.allowUserOperate()
    }
    //ゲームスタート
    static func start(){
        //セーブデータ読み込み
        SaveData.load()
        SaveData.setData()
    }
    //メニューを開く
    static func openMainMenu(){
        MenuParent.display(aMenuName:"main",aClosedFunction:self.closedMenu,aOptions:[:])
    }
    //メニューが閉じられた
    static func closedMenu(){
        MapUi.display()
    }
    //マップ移動
    static func changeMap(aMapName:String,aPosition:FeildPosition,aEndFunction:@escaping ()->()){
        SceneChanger.animateChangeMap(aChanging:{()->()in
            //画面全体が隠れた
            MapFeild.setMap(aMapData:MapDictionary.get(aMapName))
            MapFeild.setHero(aPosition:aPosition)
            MapFeild.makeCameraFollowHero()
            MapFeild.display()
        }, aChanged:{()->()in
            //アニメーション終了
            aEndFunction()
        })
    }
    //戦闘シーン
    static func enterBattle(aEndFunction:@escaping ()->()){
        SceneChanger.animateEnterBattle(aChanging:{()->()in
            Battle.display()
        }, aChanged:{()->()in
            aEndFunction()
        })
    }
}
