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

: dabs ( d1 -- d2 )
    dup 0< 
    if 
        swap dup 0= abs swap invert 1+ rot invert rot + 
    then 
;


 : d. ( d -- )
    dup >r dabs <# #s r> sign #> type space 
;

 : du. ( du -- )
    <# #s #> type space
;

: 2num ("<spaces>string" -- |d )
    0 0 bl word count >number swap drop
    if 
      ." Invalid number" exit
    then
    state @
    if
      swap postpone literal postpone literal
    then
; immediate

2num 123456789 d.
: big_num 2num 187960166 ;
big_num d.
