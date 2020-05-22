       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         TEST1.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       DATA                DIVISION.
       WORKING-STORAGE     SECTION.
            COPY    "DB-BLOB".
            COPY    "DB-XML2".
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
           MOVE 404 TO SCR-HTTP-STATUS.
           EXIT.

      ************************************************************************
       020-POST               SECTION.
           DISPLAY '020-POST start' 

           DISPLAY 'xmlopen' 
           MOVE   'XMLOPEN'  TO  MCP-FUNC
           MOVE   0          TO  DB-XML2-MODE
           MOVE   'xml2'     TO  MCP-TABLE
           MOVE   'key'      TO  MCP-PATHNAME
           MOVE   SCR-BODY   TO  DB-XML2-OBJECT
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-XML2
           IF (MCP-RC = ZERO OR 1)
               DISPLAY "...ok"
           ELSE
               DISPLAY "...ng"
               MOVE ZERO TO SCR-BODY
               MOVE 400 TO SCR-HTTP-STATUS
               EXIT
           END-IF

           DISPLAY 'xmlread' 
           MOVE   'XMLREAD'  TO  MCP-FUNC
           MOVE   0          TO  DB-XML2-MODE
           MOVE   'xml2'     TO  MCP-TABLE
           MOVE   'key'      TO  MCP-PATHNAME
           MOVE   SCR-BODY   TO  DB-XML2-OBJECT
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-XML2
           IF (MCP-RC = ZERO OR 1)
               DISPLAY "...ok"
           ELSE
               DISPLAY "...ng"
               MOVE ZERO TO SCR-BODY
               MOVE 400 TO SCR-HTTP-STATUS
               EXIT
           END-IF

           DISPLAY 'xmlwrite' 
           MOVE   'XMLWRITE' TO  MCP-FUNC
           MOVE   'xml2'     TO  MCP-TABLE
           MOVE   'key'      TO  MCP-PATHNAME
           MOVE   1          TO  DB-XML2-MODE
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-XML2
           IF (MCP-RC = ZERO OR 1)
               DISPLAY "...ok"
               MOVE DB-XML2-OBJECT TO SCR-BODY
           ELSE
               DISPLAY "...ng"
               MOVE ZERO TO SCR-BODY
               MOVE 400 TO SCR-HTTP-STATUS
               EXIT
           END-IF

           EXIT.
