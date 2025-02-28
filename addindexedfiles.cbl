000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. PROGIDNUEVO02.
000300*------------------------------------------------
000400* Añade entradas al vendor file
000500*------------------------------------------------
000600 ENVIRONMENT DIVISION.
000700 INPUT-OUTPUT SECTION.
000800 FILE-CONTROL.
000900
001000     SELECT ARCHIVO-PROVEEDOR
001100         ASSIGN TO "vendor-file"
001200         ORGANIZATION IS INDEXED
001300         RECORD KEY IS NUMERO-PROVEEDOR
001400         ACCESS MODE IS DYNAMIC.
001500
001600 DATA DIVISION.
001700 FILE SECTION.
001800
001900 FD ARCHIVO-PROVEEDOR
002000         LABEL RECORDS ARE STANDARD.
002100 01  REGISTRO-PROVEEDOR.
002200     05 NUMERO-PROVEEDOR PIC 9(5).
002300     05 NOMBRE-PROVEEDOR PIC X(30).
002400     05 DIRECCION-PROVEEDOR-1 PIC X(30).
002500     05 DIRECCION-PROVEEDOR-2 PIC X(30).
002600     05 CIUDAD-PROVEEDOR PIC X(20).
002700     05 ESTADO-PROVEEDOR PIC X(2).
002800     05 CODIGO-POSTAL-PROVEEDOR PIC X(10).
002900     05 CONTACTO-PROVEEDOR PIC X(30).
003000     05 TELEFONO-PROVEEDOR PIC X(15).
003100
003200 WORKING-STORAGE SECTION.
003300
003400 01  CAMPO-NUMERO-PROVEEDOR PIC Z(5).
003500
003600 PROCEDURE DIVISION.
003700 PROGRAMA-INICIO.
003800     OPEN I-O ARCHIVO-PROVEEDOR.
003900     PERFORM OBTENER-NUMERO-PROVEEDOR-NUEVO.
004000     PERFORM ANADIR-REGISTROS
004100         UNTIL NUMERO-PROVEEDOR = ZEROES.
004200     CLOSE ARCHIVO-PROVEEDOR.
004300
004400 PROGRAMA-TERMINADO.
004500     STOP RUN.
004600
004700 OBTENER-NUMERO-PROVEEDOR-NUEVO.
004800     PERFORM INICIALIZAR-REGISTRO-PROVEEDOR.
004900     PERFORM INGRESAR-NUMERO-PROVEEDOR.
005000
005100 INICIALIZAR-REGISTRO-PROVEEDOR.
005200     MOVE SPACE TO REGISTRO-PROVEEDOR.
005300     MOVE ZEROES TO NUMERO-PROVEEDOR.
005400
005500 INGRESAR-NUMERO-PROVEEDOR.
005600     DISPLAY "ENTER VENDOR NUMBER (1-99999)".
005700     DISPLAY "ENTER 0 TO STOP ENTRY".
005800     ACCEPT CAMPO-NUMERO-PROVEEDOR.
005900*OR ACCEPT CAMPO-NUMERO-PROVEEDOR WITH CONVERSION.
006000
006100     MOVE CAMPO-NUMERO-PROVEEDOR TO NUMERO-PROVEEDOR.
006200*OR MOVE WITH CONVERSION CAMPO-NUMERO-PROVEEDOR
006300* TO NUMERO-PROVEEDOR.
006400
006500 ANADIR-REGISTROS.
006600     PERFORM INGRESAR-CAMPOS-RESTANTES.
006700     PERFORM ESCRIBIR-REGISTRO-PROVEEDOR.
006800     PERFORM OBTENER-NUMERO-PROVEEDOR-NUEVO.
006900
007000 ESCRIBIR-REGISTRO-PROVEEDOR.
007100     WRITE REGISTRO-PROVEEDOR
007200     INVALID KEY
007300     DISPLAY "RECORD ALREADY ON FILE".
007400
007500 INGRESAR-CAMPOS-RESTANTES.
007600     PERFORM INGRESAR-NOMBRE-PROVEEDOR.
007700     PERFORM INGRESAR-DIRECCION-PROVEEDOR-1.
007800     PERFORM INGRESAR-DIRECCION-PROVEEDOR-2.
007900     PERFORM INGRESAR-CIUDAD-PROVEEDOR.
008000     PERFORM INGRESAR-ESTADO-PROVEEDOR.
008100     PERFORM INGRESAR-CODIGO-POSTAL-PROVEEDOR.
008200     PERFORM INGRESAR-CONTACTO-PROVEEDOR.
008300     PERFORM INGRESAR-TELEFONO-PROVEEDOR.
008400
008500 INGRESAR-NOMBRE-PROVEEDOR.
008600     DISPLAY "ENTER VENDOR NAME".
008700     ACCEPT NOMBRE-PROVEEDOR.
008800
008900 INGRESAR-DIRECCION-PROVEEDOR-1.
009000     DISPLAY "ENTER VENDOR ADDRESS-1".
009100     ACCEPT DIRECCION-PROVEEDOR-1.
009200
009300 INGRESAR-DIRECCION-PROVEEDOR-2.
009400     DISPLAY "ENTER VENDOR ADDRESS-2".
009500     ACCEPT DIRECCION-PROVEEDOR-2.
009600
009700 INGRESAR-CIUDAD-PROVEEDOR.
009800     DISPLAY "ENTER VENDOR CITY".
009900     ACCEPT CIUDAD-PROVEEDOR.
010000
010100 INGRESAR-ESTADO-PROVEEDOR.
010200     DISPLAY "ENTER VENDOR STATE".
010300     ACCEPT ESTADO-PROVEEDOR.
010400
010500 INGRESAR-CODIGO-POSTAL-PROVEEDOR.
010600     DISPLAY "ENTER VENDOR ZIP".
010700     ACCEPT CODIGO-POSTAL-PROVEEDOR.
010800
010900 INGRESAR-CONTACTO-PROVEEDOR.
011000     DISPLAY "ENTER VENDOR CONTACT".
011100     ACCEPT CONTACTO-PROVEEDOR.
011200
011300 INGRESAR-TELEFONO-PROVEEDOR.
011400     DISPLAY "ENTER VENDOR PHONE".
011500     ACCEPT TELEFONO-PROVEEDOR.
011600
