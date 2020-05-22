       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         TEST1.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       DATA                DIVISION.
       WORKING-STORAGE     SECTION.
            COPY    "DBTEST".
       LINKAGE             SECTION.
            COPY    "MCPAREA".
            COPY    "SPAAREA".
            COPY    "LINKAREA".
            COPY    "SCRAREA".
      **************************************************************************
       PROCEDURE           DIVISION    USING
           MCPAREA
           SPAAREA
           LINKAREA
           SCRAREA.
       000-MAIN                SECTION.
           INITIALIZE DBTEST.
           MOVE   'NEW'        TO  MCP-PUTTYPE.
           DISPLAY 'MCP-STATUS:' MCP-STATUS.
           DISPLAY 'MCP-WINDOW:' MCP-WINDOW.
           DISPLAY 'MCP-WIDGET:' MCP-WIDGET.
           DISPLAY 'MCP-EVENT:' MCP-EVENT.
           EVALUATE MCP-STATUS ALSO MCP-WIDGET
             WHEN 'LINK' ALSO ANY
               PERFORM 010-INIT
             WHEN 'PUTG' ALSO 'button1'
               PERFORM  100-SELECT
             WHEN 'PUTG' ALSO 'button2'
               PERFORM  200-INSERT
             WHEN 'PUTG' ALSO 'button3'
               PERFORM  300-UPDATE
             WHEN 'PUTG' ALSO 'button4'
               PERFORM  400-DELETE
           END-EVALUATE.
           EXIT    PROGRAM.
      **************************************************************************
       010-INIT                SECTION.
           DISPLAY '----INIT'.
           INITIALIZE SCRAREA.
           MOVE   'NEW'        TO  MCP-PUTTYPE.
           MOVE   'test1'    
                               TO  MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       100-SELECT             SECTION.
           DISPLAY '----SELECT'.
           DISPLAY 'TEXT1:' PANDAENTRY1.
           DISPLAY 'TEXT2:' PANDAENTRY2.
           MOVE PANDAENTRY1 TO DBTEST-UUID.
           MOVE 'DBSELECT' TO MCP-FUNC.
           MOVE 'dbtest' TO MCP-TABLE.
           MOVE 'key' TO MCP-PATHNAME.
           CALL   'MONFUNC'     USING
                MCPAREA
                DBTEST.
           MOVE 'DBFETCH' TO MCP-FUNC.
           MOVE 'dbtest' TO MCP-TABLE.
           MOVE 'key' TO MCP-PATHNAME.
           CALL   'MONFUNC'     USING
                MCPAREA
                DBTEST.
           DISPLAY 'DBTEST-UUID:' DBTEST-UUID.
           DISPLAY 'DBTEST-FNAME:' DBTEST-FNAME.
           MOVE DBTEST-FNAME TO PANDAENTRY2.
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       200-INSERT             SECTION.
           DISPLAY '----INSERT'.
           DISPLAY 'TEXT1:' PANDAENTRY1.
           DISPLAY 'TEXT2:' PANDAENTRY2.
           MOVE PANDAENTRY1 TO DBTEST-UUID.
           MOVE PANDAENTRY2 TO DBTEST-FNAME.
           MOVE 'DBINSERT' TO MCP-FUNC.
           MOVE 'dbtest' TO MCP-TABLE.
           MOVE 'key' TO MCP-PATHNAME.
           CALL   'MONFUNC'     USING
                MCPAREA
                DBTEST.
           DISPLAY 'DBTEST-UUID:' DBTEST-UUID.
           DISPLAY 'DBTEST-FNAME:' DBTEST-FNAME.
           MOVE ' ' TO PANDAENTRY2.
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       300-UPDATE             SECTION.
           DISPLAY '----UPDATE'.
           DISPLAY 'TEXT1:' PANDAENTRY1.
           DISPLAY 'TEXT2:' PANDAENTRY2.
           MOVE PANDAENTRY1 TO DBTEST-UUID.
           MOVE PANDAENTRY2 TO DBTEST-FNAME.
           MOVE 'DBUPDATE' TO MCP-FUNC.
           MOVE 'dbtest' TO MCP-TABLE.
           MOVE 'key' TO MCP-PATHNAME.
           CALL   'MONFUNC'     USING
                MCPAREA
                DBTEST.
           DISPLAY 'DBTEST-UUID:' DBTEST-UUID.
           DISPLAY 'DBTEST-FNAME:' DBTEST-FNAME.
           MOVE ' ' TO PANDAENTRY2.
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       400-DELETE             SECTION.
           DISPLAY '----DELETE'.
           DISPLAY 'TEXT1:' PANDAENTRY1.
           MOVE PANDAENTRY1 TO DBTEST-UUID.
           MOVE 'DBDELETE' TO MCP-FUNC.
           MOVE 'dbtest' TO MCP-TABLE.
           MOVE 'key' TO MCP-PATHNAME.
           CALL   'MONFUNC'     USING
                MCPAREA
                DBTEST.
           DISPLAY 'DBTEST-UUID:' DBTEST-UUID.
           DISPLAY 'DBTEST-FNAME:' DBTEST-FNAME.
           MOVE ' ' TO PANDAENTRY2.
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
      **************************************************************************
