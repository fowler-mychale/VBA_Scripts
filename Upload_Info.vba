Sub Deletion_of_columns()

'Deletes specific columns'
Columns(1).Delete
Columns(1).Delete
Columns(3).Delete
Columns(4).Delete
Columns(4).Delete

'get last row in column B
    Last = Cells(Rows.Count, "B").End(xlUp).Row
    For i = Last To 1 Step -1
        'if cell value is greater than 3500
        If (Cells(i, "B").Value) > 3500 Then
            'delete entire row
            Cells(i, "B").EntireRow.Delete
        End If
    Next i

'Inserts new row above previous row 1
Rows(1).Insert Shift:=xlDown, _
      CopyOrigin:=xlFormatFromLeftOrAbove

'Inserts values into empty header
Range("A1").Value = "ID_Number"
Range("B1").Value = "Number_Value"
Range("C1").Value = "Note"
Range("E2").Formula = "=c2 &"" "" & TEXT(d2,""mm/dd/yyyy"")"

Range("E2").Select
Selection.Copy
Range("E3:E50").PasteSpecial xlPasteFormulas

Dim rng As Range
  Set rng = ActiveSheet.UsedRange
    For i = rng.Cells.Count To 1 Step -1
        If rng.Item(i).Value = " " Then
            rng.Item(i).EntireRow.Delete
        End If
    Next i

On Error Resume Next
Columns("C").SpecialCells(xlCellTypeBlanks).EntireRow.Delete

'Copy Row values within Range
Range("E2:E50").Copy

'PasteSpecial values within Range'
Range("C2:C100").PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks:=False, Transpose:=False

'Deletes excess clolumns
Columns(4).Delete
Columns(5).Delete
Columns(4).Delete

'Saves updates
ThisWorkbook.Save

'Completely closes app window 
Application.Quit

End Sub
