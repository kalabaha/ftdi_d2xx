VERSION 5.00
Begin VB.Form Beispiel_EEProm 
   Caption         =   "USB Test"
   ClientHeight    =   6495
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10965
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6495
   ScaleWidth      =   10965
   StartUpPosition =   3  'Windows-Standard
   Begin VB.CommandButton bt_read6Bytes 
      Caption         =   "6 Bytes lesen"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6000
      TabIndex        =   29
      Top             =   4080
      Width           =   1575
   End
   Begin VB.PictureBox picLinieXy 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'Kein
      Height          =   435
      Index           =   3
      Left            =   960
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   649
      TabIndex        =   28
      Top             =   5880
      Width           =   9735
   End
   Begin VB.TextBox tb_data 
      Height          =   285
      Left            =   9240
      TabIndex        =   22
      Text            =   "85"
      Top             =   3000
      Width           =   615
   End
   Begin VB.TextBox tb_byte_addr 
      Height          =   285
      Left            =   8520
      TabIndex        =   21
      Text            =   "0"
      Top             =   3000
      Width           =   615
   End
   Begin VB.TextBox tb_devsel 
      Height          =   285
      Left            =   7800
      TabIndex        =   20
      Text            =   "160"
      Top             =   3000
      Width           =   615
   End
   Begin VB.CommandButton bt_I2C_Read 
      Caption         =   "5. I2C Byte lesen           "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4320
      TabIndex        =   19
      Top             =   3480
      Width           =   3255
   End
   Begin VB.CommandButton bt_i2C_write 
      Caption         =   "4. I2C Byte schreiben     "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4320
      TabIndex        =   18
      Top             =   2880
      Width           =   3255
   End
   Begin VB.CommandButton bt_I2C_Command1 
      Caption         =   "3. I2C Start + Byte+ Stopp"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   600
      TabIndex        =   17
      Top             =   4080
      Width           =   3135
   End
   Begin VB.CommandButton bt_I2Cstop 
      Caption         =   "2. I2C Start + Stopp         "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   600
      TabIndex        =   16
      Top             =   3480
      Width           =   3135
   End
   Begin VB.PictureBox picLinieXy 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'Kein
      Height          =   435
      Index           =   1
      Left            =   960
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   649
      TabIndex        =   13
      Top             =   4920
      Width           =   9735
   End
   Begin VB.PictureBox picLinieXy 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00E0E0E0&
      BorderStyle     =   0  'Kein
      Height          =   435
      Index           =   2
      Left            =   960
      ScaleHeight     =   29
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   649
      TabIndex        =   12
      Top             =   5400
      Width           =   9735
   End
   Begin VB.CommandButton bt_I2CStart 
      Caption         =   "1. I2C Start                    "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   600
      TabIndex        =   11
      Top             =   2880
      Width           =   3135
   End
   Begin VB.ComboBox lb_bsize 
      ForeColor       =   &H00000000&
      Height          =   315
      Left            =   5880
      TabIndex        =   6
      Text            =   "128"
      Top             =   2040
      Width           =   1095
   End
   Begin VB.ComboBox lb_baudrate 
      ForeColor       =   &H00000000&
      Height          =   315
      Left            =   1560
      TabIndex        =   5
      Text            =   "1200"
      Top             =   2040
      Width           =   975
   End
   Begin VB.TextBox DeviceName 
      Height          =   285
      Left            =   8160
      TabIndex        =   3
      Text            =   "FT232R USB UART"
      Top             =   120
      Width           =   1695
   End
   Begin VB.Frame Frame1 
      Height          =   1455
      Left            =   120
      TabIndex        =   0
      Top             =   480
      Width           =   9735
      Begin VB.ListBox LoggerList 
         Height          =   1035
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   9495
      End
   End
   Begin VB.Line Line5 
      X1              =   8880
      X2              =   8880
      Y1              =   3840
      Y2              =   4200
   End
   Begin VB.Line Line4 
      X1              =   7800
      X2              =   8880
      Y1              =   4200
      Y2              =   4200
   End
   Begin VB.Label Label10 
      Caption         =   "SDA rd"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   120
      TabIndex        =   27
      Top             =   6000
      Width           =   615
   End
   Begin VB.Line Line3 
      X1              =   8160
      X2              =   8160
      Y1              =   3360
      Y2              =   3720
   End
   Begin VB.Line Line2 
      X1              =   8880
      X2              =   8880
      Y1              =   3360
      Y2              =   3720
   End
   Begin VB.Line Line1 
      X1              =   7800
      X2              =   8880
      Y1              =   3720
      Y2              =   3720
   End
   Begin VB.Label Label13 
      Caption         =   "Werte 0-255!"
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   8640
      TabIndex        =   26
      Top             =   2280
      Width           =   1215
   End
   Begin VB.Label Label9 
      Caption         =   "DevSel"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   7800
      TabIndex        =   25
      Top             =   2640
      Width           =   615
   End
   Begin VB.Label Label8 
      Caption         =   "Address"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   8520
      TabIndex        =   24
      Top             =   2640
      Width           =   615
   End
   Begin VB.Label Label7 
      Caption         =   "Data"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   9240
      TabIndex        =   23
      Top             =   2640
      Width           =   735
   End
   Begin VB.Label Label6 
      Caption         =   "SDA wr"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   120
      TabIndex        =   15
      Top             =   5520
      Width           =   735
   End
   Begin VB.Label Label5 
      Caption         =   "SCL"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   120
      TabIndex        =   14
      Top             =   5040
      Width           =   375
   End
   Begin VB.Label lb_bit 
      Caption         =   "Takt jede :"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   600
      TabIndex        =   9
      Top             =   2400
      Width           =   1935
   End
   Begin VB.Label lb_zeit 
      Caption         =   "Anzeigedauer ca.:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   4320
      TabIndex        =   10
      Top             =   2400
      Width           =   2655
   End
   Begin VB.Label Label4 
      Caption         =   "Buffergröße:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   4320
      TabIndex        =   8
      Top             =   2040
      Width           =   975
   End
   Begin VB.Label Label3 
      Caption         =   "Baudrate:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   600
      TabIndex        =   7
      Top             =   2040
      Width           =   735
   End
   Begin VB.Label Label2 
      Caption         =   "Gerät:"
      Height          =   255
      Left            =   7320
      TabIndex        =   4
      Top             =   120
      Width           =   735
   End
   Begin VB.Label Label1 
      Caption         =   "Bsp.: I2C Schnittstelle testen"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   4455
   End
End
Attribute VB_Name = "Beispiel_EEProm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Dim lngNumDevices As Long
Dim strBeschreibung As String * 256

Dim strReadBuffer As String * 4096
Dim strWriteBuffer As String

Dim lngBytesWritten As Long
Dim lngBytesRead As Long
Dim lngTotalBytesRead As Long

Dim FT_RxBytes As Long
Dim FT_TxBytes As Long

Dim lngevent_get_stat As Long
Dim intMask As Byte  ' &0FH alle Signale / Bits als output 0= all inputs
Dim intMode As Byte  ' &H00 reset, &H01 = async Bitbang, &H04 sync Bitbang

Dim flTimedout As Boolean
Dim flFatalError As Boolean

Dim FtStatus As Long
Dim Databyte As Byte
Dim TimerIstAn As Boolean
Dim FT_Trans_Size As Long

' für die grafische Ausgabe im Timing
Private lLinieXyX1() As Long
Private lLinieXyY1() As Long
Private lLinieXyX2() As Long
Private lLinieXyY2() As Long
Private lLinieXyBereichHorizontal As Long

' Definition der Signalleitungen
Const TXD = 0      ' D0
Const RXD = 1      ' D1
Const RTS = 2      ' D2
Const CTS = 3      ' D3
Const DTR = 4      ' D4
Const DSR = 5      ' D5
Const DCD = 6      ' D6
Const RI = 7       ' D7

' Definitionen für I2C
Dim SDA As Integer       ' I2C Datenleitung
Dim SCL As Integer       ' I2C Taktleitung
Dim SDAREAD As Integer   ' I2C SDA lesen (mit Diode)
Dim BMerkmal As Long     ' Merkmal setzen um gelesene Bytes wieder zu finden
'

Private Function BitBangAn() As Boolean
' BitBang Mode FT232R aktivieren
' intMask muss vor Aufruf gesetzt werden!
' Anzeige bereinigen

LoggerList.Clear
BitBangAn = False

' USB Geräte vorhanden?

If FT_GetNumDevices(lngNumDevices, vbNullString, FT_LIST_BY_NUMBER_ONLY) <> FT_OK Then
    LoggerList.AddItem ("Fehler bei Aufruf: FT_GetNumDevices funktionierte nicht")
    Exit Function
End If

strBeschreibung = Trim(Me.DeviceName.Text) & Chr(0)

If FT_OpenEx(strBeschreibung, FT_OPEN_BY_DESCRIPTION, lngHandle) <> FT_OK Then
      LoggerList.AddItem "Gerät lies sich nicht lesen - USB Adapter angeschlossen?"
      Exit Function
End If

' Baudrate setzen

FtStatus = FT_SetBaudRate(lngHandle, Val(lb_baudrate.Text))
If FtStatus <> FT_OK Then
    LoggerList.AddItem "Fehler SetBaudRate"
    GoTo CloseHandle
  Else
    LoggerList.AddItem "BaudRate beträgt " & lb_baudrate.Text
End If

' intMask muss vor Aufruf gesetzt werden
intMode = 4           ' synchrones Bit Bang

' Bit Bang Modus setzen
FtStatus = FT_SetBitMode(lngHandle, intMask, intMode)
If FtStatus <> FT_OK Then
    LoggerList.AddItem "Fehler bei FT_SetBitMode"
    GoTo CloseHandle
  Else
    LoggerList.AddItem "BitBang Mode aktiviert"
End If
CloseHandle:

If FT_Close(lngHandle) <> FT_OK Then
      LoggerList.AddItem "Fehler bei Aufruf: FT_Close"
      Exit Function
   Else
End If

BitBangAn = True

End Function

Private Sub bt_I2C_Command1_Click()
strWriteBuffer = ""
I2CStart
I2CByte (&H55) ' ein beliebiges Byte schreiben
I2CStop
If FTWriteRead(True) = False Then MsgBox "FTWriteRead Error", vbCritical + vbOKOnly, "Error"
LoggerList.AddItem "Beendet  " & Time
End Sub

Private Sub bt_I2C_Read_Click()
On Error GoTo I2C_Read_error

' Ein Byte an der angegebenen EEProm Speicheradresse lesen
' siehe auch Random Adress Read im Datenblatt
' zuerst DESEL und die Speicheradresse schreiben

strWriteBuffer = ""
I2CStart
I2CByte Val(Me.tb_devsel.Text)         ' die I2C Adresse des EEProms
I2CByte Val(Me.tb_byte_addr.Text)      ' Die Speicheradresse im EEProm für die daten
I2CStart
I2CByte (Val(Me.tb_devsel.Text) + 1)   ' Lesen (=LSB in DEVSEL auf 1)
I2CByte (&HFF)                         ' Takte erzeugen
I2CStop
If FTWriteRead(True) = False Then MsgBox "FTWriteRead Error", vbCritical + vbOKOnly, "Error"

LoggerList.AddItem "Beendet  " & Time

I2C_Read_error_end:
    Exit Sub
I2C_Read_error:
    MsgBox Err.Description
    Resume I2C_Read_error_end

End Sub
Private Sub bt_i2C_write_Click()
On Error GoTo i2cwrite_error

'Dim DevSelNumber As Integer
'DevSelNumber = 161 (zum lesen)     = A0 = 1010 001
'DevSelNumber = 160 (zum schreiben) = A0 = 1010 000

strWriteBuffer = ""
I2CStart
I2CByte Val(Me.tb_devsel.Text)     ' die I2C Adresse des EEProms
I2CByte Val(Me.tb_byte_addr.Text)  ' Die Speicheradresse im EEProm für die daten
                                   ' die oberen 3 Adressbits A10-A8 fehlen hier
I2CByte Val(Me.tb_data.Text)       ' die Daten
I2CStop
I2CByte (&HFF)                     ' Takte erzeugen FF erforderlich!!

If FTWriteRead(True) = False Then MsgBox "FTWriteRead Error", vbCritical + vbOKOnly, "Error"

LoggerList.AddItem "Beendet  " & Time

i2cwrite_error_end:
    Exit Sub
i2cwrite_error:
    MsgBox Err.Description
    Resume i2cwrite_error_end
End Sub

Private Sub bt_I2CStart_Click()
strWriteBuffer = ""
I2CStart
If FTWriteRead(True) = False Then MsgBox "FTWriteRead Error", vbCritical + vbOKOnly, "Error"
LoggerList.AddItem "Beendet  " & Time

End Sub

Private Sub bt_I2CStop_Click()
strWriteBuffer = ""
I2CStart
I2CStop
If FTWriteRead(True) = False Then MsgBox "FTWriteRead Error", vbCritical + vbOKOnly, "Error"
LoggerList.AddItem "Beendet  " & Time

End Sub

Private Sub bt_read6Bytes_Click()

' 6 Bytes, jeweils mit Start / Stopp lesen!
' Beipiel zeigt wie Daten aus dem Buffer gelesen werden können

On Error GoTo I2C_Read6_error
'Buffer auf mehr setzen wenn Benutzer was anderes gewählt hat
Me.lb_bsize = 512
Angaben_aktualisieren

strWriteBuffer = ""
I2CStart
I2CByte Val(Me.tb_devsel.Text)             ' die I2C Adresse des EEProms
I2CByte Val(Me.tb_byte_addr.Text)          ' Die Speicheradresse im EEProm für die daten

BMerkmal = Len(strWriteBuffer)             ' Merkmal setzen
Dim Ausgabestring As String

For i% = 0 To 5
    I2CStart                               ' 3 Bytes
    I2CByte (Val(Me.tb_devsel.Text) + 1)   ' Lesen (=LSB in DEVSEL auf 1)
    I2CByte (&HFF)                         ' Takte erzeugen um Daten zu lesen
    I2CStop
Next i

If FTWriteRead(True) = False Then MsgBox "FTWriteRead Error", vbCritical + vbOKOnly, "Error"

' wo sind die einzelnenBytes im Ergebnis zu finden ?:
' in strReadBuffer ab dem BMerkmal immer in gleichen Abständen
' I2CStart = 3 Bytes,  I2CByte  = 27 Bytes
' der erste wert kommt also nach 30 Bytes
BMerkmal = BMerkmal + 3 + 27
Ausgabestring = Val(I2C_ConvertReadbyte(BMerkmal))

' die weiteren werte nach jeweils weiten 61 Byte
' I2CStart = 3 Bytes +  2* I2CByte  = 54 Bytes +  I2CStop = 4 Bytes =61

For i = 1 To 5
  BMerkmal = BMerkmal + 61
  Ausgabestring = Ausgabestring & " - " & Val(I2C_ConvertReadbyte(BMerkmal))
Next i

MsgBox Ausgabestring

LoggerList.AddItem "Beendet  " & Time

I2C_Read6_error_end:
    Exit Sub
I2C_Read6_error:
    MsgBox Err.Description
    Resume I2C_Read6_error_end

End Sub

Private Sub lb_baudrate_Click()
    Angaben_aktualisieren
End Sub

Private Sub lb_bsize_Click()
    Angaben_aktualisieren
End Sub

Private Sub Form_Load()

' Signale zuordnen
SDA = DCD      ' I2C Signalleitung zuordnen (mit Diode in Leitung)
SCL = RXD      ' I2C Takt Signalleitung
SDAREAD = RTS  ' zum lesen


'alt: SDA = DCD
'alt:SCL = RI
'alt:SDAREAD = DSR

' Auswahl für User vervolständigen
lb_bsize.AddItem "128"
lb_bsize.AddItem "256"
lb_bsize.AddItem "512"
lb_bsize.AddItem "1024"

lb_baudrate.AddItem "300"
lb_baudrate.AddItem "600"
lb_baudrate.AddItem "1200"
lb_baudrate.AddItem "2400"
lb_baudrate.AddItem "4800"
lb_baudrate.AddItem "9600"
lb_baudrate.AddItem "19200"
lb_baudrate.AddItem "38400"
lb_baudrate.AddItem "76800"

Angaben_aktualisieren

End Sub

Private Sub Angaben_aktualisieren()
' Anzeige Taktrate und Anzeigeduer für Benutzer aktualisieren

Me.lb_bit.Caption = "Takt jede:" & Str(Format((1 / (Val(Me.lb_baudrate.Text) * 16) * 1000000), "0.0")) & " µs"
Me.lb_zeit.Caption = "Anzeigedauer  ca.: " & Format((1 / (Val(Me.lb_baudrate.Text) * 16) * 1000000 * Val(Me.lb_bsize.Text)), "0") & " µs"

'Grafische Ausgabe initialisieren
ReDim lLinieXyX1(3&) As Long
ReDim lLinieXyY1(3&) As Long
ReDim lLinieXyX2(3&) As Long
ReDim lLinieXyY2(3&) As Long

LinieXyInitialisieren CLng(lb_bsize.Text)

End Sub

' ############  I2C Funktionen #####################

Private Sub I2CStart()
Databyte = 0
Databyte = Databyte Or 2 ^ SCL Or 2 ^ SDA        ' set SDA and SCL
strWriteBuffer = strWriteBuffer & Chr$(Databyte)
Databyte = Databyte And Not (2 ^ SDA)            ' clear SDA
strWriteBuffer = strWriteBuffer & Chr$(Databyte)
Databyte = Databyte And Not (2 ^ SCL)            ' clear SCL
strWriteBuffer = strWriteBuffer & Chr$(Databyte)

End Sub

Private Sub I2CStop()

Databyte = 0
strWriteBuffer = strWriteBuffer & Chr$(Databyte) ' clr SDA und SCL
Databyte = Databyte Or 2 ^ SCL                   ' set SCL
strWriteBuffer = strWriteBuffer & Chr$(Databyte)
strWriteBuffer = strWriteBuffer & Chr$(Databyte)
Databyte = Databyte Or 2 ^ SDA                   ' set SDA
strWriteBuffer = strWriteBuffer & Chr$(Databyte)


End Sub

Private Sub I2CByte(ByVal data As Byte)
' ein Byte in serielle Bits zerlegen
' und gleich in strWriteBuffer schreiben
Dim n As Integer
Dim BitPosition As Byte

BitPosition = 128
' zuerst MSB, zuletzt LSB

For n = 1 To 8
   If data And BitPosition Then
        Databyte = Databyte Or (2 ^ SDA)             ' set SDA to 'H'
      Else
        Databyte = Databyte And Not (2 ^ SDA)        ' clear SDA to 'L'
   End If
   strWriteBuffer = strWriteBuffer & Chr$(Databyte)
   ' und ein clock
   Databyte = Databyte Or (2 ^ SCL)                  ' SCL to 'H'
   strWriteBuffer = strWriteBuffer & Chr$(Databyte)
   Databyte = Databyte And Not (2 ^ SCL)             ' SCL to 'L'
   strWriteBuffer = strWriteBuffer & Chr$(Databyte)
   BitPosition = BitPosition / 2
Next n
   ' und ein neuntes Bit für Acknowledge
   Datadbyte = Databyte Or (2 ^ SDA)                 ' SDA auf high setzen
   strWriteBuffer = strWriteBuffer & Chr$(Databyte)
   Databyte = Databyte Or (2 ^ SCL)                  ' SCK to 'H'
   strWriteBuffer = strWriteBuffer & Chr$(Databyte)
   Databyte = Databyte And Not (2 ^ SCL)             ' SCK to 'L'
   strWriteBuffer = strWriteBuffer & Chr$(Databyte)

End Sub

Private Function I2C_ConvertReadbyte(ByVal AbBytePosition As Long) As Byte

' die seriellen Bits wieder zu einem Byte zusammenfügen
' Daten sind bei der steigenden Flanke von SCL gültig
' zuerst MSB, zuletzt LSB

Dim i As Integer
Dim BitPosition As Byte
Dim Data_in As Byte
Dim rb As String
rb = strReadBuffer

data = 0
BitPosition = 128

' Vorsicht! es muss sdaread ausgewertet werden !

For i = 1 To 25 Step 3  ' ab Byte Position 2
        Data_in = Asc(Mid$(rb, i + AbBytePosition, 1)) ' Byte im String nach Data_in holen
        If Data_in And (2 ^ SDAREAD) Then              ' ist SDA low oder High?
           data = data Or BitPosition
        End If
        BitPosition = BitPosition / 2
Next i

I2C_ConvertReadbyte = data

End Function
Private Function FTWriteRead(ShowTiming As Boolean) As Boolean

' Daten müssen in strWriteBuffer stehen !
' Buffer schreiben, lesen und in Timing SCL und SDA darstellen
' wenn ReadSDA = True dann SDA auf Eingang setzen
' ShowTiming = false dann wird grafische Ausgabe nicht aktualisiert

On Error GoTo FTWriteRead_Fehler

FTWriteRead = False

' Die I2C Leitungen für BitBang als Ausgang setzen
' CTS ist Eingang und liest SDA
' TXD ist WC des EEProms und muss als Ausgang auf low liegen

intMask = &H0 Or 2 ^ SCL Or 2 ^ SDA Or 2 ^ TXD
If BitBangAn = False Then Exit Function

' Gerät öffnen
strBeschreibung = Trim(Me.DeviceName.Text) & Chr(0)

If FT_OpenEx(strBeschreibung, FT_OPEN_BY_DESCRIPTION, lngHandle) <> FT_OK Then
      LoggerList.AddItem "Fehler bei Aufruf: FT_OpenEx"
      Exit Function
End If

' es muss ein Byte mehr geschrieben werden, damit das letzte Byte auch gelesen wird!
' das letzte Byte nochmal anfügen
strWriteBuffer = strWriteBuffer & Mid$(strWriteBuffer, Len(strWriteBuffer), 1)

'Bytes schreiben und Lesen
SendRead_FTDI_Bytes

CloseHandle:
If FT_Close(lngHandle) <> FT_OK Then
      LoggerList.AddItem "Fehler bei Aufruf: FT_Close"
      Exit Function
   Else
End If

If ShowTiming = True Then
    ' Daten für grafische Darstellung anzeigen
    Dim lAnzahl As Integer
    Dim iPos As Integer
    Dim iLinieXyNummer As Integer
    
    LinieXyNeuStart
    iAnzahl = CInt(Len(strWriteBuffer))
    
    'ab position 2 beginnen da ersten Byte noch altes Byte von vorher ist!
    For iPos = 2 To iAnzahl
         LinieXyWertZeichnen 1, CBool(((Asc(Mid$(strReadBuffer, iPos, 1&)) And 2 ^ SCL) / 2 ^ SCL) = 1)
         LinieXyWertZeichnen 2, CBool(((Asc(Mid$(strReadBuffer, iPos, 1&)) And 2 ^ SDA) / 2 ^ SDA) = 1)
         LinieXyWertZeichnen 3, CBool(((Asc(Mid$(strReadBuffer, iPos, 1&)) And 2 ^ SDAREAD) / 2 ^ SDAREAD) = 1)
    Next iPos
End If

FTWriteRead = True

FTWriteRead_Fehler_ende:
Exit Function

FTWriteRead_Fehler:
   MsgBox Err.Description
   FTWriteRead = False
   Resume FTWriteRead_Fehler_ende
End Function

' ############  FTDI Funktionen #####################

Public Function SendRead_FTDI_Bytes() As Boolean

' um einzelne Bytes oder einen String im Bitbang Mode des FTDI 232R zu setzen und zu lesen
' Die Bytes sind in strWriteBuffer, die Anzahl wird übergeben
' Die Bytes sind im synchronen Modus um ein Byte versetzt !

Dim i As Long

If FT_Write(lngHandle, strWriteBuffer, Len(strWriteBuffer), lngBytesWritten) <> FT_OK Then
    LoggerList.AddItem "Write Failed"
    GoTo CloseHandle
'Else
'    LoggerList.AddItem Len(strWriteBuffer) & " Byte geschrieben"
End If

'überprüfen und warten bis Bytes geschrieben
Do
FtStatus = FT_GetStatus(lngHandle, FT_RxBytes, FT_TxBytes, lngevent_get_stat)
        If FtStatus = FT_OK Then
         '
        Else
           If FtStatus = FT_IO_ERROR Then
              LoggerList.AddItem "Get Status IO Error"
              GoTo CloseHandle
           End If
        End If
Loop Until FT_RxBytes = lngBytesWritten
  
flTimedout = False
flFatalError = False
lngTotalBytesRead = 0
strReadBuffer = ""

' Bytes in den Lesebuffer 'strReadBuffer' lesen
Do
    lngBytesRead = 0  ' Anzahl Bytes die zurückgegeben wurden
    FtStatus = FT_Read(lngHandle, strReadBuffer, FT_RxBytes, lngBytesRead)
    
    If (FtStatus = FT_OK) Or (FtStatus = FT_IO_ERROR) Then
        If lngBytesRead > 0 Then
                    lngTotalBytesRead = lngTotalBytesRead + lngBytesRead
        Else
            flTimedout = True
        End If
    Else
        flFatalError = True
    End If
Loop Until (lngTotalBytesRead = FT_RxBytes) Or (flTimedout = True) Or (flFatalError = True)

If (flTimedout = False) And (flFatalError = False) Then
    flFailed = False
ElseIf flTimedout = True Then
    LoggerList.AddItem "FT_Read timeout ftStatus = " & FtStatus
Else
    LoggerList.AddItem "FT_Read error ftStatus = " & FtStatus
End If

SendRead_FTDI_Bytes = True
Exit Function

CloseHandle:
SendRead_FTDI_Bytes = False
intMode = 0

' close the handle

If FT_Close(lngHandle) <> FT_OK Then
    LoggerList.AddItem "Close Failed"
End If


End Function

' ############  grafische Funktionen #####################
' --------------------------------------------------------
' folgende Funktionen sind für de grafische Darstellung
' --------------------------------------------------------
Private Sub LinieXyInitialisieren(ByVal BereichLang As Long)

'Funktion : LinieXyInitialisieren
'Vorauss. : PictureBox (als 1. Aufrufen)
'Parameter: ByVal BereichLang As Long

  lLinieXyBereichHorizontal = BereichLang
  
  Dim l As Integer
  For i = 1& To 3&
      picLinieXy(i).ScaleWidth = lLinieXyBereichHorizontal
  Next i
End Sub
Private Sub LinieXyWertZeichnen(ByVal Index As Integer, ByVal Wert As Boolean)
'-----------------------------------------------------------------------------
' Funktion : LinieXyWertZeichnen
' Vorauss. : PictureBox
' Parameter: Index (1,2,3,4,5,6,7 oder 8)
' Parameter: Wert (Wahr oder Falsch)
' Rückgabe : -
' Autor:  mrk 31.08.2007
' geändert:
'-----------------------------------------------------------------------------
  lLinieXyX1(Index) = lLinieXyX2(Index)
  lLinieXyY1(Index) = lLinieXyY2(Index)
  If Wert Then
     lLinieXyY2(Index) = 4&
    Else
     lLinieXyY2(Index) = 24&
  End If
  picLinieXy(Index).Line (CSng(lLinieXyX1(Index)), CSng(lLinieXyY1(Index)))-(CSng(lLinieXyX2(Index)), CSng(lLinieXyY2(Index)))
  lLinieXyX2(Index) = lLinieXyX2(Index) + 1&
  lLinieXyX1(Index) = lLinieXyX2(Index)
  lLinieXyY1(Index) = lLinieXyY2(Index)
  picLinieXy(Index).Line (CSng(lLinieXyX1(Index) - 1&), CSng(lLinieXyY1(Index)))-(CSng(lLinieXyX2(Index)), CSng(lLinieXyY2(Index)))
End Sub
Private Sub LinieXyNeuStart()
'Funktion : LinieXyNeuStart
'Vorauss. : PictureBox (ist Cls)
'Rückgabe : -

  Dim i As Integer
  For i = 1 To 3
      picLinieXy(i).Cls
      picLinieXy(i).Line (0!, 24!)-(CSng(lLinieXyBereichHorizontal), 24!), vbWhite
      picLinieXy(i).ForeColor = vbBlack
      lLinieXyX1(i) = 0&
      lLinieXyX1(i) = 0&
      lLinieXyY1(i) = 0&
      lLinieXyX2(i) = 0&
 Next i
End Sub
