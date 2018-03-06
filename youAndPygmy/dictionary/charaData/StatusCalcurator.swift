//
//  StatusCalcurator.swift
//  youAndPygmy
//
//  Created by tomonori takada on 2018/02/25.
//  Copyright © 2018年 tomonori takada. All rights reserved.
//

import Foundation

class StatusCalcurator{
    //ステータス計算
    static func calcurate(aRaceStatus:Status,aLevel:Int,aPersonality:Status?)->Status{
        //個性値がnilなら全て0として扱う
        let tPersonality=(aPersonality != nil)
            ?aPersonality!
            :Status(hp:0,mp:0,atk:0,def:0,int:0,spt:0,dex:0,spd:0,pie:0)
        return Status(
            hp:(aRaceStatus.hp+tPersonality.hp*2)*(10+90*aLevel/100)/100,
            mp:(aLevel<50)
                ?(aRaceStatus.mp+tPersonality.mp)*(10+90*aLevel/50)/100
                :(aRaceStatus.mp+tPersonality.mp),
            atk:(aRaceStatus.atk+tPersonality.atk)*(5+95*aLevel/100)/100,
            def:(aRaceStatus.def+tPersonality.def)*(5+95*aLevel/100)/100,
            int:(aRaceStatus.int+tPersonality.int)*(5+95*aLevel/100)/100,
            spt:(aRaceStatus.spt+tPersonality.spt)*(5+95*aLevel/100)/100,
            dex:(aRaceStatus.dex+tPersonality.dex)*(5+95*aLevel/100)/100,
            spd:(aRaceStatus.spd+tPersonality.spd)*(5+95*aLevel/100)/100,
            pie:(aRaceStatus.pie+tPersonality.pie)*(5+95*aLevel/100)/100
        )
    }
}

struct Status{
    let hp:Int//元気
    let mp:Int//やる気
    let atk:Int//力強さ
    let def:Int//打強さ
    let int:Int//賢さ
    let spt:Int//聡明さ
    let dex:Int//器用さ
    let spd:Int//素早さ
    let pie:Int//優しさ
    func get(key:String)->Int{
        switch key {
        case "hp":return hp
        case "mp":return mp
        case "atk":return atk
        case "def":return def
        case "ini":return int
        case "spt":return spt
        case "dex":return dex
        case "spd":return spd
        case "pie":return pie
        default:print("不正なステータス名",key)
        }
        return 0
    }
}
struct Mobility{
    let mov:Double//移動力
    let grass:Double//草原
    let sand:Double//砂地
    let water:Double//水路
    let magma:Double//溶岩
    let snow:Double//雪原
    let ice:Double//氷上
    let air:Double//空中
    func get(key:String)->Double{
      switch key {
        case "move":fallthrough
        case "mov":return mov
        case "grass":return grass
        case "sand":return sand
        case "water":return water
        case "magma":return magma
        case "snow":return snow
        case "ice":return ice
        case "air":return air
        default:print("不正な地形属性名",key)
      }
      return -1
    }
}
func + (left:Status,right:Status)->Status{
    return Status(
        hp: left.hp+right.hp,
        mp: left.mp+right.mp,
        atk: left.atk+right.atk,
        def: left.def+right.def,
        int: left.int+right.int,
        spt: left.spt+right.spt,
        dex: left.dex+right.dex,
        spd: left.spd+right.spd,
        pie: left.pie+right.pie
    )
}
