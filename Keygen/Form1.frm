VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Keygen Maker 1.0"
   ClientHeight    =   510
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   510
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text3 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   0
      TabIndex        =   3
      Text            =   "Security key"
      Top             =   240
      Width           =   1215
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1200
      TabIndex        =   2
      Top             =   240
      Width           =   3495
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   1200
      TabIndex        =   1
      Text            =   "UserName"
      Top             =   0
      Width           =   3495
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Make User"
      Height          =   255
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
On Error Resume Next
Dim charsinfile As Integer
Dim m_username As String
Dim letter As String
Dim intheend As String
Dim justconverted As String
Dim i As Integer
Dim m_security As Integer
m_username = Text1.Text
m_securitykey = Text3.Text
If m_username = "" Then Exit Sub
        charsinfile = Len(m_username) 'find string length
        For i = 1 To charsinfile  'for each character in file
            letter = Mid(m_username, i, 1) 'read next char
            justconverted = Asc(letter) Xor m_securitykey 'and save in file
            intheend = intheend & justconverted
            DoEvents
        Next i
        Text2.Text = intheend
End Sub
