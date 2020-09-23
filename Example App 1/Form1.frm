VERSION 5.00
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Run -X-"
   ClientHeight    =   1095
   ClientLeft      =   45
   ClientTop       =   615
   ClientWidth     =   4575
   Icon            =   "Form1.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1095
   ScaleWidth      =   4575
   StartUpPosition =   2  'CenterScreen
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   480
      Left            =   120
      Picture         =   "Form1.frx":0442
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   2
      Top             =   120
      Width           =   480
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      ToolTipText     =   "Type a windows command. IE telnet 127.0.0.1:23"
      Top             =   720
      Width           =   4335
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   10000
      Left            =   1800
      Top             =   1320
   End
   Begin VB.Label Label1 
      Height          =   495
      Left            =   720
      TabIndex        =   1
      Top             =   120
      Width           =   3735
   End
   Begin VB.Menu filemenu 
      Caption         =   "File"
      Begin VB.Menu regmenu 
         Caption         =   "Registration"
      End
      Begin VB.Menu bar1 
         Caption         =   "-"
      End
      Begin VB.Menu exitmenu 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu trexmenu 
      Caption         =   "Extra"
      Begin VB.Menu mnuabout 
         Caption         =   "About"
      End
      Begin VB.Menu bar3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuhelp 
         Caption         =   "Help"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim whatsname As String
Dim whatsserial As String
Dim isreg As String
Dim encrypt As Integer
Dim whatsalllength As String

Private Sub exitmenu_Click()
End
End Sub

Private Sub Form_Load()
On Error GoTo er
'on error goto er. listed below

Dim InputData  As String
Dim Counter
Dim encrypt As Integer
Dim fuckyou As String
'diming some things

fuckyou = "http://www.meth0s.com - Fuck you snooper"
'all strings in this program will not show up in string refrences.
'there for making it evan harder to crack. I cannot crack it ;)
'but they will be able to see fuck you snooper.
'just a lil somthing to torq them off. ;)


Open Chr(105) & Chr(115) & Chr(114) & Chr(101) & Chr(103) & Chr(46) & Chr(107) & Chr(101) & Chr(121) For Input As #1
'opening our file to check if there registerd.

Do While Not EOF(1)
 Line Input #1, InputData
 Counter = Counter + 1
 Select Case Counter
     Case 1
   whatsname = InputData
     Case 2
   whatsserial = InputData
     Case 3
   isreg = InputData
     Case 4
   encrypt = InputData
 End Select
Loop
Close #1
'just read our file
'now checking for authenticity
encrypt = Trim(encrypt)
If isreg = Chr(84) & Chr(114) & Chr(117) & Chr(101) Then
Label1.Caption = Chr(84) & _
 Chr(121) & Chr(112) & Chr(101) & Chr(32) & Chr(116) & Chr(104) & Chr(101) & Chr(32) & Chr(110) & Chr(97) & Chr(109) & Chr(101) & Chr(32) & _
 Chr(111) & Chr(102) & Chr(32) & Chr(97) & Chr(32) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(109) & Chr(44) & Chr(32) & Chr(102) & Chr(111) & Chr(108) & Chr(100) & Chr(101) & Chr(114) & Chr(44) & Chr(32) & Chr(100) & Chr(111) & Chr(99) & Chr(117) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(44) & Chr(32) & Chr(111) & Chr(114) & Chr(32) & Chr(73) & Chr(110) & Chr(116) & Chr(101) & Chr(114) & Chr(110) & Chr(101) & Chr(116) & Chr(32) & Chr(114) & Chr(101) & Chr(115) & Chr(111) & Chr(117) & Chr(114) & Chr(99) & Chr(101) & Chr(44) & Chr(32) & Chr(97) & Chr(110) & Chr(100) & Chr(32) & Chr(87) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(32) & Chr(119) & Chr(105) & Chr(108) & Chr(108) & Chr(32) & Chr(111) & Chr(112) & Chr(101) & Chr(110) & Chr(32) & Chr(105) & Chr(116) & Chr(32) & Chr(102) & Chr(111) & Chr(114) & Chr(32) & Chr(121) & Chr(111) & Chr(117) & Chr(46)

'if its regged then. check to see if its real.

whatsalllength = whatsname + whatsserial + isreg

If encrypt = Len(whatsalllength) * 7 Then
'if its real. hide form2 ect ect
Form2.Timer1.Enabled = False
Form2.Visible = False
Form2.Hide
Timer1.Enabled = False
Form1.Show

Else

'if its not real lets kill it
Kill (App.Path & Chr(92) & Chr(105) & Chr(115) & Chr(114) & Chr(101) & Chr(103) & Chr(46) & Chr(107) & Chr(101) & Chr(121))
'delete the bad file

MsgBox Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121) & Chr(32) & Chr(102) & Chr(97) & Chr(108) & Chr(115) & Chr(101), vbCritical, Chr(66) & Chr(121) & Chr(101) & Chr(33)
'msgbox that it was bad security

Unload Form1
Unload Form2
Unload Form3

End
Exit Sub
End If

Else

Form2.Show
Form2.Timer1.Enabled = True
Timer1.Enabled = True
Label1.Caption = Chr(84) & _
 Chr(121) & Chr(112) & Chr(101) & Chr(32) & Chr(116) & Chr(104) & Chr(101) & Chr(32) & Chr(110) & Chr(97) & Chr(109) & Chr(101) & Chr(32) & _
 Chr(111) & Chr(102) & Chr(32) & Chr(97) & Chr(32) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(109) & Chr(44) & Chr(32) & Chr(102) & Chr(111) & Chr(108) & Chr(100) & Chr(101) & Chr(114) & Chr(44) & Chr(32) & Chr(100) & Chr(111) & Chr(99) & Chr(117) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(44) & Chr(32) & Chr(111) & Chr(114) & Chr(32) & Chr(73) & Chr(110) & Chr(116) & Chr(101) & Chr(114) & Chr(110) & Chr(101) & Chr(116) & Chr(32) & Chr(114) & Chr(101) & Chr(115) & Chr(111) & Chr(117) & Chr(114) & Chr(99) & Chr(101) & Chr(44) & Chr(32) & Chr(97) & Chr(110) & Chr(100) & Chr(32) & Chr(87) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(32) & Chr(119) & Chr(105) & Chr(108) & Chr(108) & Chr(32) & Chr(111) & Chr(112) & Chr(101) & Chr(110) & Chr(32) & Chr(105) & Chr(116) & Chr(32) & Chr(102) & Chr(111) & Chr(114) & Chr(32) & Chr(121) & Chr(111) & Chr(117) & Chr(46)
End If

er:
If Err.Number = 53 Then
Form2.Show
Timer1.Enabled = True
Form2.Timer1.Enabled = True
Label1.Caption = Chr(84) & _
 Chr(121) & Chr(112) & Chr(101) & Chr(32) & Chr(116) & Chr(104) & Chr(101) & Chr(32) & Chr(110) & Chr(97) & Chr(109) & Chr(101) & Chr(32) & _
 Chr(111) & Chr(102) & Chr(32) & Chr(97) & Chr(32) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(109) & Chr(44) & Chr(32) & Chr(102) & Chr(111) & Chr(108) & Chr(100) & Chr(101) & Chr(114) & Chr(44) & Chr(32) & Chr(100) & Chr(111) & Chr(99) & Chr(117) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(44) & Chr(32) & Chr(111) & Chr(114) & Chr(32) & Chr(73) & Chr(110) & Chr(116) & Chr(101) & Chr(114) & Chr(110) & Chr(101) & Chr(116) & Chr(32) & Chr(114) & Chr(101) & Chr(115) & Chr(111) & Chr(117) & Chr(114) & Chr(99) & Chr(101) & Chr(44) & Chr(32) & Chr(97) & Chr(110) & Chr(100) & Chr(32) & Chr(87) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(32) & Chr(119) & Chr(105) & Chr(108) & Chr(108) & Chr(32) & Chr(111) & Chr(112) & Chr(101) & Chr(110) & Chr(32) & Chr(105) & Chr(116) & Chr(32) & Chr(102) & Chr(111) & Chr(114) & Chr(32) & Chr(121) & Chr(111) & Chr(117) & Chr(46)
ElseIf Err.Number = 0 Then

ElseIf Err.Number = 13 Then
MsgBox Chr(83) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121) & Chr(32) & Chr(102) & Chr(97) & Chr(108) & Chr(115) & Chr(101), vbCritical, Chr(66) & Chr(121) & Chr(101) & Chr(33)
'msgbox that it was bad security

'if its not real lets kill it
'Kill (App.Path & Chr(92) & Chr(105) & Chr(115) & Chr(114) & Chr(101) & Chr(103) & Chr(46) & Chr(107) & Chr(101) & Chr(121))
'delete the bad file
End
Else

MsgBox Err.Description, vbCritical, "Error"
Form2.Show
Form2.Timer1.Enabled = True
Timer1.Enabled = True
Label1.Caption = Chr(84) & _
 Chr(121) & Chr(112) & Chr(101) & Chr(32) & Chr(116) & Chr(104) & Chr(101) & Chr(32) & Chr(110) & Chr(97) & Chr(109) & Chr(101) & Chr(32) & _
 Chr(111) & Chr(102) & Chr(32) & Chr(97) & Chr(32) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(109) & Chr(44) & Chr(32) & Chr(102) & Chr(111) & Chr(108) & Chr(100) & Chr(101) & Chr(114) & Chr(44) & Chr(32) & Chr(100) & Chr(111) & Chr(99) & Chr(117) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(44) & Chr(32) & Chr(111) & Chr(114) & Chr(32) & Chr(73) & Chr(110) & Chr(116) & Chr(101) & Chr(114) & Chr(110) & Chr(101) & Chr(116) & Chr(32) & Chr(114) & Chr(101) & Chr(115) & Chr(111) & Chr(117) & Chr(114) & Chr(99) & Chr(101) & Chr(44) & Chr(32) & Chr(97) & Chr(110) & Chr(100) & Chr(32) & Chr(87) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(32) & Chr(119) & Chr(105) & Chr(108) & Chr(108) & Chr(32) & Chr(111) & Chr(112) & Chr(101) & Chr(110) & Chr(32) & Chr(105) & Chr(116) & Chr(32) & Chr(102) & Chr(111) & Chr(114) & Chr(32) & Chr(121) & Chr(111) & Chr(117) & Chr(46)
'End
End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
End
End Sub

Private Sub mnuabout_Click()
MsgBox Chr(80) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(109) & Chr(109) & Chr(101) & Chr(100) & Chr(32) & Chr(98) & Chr(121) & Chr(32) & Chr(109) & Chr(101) & Chr(116) & Chr(104) & Chr(48) & Chr(115) & Chr(32) & Chr(73) & Chr(67) & Chr(81) & Chr(35) & Chr(52) & Chr(49) & Chr(53) & Chr(57) & Chr(52) & Chr(52) & Chr(48), vbSystemModal, Chr(87) & Chr(104) & Chr(97) & Chr(116) & Chr(63)
End Sub

Private Sub regmenu_Click()
Form3.Show
End Sub

Private Sub Text1_KeyPress(KeyAscii As Integer)
On Error GoTo er
If KeyAscii = 13 Then 'checks to see if enter was pressed
runwincommand = WinExec(Text1.Text, True) 'launches the command if any at all.
KeyAscii = 0 'disabling the beeping sound.
Text1.Text = "" 'clearing the text box
End If 'ending the if
er:
If Err.Number = 0 Then
'Resume Next
Else
MsgBox Err.Description, vbCritical, Chr(68) & Chr(117) & Chr(104) & Chr(46)
End If
End Sub

Private Sub Timer1_Timer()
Form2.Hide
Timer1.Enabled = False
End Sub
