VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   3255
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4695
   LinkTopic       =   "Form2"
   ScaleHeight     =   3255
   ScaleWidth      =   4695
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   1800
      Top             =   1440
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "10 seconds remaining"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   2280
      Width           =   4455
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00404040&
      Height          =   3225
      Left            =   10
      Top             =   10
      Width           =   4665
   End
   Begin VB.Shape Shape1 
      Height          =   3255
      Left            =   0
      Top             =   0
      Width           =   4695
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Give me your money and this nag will go away!!!!!!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1755
      Left            =   120
      TabIndex        =   0
      Top             =   480
      Width           =   4575
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim iamnag As Integer
'so we know what iamnag is in this case. its a number

Private Sub Form_Deactivate()
On Error Resume Next
Form2.SetFocus 'make sure they cant avoid nag.
End Sub

Private Sub Form_Initialize()
iamnag = 10 'setting the nag to go away in 10 seconds
End Sub

Private Sub Timer1_Timer()
iamnag = iamnag - 1
'once every second. it will go down a second
Label2.Caption = iamnag & Chr(32) & Chr(115) & Chr(101) & Chr(99) & Chr(111) & Chr(110) & Chr(100) & Chr(115) & Chr(32) & Chr(114) & Chr(101) & Chr(109) & Chr(97) & Chr(105) & Chr(110) & Chr(105) & Chr(110) & Chr(103)
'saying how many seconds are remaining until the nag goes away.
If iamnag = 0 Then
'if there is 0 seconds left. lets....
MsgBox Chr(89) & Chr(111) & Chr(117) & Chr(32) & Chr(109) & Chr(97) & Chr(121) & Chr(32) & Chr(110) & Chr(111) & Chr(119) & Chr(32) & Chr(99) & Chr(111) & Chr(117) & Chr(110) & Chr(116) & Chr(105) & Chr(110) & Chr(117) & Chr(101), vbApplicationModal, Chr(78) & Chr(97) & Chr(103)
MsgBox Chr(66) & Chr(117) & Chr(116) & Chr(32) & Chr(73) & Chr(32) & Chr(115) & Chr(116) & Chr(105) & Chr(108) & Chr(108) & Chr(32) & Chr(119) & Chr(97) & Chr(110) & Chr(116) & Chr(32) & Chr(121) & Chr(111) & Chr(117) & Chr(114) & Chr(32) & Chr(109) & Chr(111) & Chr(110) & Chr(101) & Chr(121) & Chr(33), vbApplicationModal, Chr(109) & Chr(97) & Chr(115) & Chr(104) & Chr(97) & Chr(104) & Chr(97) & Chr(104) & Chr(97) & Chr(104) & Chr(97)
'tell them they can countinue. and we want there money.
Form1.Show
'show form1. the actual program.
Timer1.Enabled = False
'disable the timer.
End If
End Sub
