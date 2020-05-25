       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         TEST1.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       DATA                DIVISION.
       WORKING-STORAGE     SECTION.
            COPY    "DB-BLOB".
            COPY    "DB-FETCH".
            COPY    "DB-MA".
       01 FETCH-RC  PIC S9(9)   BINARY.
       LINKAGE                 SECTION.
            COPY    "MCPAREA".
            COPY    "SPAAREA".
            COPY    "LINKAREA".
            COPY    "SCRAREA".

      ************************************************************************
       PROCEDURE           DIVISION    USING
           MCPAREA
           SPAAREA
           LINKAREA
           SCRAREA.
       000-MAIN                SECTION.
           DISPLAY  SCR-HTTP-METHOD
           EVALUATE    SCR-HTTP-METHOD 
             WHEN     'GET'
               PERFORM 010-GET
             WHEN     'POST'
               PERFORM 020-POST
           END-EVALUATE.
           EXIT    PROGRAM.
      ************************************************************************
       010-GET                SECTION.
           DISPLAY '010-GET start' 
           DISPLAY 'SCR-ARG1:'  SCR-ARG1
           EVALUATE SCR-ARG1
             WHEN '1'
               DISPLAY 'LIMIT 1'
               MOVE 1 TO MCP-LIMIT
             WHEN '2'
               DISPLAY 'LIMIT 49'
               MOVE 49 TO MCP-LIMIT
             WHEN '3'
               DISPLAY 'LIMIT 0(invalid limit)'
               MOVE 0 TO MCP-LIMIT
             WHEN OTHER
               DISPLAY 'LIMIT 100'
               MOVE 100 TO MCP-LIMIT
           END-EVALUATE.

           DISPLAY 'MSGOPEN'
           MOVE 'MSGOPEN' TO MCP-FUNC
           MOVE 'ma' TO MCP-TABLE
           MOVE 1 TO MA-MODE
           CALL 'MONFUNC' USING
                MCPAREA
                DB-MA
           IF (MCP-RC = ZERO)
               DISPLAY '...ok'
           ELSE
               DISPLAY '...ng'
               EXIT
           END-IF

           DISPLAY 'DBSELECT'
           MOVE 'DBSELECT' TO MCP-FUNC.
           MOVE 'tbl_fetch_test' TO MCP-TABLE.
           MOVE 'all' TO MCP-PATHNAME.
           CALL 'MONFUNC' USING
                MCPAREA
                DB-FETCH.
           IF MCP-RC = 0
               DISPLAY '...ok'
           ELSE
               DISPLAY '...ng'
           END-IF

           MOVE 0 TO FETCH-RC.

           PERFORM UNTIL FETCH-RC NOT = 0
             MOVE 'DBFETCH' TO MCP-FUNC
             MOVE 'tbl_fetch_test' TO MCP-TABLE
             MOVE 'all' TO MCP-PATHNAME
             CALL 'MONFUNC' USING
                  MCPAREA
                  DB-FETCH

             MOVE MCP-RC TO FETCH-RC

             IF FETCH-RC = 0 THEN
               MOVE FETCH-ID TO MA-ID
               MOVE FETCH-DATA1 TO MA-DATA1

               DISPLAY 'MSGWRITE'
               MOVE 'MSGWRITE' TO MCP-FUNC
               MOVE 'ma' TO MCP-TABLE
               CALL 'MONFUNC' USING
                    MCPAREA
                    DB-MA
               IF MCP-RC = 0
                   DISPLAY '...ok'
               ELSE
                   DISPLAY '...ng'
               END-IF
             END-IF
           END-PERFORM.

           DISPLAY ' '
           DISPLAY 'MSGCLOSE'
           MOVE 'MSGCLOSE' TO MCP-FUNC
           MOVE 'ma' TO MCP-TABLE
           CALL 'MONFUNC'  USING
                MCPAREA
                DB-MA
           IF MCP-RC = 0
               DISPLAY '...ok'
               MOVE MA-OBJECT TO SCR-BODY
           ELSE
               DISPLAY '...ng'
               EXIT
           END-IF

           EXIT.

      ************************************************************************
       020-POST               SECTION.
           DISPLAY '020-POST start' 
           MOVE 404 TO SCR-HTTP-STATUS.
           MOVE LOW-VALUE TO SCR-BODY.
           EXIT.
