NB. The argument is a matrix with 3 columns (r g b).
NB. The first row specifies the remaining number of rows though
NB. with all columns having the same number.
output=: 3 : 0"2
  stderr CR , 'Scanlines remaining: ' , (":{.{.y) , ' '
  stdout (":}.y) ,. LF
)

main=: 3 : 0
  WIDTH   =. 256
  HEIGHT  =. 256
  WIDTH_1 =. <:WIDTH
  HEIGHT_1=. <:HEIGHT

  stdout 'P3' , LF , (":WIDTH) , ' ' , (":HEIGHT) , LF , '255' , LF

  clip=. <. @: (255.999&*)

  r=. clip (HEIGHT,WIDTH) $ (i.WIDTH) % WIDTH_1
  g=. clip |: (WIDTH,HEIGHT) $ (HEIGHT_1 - i.HEIGHT) % HEIGHT_1
  b=. clip (HEIGHT,WIDTH) $ 0.25
  i=. |.i.HEIGHT
  output i ,"(0 2) r ,"(0 1) g ,"0 b
  stderr LF , 'Done.' , LF
)
