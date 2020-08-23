: blink
    13 1 pinMode
    begin
        13 0 pinWrite
        500 delay
        13 1 pinWrite
        500 delay
    0 until 
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

: 2num 0 0 bl word count >number swap drop
    if 
      ." The string is not a valid number." exit
    then
    state @
    if
      swap postpone literal postpone literal
    then
; immediate

2num 123456789 d.
: big_num 2num 187960166 ;
big_num d.
