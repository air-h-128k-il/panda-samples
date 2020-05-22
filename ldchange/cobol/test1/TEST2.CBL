       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         TEST2.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       DATA                DIVISION.
       WORKING-STORAGE     SECTION.
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
           MOVE 'NEW' TO MCP-PUTTYPE.
           DISPLAY 'MCP-STATUS:' MCP-STATUS.
           DISPLAY 'MCP-WINDOW:' MCP-WINDOW.
           DISPLAY 'MCP-WIDGET:' MCP-WIDGET.
           DISPLAY 'MCP-EVENT:' MCP-EVENT.
           EVALUATE MCP-STATUS ALSO MCP-WIDGET
             WHEN 'LINK' ALSO ANY
               PERFORM 100-INIT
             WHEN 'PUTG' ALSO 'button1'
               PERFORM 200-CHANGE-WINDOW
             WHEN 'PUTG' ALSO 'button2'
               PERFORM 300-CHANGE-LD
             WHEN 'PUTG' ALSO ANY
               PERFORM 400-UPDATE-ENTRY
           END-EVALUATE.
           EXIT    PROGRAM.
      **************************************************************************
       100-INIT                SECTION.
           DISPLAY '----INIT'.
           INITIALIZE SCRAREA.
           MOVE 'NEW' TO MCP-PUTTYPE.
           MOVE 'test2' TO MCP-WINDOW.
           MOVE LINKAREA TO ENTRY1 OF TEST2.
           MOVE SPAAREA TO ENTRY2 OF TEST2.
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       200-CHANGE-WINDOW       SECTION.
           DISPLAY '----CHANGE-WINDOW TEST2'.
           MOVE LINKAREA TO ENTRY1 OF TEST1.
           MOVE SPAAREA TO ENTRY2 OF TEST1.
           MOVE 'NEW' TO MCP-PUTTYPE.
           MOVE 'test1' TO MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       300-CHANGE-LD             SECTION.
           DISPLAY '----CHANGE-LD TEST2'.
           MOVE 'NEW' TO MCP-PUTTYPE.
           MOVE 'test3' TO MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       400-UPDATE-ENTRY          SECTION.
           DISPLAY '----UPDATE-ENTRY TEST1'.
           DISPLAY 'TEXT1:' ENTRY1 OF TEST2.
           DISPLAY 'TEXT2:' ENTRY2 OF TEST2.
           MOVE ENTRY1 OF TEST2 TO LINKAREA.
           MOVE ENTRY2 OF TEST2 TO SPAAREA.
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
      **************************************************************************
