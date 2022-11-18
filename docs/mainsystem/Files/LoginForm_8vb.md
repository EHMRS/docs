---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Users/LoginForm.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Users/LoginForm.vb



## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[LoginForm](/SignallingSystem-doc/mainsystem/Classes/classLoginForm/)**  |




## Source code

```csharp
Public Class LoginForm
    Private Sub OK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK.Click
        Login(UsernameTextBox.Text, PasswordTextBox.Text)
        Me.Close()
    End Sub

    Private Sub Cancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel.Click
        Me.Close()
    End Sub
End Class
```


-------------------------------

Updated on 2022-11-18 at 16:18:56 +0000
