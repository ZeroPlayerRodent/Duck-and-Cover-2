(customchars)

(loadchar 48
.xxxxx..
x.....x.
x.....x.
x.....x.
x.....x.
x.....x.
.xxxxx..
........
)

(loadchar 49
..xxx...
....x...
....x...
....x...
....x...
....x...
.xxxxxx.
........
)

(loadchar 50
.xxxxx..
......x.
......x.
.xxxxx..
x.......
x.......
.xxxxxx.
........
)

(loadchar 51
.xxxxx..
......x.
......x.
.xxxxx..
......x.
......x.
.xxxxx..
........
)

(loadchar 52
.x....x.
.x....x.
.x....x.
..xxxxx.
......x.
......x.
......x.
........
)

(loadchar 53
.xxxxxx.
x.......
x.......
xxxxxxx.
......x.
......x.
xxxxxxx.
........
)

(loadchar 54
.xxxxx..
x.......
x.......
xxxxxx..
x.....x.
x.....x.
.xxxxx..
........
)

(loadchar 55
xxxxxxx.
......x.
.....x..
....x...
...x....
...x....
...x....
........
)

(loadchar 56
.xxxxx..
x.....x.
x.....x.
.xxxxx..
x.....x.
x.....x.
.xxxxx..
........
)

(loadchar 57
.xxxxx..
x.....x.
x.....x.
.xxxxx..
......x.
......x.
......x.
........
)

(loadchar 96
........
........
........
........
........
........
........
........
)

(loadchar 32
........
........
........
........
........
........
........
........
)

(loadchar 0
xx.xxx.x
xxxxxxxx
x.xxxxxx
xxxxxx.x
xxx.xxxx
xxxxxxxx
xx.xxxxx
.x..x..x
)

(loadchar 1
xxxxxxxx
xx..xxx.
..xx..xx
xxxxxxxx
x..xxx..
.xx..xxx
xxxxxxxx
x.x.x.x.
)

(loadchar 2
....x...
....x...
...x....
...x....
....x...
....x...
...x....
...x....
)

(loadchar 89
........
.x......
.x...x..
.x...x..
.x...x.x
.x.x.x.x
.x.x.x.x
.x.x.x.x
)

(loadsprite 0
..xxxx..
..x..x..
)

(loadsprite 1
..x.....
...xx...
..x.xx..
xxxxxx..
..xxxx..
xxxxxxxx
.xxxxxx.
)

(loadsprite 2
..xxxx..
xxxxxxxx
xxxxxxxx
.xxxxxx.
.xxxxxx.
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
..xxxx..
...xx...
)

(loadsprite 3
x..x...x
...x....
....x.x.
x...x...
...x.x..
.x.x...x
.x.xx...
xx.xx.x.
xx.xx.x.
xx.x...x
.xxxx.xx
xxxxxxxx
.xxxxxxx
xxxxxxxx
.xxxxxx.
..xxxx..
)

(loadsprite 4
..x.....
...xx...
..x.xx..
xxxxxx..
..xxxx..
.xxxxxx.
xxxxxxxx
)

(plotcolor 1 31 1)
(plotcolor 1 32 1)
(plotcolor 1 33 1)
(plotcolor 1 34 1)
(plotcolor 1 35 1)
(plotcolor 1 36 1)

(plotcolor 2 31 14)
(plotcolor 2 32 14)
(plotcolor 2 33 14)
(plotcolor 2 34 14)
(plotcolor 2 35 14)
(plotcolor 2 36 14)

(setsprite 0 0)
(setsprite 4 0)
(setsprite 1 1)
(setsprite 5 1)
(setsprite 2 2)
(setsprite 6 2)
(setsprite 3 3)
(setsprite 7 3)

(put 7 player0color)
(put 7 player1color)

(put 1 player4color)
(put 1 player5color)

(put 12 player2color)
(put 12 player6color)

(put 2 player3color)
(put 2 player7color)

(put 0 backgroundcolor)
(put 0 bordercolor)

(newvar mods 0)
(newvar modbounce 0)
(routine changemods
  (when (joyup)
    (when (equal modbounce 0)
      (resetscore2)
      (put (+ mods 1) mods)
      (when (> mods 31)
        (put 0 mods)
      )
      (when (> mods 0)
        (addpoints2 mods)
      )
    )
    (put 1 modbounce)
    (goto nomodbounce)
  )
  (put 0 modbounce)
  (label nomodbounce)
)

(newvar wipex 0)
(newvar wipey 0)
(routine wipe
  (put 1 wipex)
  (put 1 wipey)
  (loop
    (when (> wipey 23)(break))
    (loop
      (when (equal wipex 30)(break))
      (plot wipey wipex 96)
      (plotcolor wipey wipex 9)
      (when (equal wipey 23)
        (plotcolor wipey wipex 5)
      )
      (put (+ wipex 1) wipex)
    )
    (put 1 wipex)
    (put (+ wipey 1) wipey)
  )
)

(resetscore)
(resetscore2)

(execute wipe)

(newvar line 0)

(loop
  (when (> line 22) (break))
  (plot line 30 2)
  (plotcolor line 30 1)
  (put (+ line 1) line)
)

(newvar line2 1)
(loop
  (when (equal line2 29) (break))
  (plot 24 line2 1)
  (plotcolor 24 line2 6)
  (plotcolor 23 line2 5)
  (put (+ line2 1) line2)
)

(plot 18 10 0)
(plot 18 11 0)
(plot 18 12 0)
(plot 18 13 0)
(plot 18 14 0)
(plot 18 15 0)

(plot 23 10 89)
(plot 23 11 89)
(plot 23 12 89)
(plot 23 13 89)
(plot 23 14 89)
(plot 23 15 89)

(put 125 player0x)
(put 190 player0y)

(put 125 player1x)
(put (- 190 14) player1y)

(loop
  (execute changemods)
  (when (joyfire)
    (goto resetgame)
  )
  (drawscreen)
)

(label resetgame)

(newarray music 9 0 9 0 9 0 9 0 5 0 5 0 5 0 5 0)
(newarray piano 0 0 0 0 0 0 0 0 0 20 15 20 15 0 15 0 0 0 0 0 0 0 0 0 0 5 10 15 20 25 30 0 0 0 0 0 0 0 0 0 10 0 10 0 10 0 10 0)
(newvar musicdex 0)
(newvar pianodex 0)
(newvar notetime 6)
(newvar thenote 0)

(put 25 sound2-pulse-hi)
(put 50 sound1-pulse-hi)

(routine playnote
  (when (> musicdex 15)
    (put 0 musicdex)
  )
  (when (> pianodex 47)
    (put 0 pianodex)
  )
  (when (> notetime 0)
    (put (- notetime 1) notetime)
  )
  (when (equal notetime 0)
    (put (index musicdex music) thenote)
    (when (> thenote 0)
      (put (index musicdex music) sound1-freq-hi)
      (playsound1)
    )
    (when (equal thenote 0)
      (mutesound1)
    )

    (put (index pianodex piano) thenote)
    (when (> thenote 0)
      (put (index pianodex piano) sound2-freq-hi)
      (playsound2)
    )
    (when (equal thenote 0)
      (mutesound2)
    )
    (put (+ musicdex 1) musicdex)
    (put (+ pianodex 1) pianodex)
    (put 6 notetime)
  )
)

(execute wipe)

(put 0 player3y)
(put 0 player7y)

(put 125 player0x)
(put 190 player0y)

(put 125 player4x)
(put 190 player4y)

(put 100 player2x)
(put 0 player2y)

(put 200 player6x)
(put 0 player6y)

(newvar platx 1)
(newvar platy 10)

(newvar platx2 10)
(newvar platy2 18)

(newvar temp 0)
(newvar wait 1)

(newvar movereset 15)

(when (equal (and mods 1) 1)
  (put 8 movereset)
)

(routine moveplat
  (when (> wait 0)
    (put (- wait 1) wait)
  )
  (when (equal wait 0)
    (plot platy platx 32)
    (plot 23 platx 32)

    (plot platy2 platx2 32)
    (plot 23 platx2 32)

    (put (+ platx 1) platx)
    (put (+ platx2 1) platx2)

    (when (equal platx 24)
      (put 0 temp)
      (loop
        (when (equal temp 6)(break))
        (plot platy (+ platx temp) 32)
        (plot 23 (+ platx temp) 32)
        (put (+ temp 1) temp)
      )
      (put 1 platx)
      (put (random) platy)
      (put (and platy 31) platy)
      (when (< platy 6)
        (put 6 platy)
      )
      (when (> platy 20)
        (put 20 platy)
      )
    )

    (when (equal platx2 24)
      (put 0 temp)
      (loop
        (when (equal temp 6)(break))
        (plot platy2 (+ platx2 temp) 32)
        (plot 23 (+ platx2 temp) 32)
        (put (+ temp 1) temp)
      )
      (put 1 platx2)
      (put (random) platy2)
      (put (and platy2 31) platy2)
      (when (< platy2 6)
        (put 6 platy2)
      )
      (when (> platy2 20)
        (put 20 platy2)
      )
    )

    (put 0 temp)
    (loop
      (when (equal temp 6)(break))
      (plot platy (+ platx temp) 0)
      (plot 23 (+ platx temp) 89)
      (put (+ temp 1) temp)
    )

    (plot 23 platx2 89)
    (put 0 temp)
    (loop
      (when (equal temp 6)(break))
      (plot platy2 (+ platx2 temp) 0)
      (plot 23 (+ platx2 temp) 89)
      (put (+ temp 1) temp)
    )
    (put (+ player3x 8) player3x)
    (when (> player3x 200)
      (put 0 player3y)
    )
    (put (+ player7x 8) player7x)
    (when (> player7x 200)
      (put 0 player7y)
    )
    (addpoints 1)
    (put movereset wait)
  )
)

(resetscore)

(newvar didhit 0)
(newvar standing 0)
(newvar bounce 0)
(newvar goup 0)
(newvar stamina 15)
(newvar staminareset 10)

(newvar standing2 0)
(newvar bounce2 0)
(newvar goup2 0)
(newvar stamina2 10)

(when (equal (and mods 4) 4)
  (put 5 stamina)
  (put 5 stamina2)
  (put 5 staminareset)
)

(newvar p1dead 0)
(newvar p2dead 0)

(newvar rockettime 5)
(newvar rocketspeed 5)

(when (equal (and mods 2) 2)
  (put 10 rocketspeed)
)

(newvar boing 0)
(when (equal (and mods 8) 8)
  (put 1 boing)
)

(newvar duckspeed 2)
(when (equal (and mods 16) 16)
  (put 1 duckspeed)
)

(routine moveducks
  (when (equal p1dead 0)
    (setsprite 1 1)
    (when (joyfire)
      (setsprite 1 4)
      (when (equal bounce 0)
        (when (> stamina 0)
          (put (- stamina 1) stamina)
          (put 5 goup)
        )
      )
      (put 1 bounce)
      (goto skipjump)
    )
    (put 0 bounce)
    (label skipjump)

    (when (joyleft)
      (put (- player0x duckspeed) player0x)
    )
    (when (joyright)
      (put (+ player0x duckspeed) player0x)
    )
    (when (> player0x 230)
      (put 230 player0x)
    )
    (when (< player0x 50)
      (put 50 player0x)
    )
    (put player0x player1x)
    (put (- player0y 14) player1y)
  )

  (when (equal p2dead 0)
    (setsprite 5 1)
    (when (joyfire2)
      (setsprite 5 4)
      (when (equal bounce2 0)
        (when (> stamina2 0)
          (put (- stamina2 1) stamina2)
          (put 5 goup2)
        )
      )
      (put 1 bounce2)
      (goto skipjump2)
    )
    (put 0 bounce2)
    (label skipjump2)

    (when (joyleft2)
      (put (- player4x duckspeed) player4x)
    )
    (when (joyright2)
      (put (+ player4x duckspeed) player4x)
    )
    (when (> player4x 230)
      (put 230 player4x)
    )
    (when (< player4x 50)
      (put 50 player4x)
    )
    (put player4x player5x)
    (put (- player4y 14) player5y)
  )
)

(routine docollisions
  (hitboxes 10 20 5 5)
  (when (collision 2 1)
    (put 1 p1dead)
  )
  (hitboxes 10 20 5 5)
  (when (collision 6 1)
    (put 1 p1dead)
  )
  (hitboxes 10 25 5 5)
  (when (collision 3 1)
    (put 1 p1dead)
  )
  (hitboxes 10 25 5 5)
  (when (collision 7 1)
    (put 1 p1dead)
  )

  (hitboxes 10 20 5 5)
  (when (collision 2 5)
    (put 1 p2dead)
  )
  (hitboxes 10 20 5 5)
  (when (collision 6 5)
    (put 1 p2dead)
  )
  (hitboxes 10 25 5 5)
  (when (collision 3 5)
    (put 1 p2dead)
  )
  (hitboxes 10 25 5 5)
  (when (collision 7 5)
    (put 1 p2dead)
  )

  (when (> player1y 245)
    (put 1 p1dead)
  )
  (when (> player5y 245)
    (put 1 p2dead)
  )

  (when (equal p1dead 1)
    (put 0 player0x)
    (put 0 player0y)
    (put 0 player1x)
    (put 0 player1y)
  )
  (when (equal p2dead 1)
    (put 0 player4x)
    (put 0 player4y)
    (put 0 player5x)
    (put 0 player5y)
  )

  (when (equal p1dead 1)
    (when (equal p2dead 1)
      (goto gameover)
    )
  )

)

(loop

  (drawscreen)

  (execute playnote)

  (put 7 player0color)
  (put 7 player1color)
  (when (< stamina 4)
    (put 4 player0color)
    (put 4 player1color)
  )

  (when (equal standing 1)
    (when (equal boing 1)
      (put 8 goup)
    )
    (put staminareset stamina)
    (when (equal wait 1)
      (put (+ player0x 8) player0x)
    )
  )
  (when (equal standing 0)
    (put (+ player0y 2) player0y)
  )

  (when (> goup 0)
    (when (> player0y 50)
      (put (- player0y 8) player0y)
    )
    (put (- goup 1) goup)
  )

  (put 1 player4color)
  (put 1 player5color)
  (when (< stamina2 4)
    (put 4 player4color)
    (put 4 player5color)
  )

  (when (equal standing2 1)
    (when (equal boing 1)
      (put 8 goup2)
    )
    (put staminareset stamina2)
    (when (equal wait 1)
      (put (+ player4x 8) player4x)
    )
  )
  (when (equal standing2 0)
    (put (+ player4y 2) player4y)
  )

  (when (> goup2 0)
    (when (> player4y 50)
      (put (- player4y 8) player4y)
    )
    (put (- goup2 1) goup2)
  )


  (execute moveplat)

  (execute moveducks)

  (put 0 standing)
  (put 0 standing2)
  (put bgcollision didhit)
  (when (equal (and didhit 1) 1)
    (when (< player0y 232)
      (put 1 standing)
    )
  )
  (when (equal (and didhit 16) 16)
    (when (< player4y 232)
      (put 1 standing2)
    )
  )
  (when (equal (and didhit 4) 4)
    (when (< player2y 200)
      (when (> (random) 200)
        (put (+ rocketspeed 1) rocketspeed)
      )
      (when (> rocketspeed 15)
        (put 15 rocketspeed)
      )
      (put player2x player3x)
      (put player2y player3y)
      (put 0 player2y)
      (put (random) player2x)
      (when (> player2x 230)
        (put 230 player2x)
      )
      (when (< player2x 25)
        (put 25 player2x)
      )
    )
  )

  (when (equal (and didhit 64) 64)
    (when (< player6y 200)
      (put player6x player7x)
      (put player6y player7y)
      (put 0 player6y)
      (when (equal p2dead 0)
        (put player4x player6x)
      )
      (when (equal p1dead 0)
        (put player0x player6x)
      )
    )
  )

  (when (equal (and didhit 8) 8)
    (when (< player3y 232)
      (put (- player3y 1) player3y)
    )
  )

  (when (equal (and didhit 128) 128)
    (when (< player7y 232)
      (put (- player7y 1) player7y)
    )
  )

  (when (> rockettime 0)
    (put (- rockettime 1) rockettime)
  )
  (when (equal rockettime 0)
    (put (+ player2y rocketspeed) player2y)
    (put (+ player6y (- rocketspeed 1)) player6y)
    (put 5 rockettime)
  )
  (when (> player2y 230)
    (put 0 player2y)
    (put (random) player2x)
    (when (> player2x 230)
      (put 230 player2x)
    )
    (when (< player2x 25)
      (put 25 player2x)
    )
  )
  (when (> player6y 230)
    (put 0 player6y)
    (when (equal p2dead 0)
      (put player4x player6x)
    )
    (when (equal p1dead 0)
      (put player0x player6x)
    )
  )

  (execute docollisions)
)

(label gameover)

(mutesound1)
(mutesound2)

(newvar hold 60)

(loop
  (execute changemods)
  (when (joyfire)
    (when (> hold 0)
      (put (- hold 1) hold)
    )
    (when (equal hold 0)
      (goto resetgame)
    )
  )
  (drawscreen)
)
