: blink ( 2 -- ) ( 'pin#' 'seconds' blink )
    over 1 pinMode
    dup 
    if
      begin
          over 0 pinWrite
          500 delay
          over 1 pinWrite
          500 delay
          1- dup 0=
      until
    then
    2drop
;

: d0= ( d -- flag )
    0= swap 0= + -2 = 
;

: d0<> ( d -- flag )
    d0= invert 
;

: dnegate ( d -- d )
    invert swap negate swap over 0=
    if 1+ then
;

: dabs ( d1 -- d2 )
    dup 0<
    if
      dnegate
    then
;

: d. ( d -- )
    dup >r dabs <# # #s r> sign #> type space 
;

 : du. ( du -- )
    <# # #s #> type space
;

: 2num ( "spaces<ccc>" -- |d )
    0 0 bl word count
    over c@ [char] - = dup >r
    if
      1- swap 1+ swap
    then
    >number swap drop
    if 
      ." Invalid number" exit
    then
    state @
    if
      swap postpone literal postpone literal
    then
    r>
    if
      dnegate
    then
; immediate

2num -123456789 d.
2num  123456789 d.
: big_num 2num 187960166 ;
big_num d.
: big_negative_num 2num -187960166 ;
big_negative_num d.
