. Test Case 5: Base-Relative Addressing
. Tests: BASE directive and base-relative addressing

BASE    START   5000
START   LDA     #0
        STA     INDEX
        BASE    TABLE       . Set base register
        
LOOP    LDA     ENTRY1      . Base-relative
        ADD     ENTRY2      . Base-relative
        STA     RESULT      . Base-relative
        LDA     INDEX
        ADD     #1
        STA     INDEX
        COMP    #5
        JLT     LOOP
        
        NOBASE              . Clear base register
        RSUB

INDEX   RESW    1
RESULT  RESW    1

. Large gap to force base-relative addressing
        RESB    500

TABLE   WORD    100
ENTRY1  WORD    10
ENTRY2  WORD    20
ENTRY3  WORD    30
ENTRY4  WORD    40
ENTRY5  WORD    50

        END     START