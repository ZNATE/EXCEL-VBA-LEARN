Option Explicit
Public XYZ As String '这是一个全局变量
'..........................................................................定义出一个全局变量........................................................................
Sub QJBL()
XYZ = 1
MsgBox XYZ
Call XY
End Sub '全局变量测试
'.........................................................................测试一下这个全局变量.......................................................................
Sub XY()
MsgBox XYZ
End Sub '全局变量测试
'.......................................................................又测试一下这个全局变量.......................................................................
Sub 建立新模板_开始()
'全局变量
XYZ = Application.WorksheetFunction.CountA(Sheet1.Rows("1:1"))
    Dim I
    Dim A10
    Dim a
    Dim Z
    Dim num%
    num = XYZ
    For I = 1 To num
    A10 = num - I + 1
        Sheets.Add
        Sheets(1).Name = Sheet1.Cells(1, A10)
        Call 调节学委表格
'加入按钮
        Call 按钮启动
        Call 粘贴按钮
        For a = 2 To 55
        Cells(a + 1, 1).Value = Sheet1.Cells(a, A10).Value
        Next a
        Cells(1, 1).Value = Sheet1.Cells(1, A10).Value
        '* Sheet1=Sheets(i+1)， sheet1随着新工作表的建立被往后挤，序列数随之增大*/
    Next I
    
'激活sheet1
    Sheet1.Activate
    Rows("2:2").Select
    Range(Selection, Selection.End(xlDown)).Select
    Selection.ClearContents
For Z = 1 To XYZ

'数据填写 目录
Cells(Z + 4, 2).Value = "=HYPERLINK(""#""&""" & Cells(1, Z).Value & """&""!A1"",""" & Cells(1, Z).Value & """)"
Next
    Range("B5:B" & XYZ + 4).Select
    With Selection.Font
        .ThemeColor = xlThemeColorLight1
        .TintAndShade = 0
    End With
    Rows("1:1").Select
    Selection.ClearContents
    Call 第一表格
    
End Sub
