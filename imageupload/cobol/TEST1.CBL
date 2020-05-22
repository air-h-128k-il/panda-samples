       IDENTIFICATION      DIVISION.
       PROGRAM-ID.         TEST1.
       ENVIRONMENT         DIVISION.
       CONFIGURATION       SECTION.
       DATA                DIVISION.
       WORKING-STORAGE     SECTION.
            COPY    "DB-BLOB".
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
           DISPLAY 'MCP-STATUS:' MCP-STATUS.
           DISPLAY 'MCP-WINDOW:' MCP-WINDOW.
           DISPLAY 'MCP-WIDGET:' MCP-WIDGET.
           DISPLAY 'MCP-EVENT:' MCP-EVENT.
           EVALUATE    MCP-STATUS      ALSO    MCP-EVENT
             WHEN     'LINK'           ALSO    ANY
               PERFORM 010-INIT
             WHEN     'PUTG'           ALSO    ANY
               PERFORM  700-CLICKED
           END-EVALUATE.
           EXIT    PROGRAM.
      **************************************************************************
       010-INIT                SECTION.
           DISPLAY '----INIT'.
           PERFORM 800-SET-PIXMAP.
           MOVE   'NEW'        TO  MCP-PUTTYPE.
           MOVE   'test1'    
                               TO  MCP-WINDOW.
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       700-CLICKED             SECTION.
           DISPLAY '----CLICKED'.
           DISPLAY                 'UPDATA:'.
           DISPLAY                 UPDATA.
           DISPLAY                 'FNAME:'.
           DISPLAY                 FNAME.
           MOVE   UPDATA
                               TO  DB-BLOB-OBJECT.
           MOVE   'BLOBEXPORT' TO  MCP-FUNC.
           MOVE   'blob'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           MOVE   './cobol/uploaded.png'
                               TO  DB-BLOB-FILE.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-BLOB.
           MOVE   LOW-VALUE
                               TO  UPDATA.
           PERFORM 850-SET-PIXMAP2.
           PERFORM 900-PUT-WINDOW.
      **************************************************************************
       900-PUT-WINDOW          SECTION.
           MOVE   'PUTWINDOW'  TO  MCP-FUNC.
           CALL   'MONFUNC'     USING
                MCPAREA.
      **************************************************************************
       800-SET-PIXMAP          SECTION.
           MOVE   'BLOBIMPORT' TO  MCP-FUNC.
           MOVE   'blob'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           MOVE   './cobol/demo.png'
                               TO  DB-BLOB-FILE.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-BLOB.
           DISPLAY 'DB-BLOB-OBJECT:'.
           DISPLAY DB-BLOB-OBJECT.
           MOVE   LOW-VALUE
                               TO  UPDATA.
           MOVE   ALL SPACE
                               TO  FNAME.
           MOVE   DB-BLOB-OBJECT
                               TO  DOWNDATA.
      **************************************************************************
       850-SET-PIXMAP2         SECTION.
           MOVE   'BLOBIMPORT' TO  MCP-FUNC.
           MOVE   'blob'       TO  MCP-TABLE.
           MOVE   'key'        TO  MCP-PATHNAME.
           MOVE   './cobol/uploaded.png'
                               TO  DB-BLOB-FILE.
           CALL   'MONFUNC'     USING
                MCPAREA
                DB-BLOB.
           DISPLAY 'DB-BLOB-OBJECT:'.
           DISPLAY DB-BLOB-OBJECT.
           MOVE   LOW-VALUE
                               TO  UPDATA.
           MOVE   ALL SPACE
                               TO  FNAME.
           MOVE   DB-BLOB-OBJECT
                               TO  DOWNDATA.
