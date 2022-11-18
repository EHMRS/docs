---
title: C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Users/UserManagment.vb

---

# C:/Users/rfranks/Documents/Development/EHMR/SignallingSystem/EHMR Signalling System/Users/UserManagment.vb



## Namespaces

| Name           |
| -------------- |
| **[System::Net::Http](/SignallingSystem-doc/vb/Namespaces/namespaceSystem_1_1Net_1_1Http/)**  |
| **[System](/SignallingSystem-doc/vb/Namespaces/namespaceSystem/)**  |
| **[System::Net::Http::Headers](/SignallingSystem-doc/vb/Namespaces/namespaceSystem_1_1Net_1_1Http_1_1Headers/)**  |
| **[utils](/SignallingSystem-doc/vb/Namespaces/namespaceutils/)**  |
| **[System::Net](/SignallingSystem-doc/vb/Namespaces/namespaceSystem_1_1Net/)**  |
| **[Newtonsoft::Json](/SignallingSystem-doc/vb/Namespaces/namespaceNewtonsoft_1_1Json/)**  |

## Functions

|                | Name           |
| -------------- | -------------- |
| Async [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[Login](/SignallingSystem-doc/vb/Files/UserManagment_8vb/#function-login)**(string Username, string Password) |
| | **[Logout](/SignallingSystem-doc/vb/Files/UserManagment_8vb/#function-logout)**() |
| Async Task< int > | **[auth](/SignallingSystem-doc/vb/Files/UserManagment_8vb/#function-auth)**(string Username, string Password) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[login](/SignallingSystem-doc/vb/Files/UserManagment_8vb/#function-login)**(string operator Name) |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[logoutOperator](/SignallingSystem-doc/vb/Files/UserManagment_8vb/#function-logoutoperator)**() |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[UserManagmentSecoundTick](/SignallingSystem-doc/vb/Files/UserManagment_8vb/#function-usermanagmentsecoundtick)**() |

## Attributes

|                | Name           |
| -------------- | -------------- |
| ﻿using System.Security. | **[Cryptography](/SignallingSystem-doc/vb/Files/UserManagment_8vb/#variable-cryptography)**  |
| string | **[LoggedInUserName](/SignallingSystem-doc/vb/Files/UserManagment_8vb/#variable-loggedinusername)**  |
| int | **[LoggedInAccessLevel](/SignallingSystem-doc/vb/Files/UserManagment_8vb/#variable-loggedinaccesslevel)**  |
| int | **[LoggedInCountDown](/SignallingSystem-doc/vb/Files/UserManagment_8vb/#variable-loggedincountdown)**  |
| int | **[LoginTimeOut](/SignallingSystem-doc/vb/Files/UserManagment_8vb/#variable-logintimeout)**  |
| string | **[operatorName](/SignallingSystem-doc/vb/Files/UserManagment_8vb/#variable-operatorname)**  |


## Functions Documentation

### function Login

```csharp
Async void Login(
    string Username,
    string Password
)
```


### function Logout

```csharp
Logout()
```


### function auth

```csharp
Async Task< int > auth(
    string Username,
    string Password
)
```


### function login

```csharp
void login(
    string operator Name
)
```


### function logoutOperator

```csharp
void logoutOperator()
```


### function UserManagmentSecoundTick

```csharp
void UserManagmentSecoundTick()
```



## Attributes Documentation

### variable Cryptography

```csharp
﻿using System.Security. Cryptography;
```


### variable LoggedInUserName

```csharp
string LoggedInUserName = "";
```


### variable LoggedInAccessLevel

```csharp
int LoggedInAccessLevel = 0;
```


### variable LoggedInCountDown

```csharp
int LoggedInCountDown = 0;
```


### variable LoginTimeOut

```csharp
int LoginTimeOut = 1;
```


### variable operatorName

```csharp
string operatorName = "";
```



## Source code

```csharp
Imports System.Security.Cryptography
Imports System.Text
Imports System.Net.Http
Imports System
Imports System.Net.Http.Headers
Imports utils
Imports System.Net
Imports System.IO
Imports System.Text.Json

Imports Newtonsoft.Json

Module UserManagment
    Public LoggedInUserName As String = ""
    Public LoggedInAccessLevel As Integer = 0
    Public LoggedInCountDown As Integer = 0
    Public LoginTimeOut As Integer = 1
    Public operatorName As String = ""
    'Login
    Private Class AuthentikApiAuthenticationRequest
        Public component = "ak-stage-identification"
        Public uid_field
        Public password
    End Class
    Private Class AuthentikUserGroupRecord
        Public name As String
        Public pk As String
    End Class
    Private Class AuthentikUserRecord
        Public pk As Integer
        Public username As String
        Public name As String
        Public is_active As Boolean
        Public is_superuser As Boolean
        Public groups As List(Of AuthentikUserGroupRecord)
        Public email As String
        Public avatar As String
        Public uid As String
    End Class
    Private Class AuthentikUserApiResponse
        Public user As AuthentikUserRecord
    End Class
    Private Class AuthentikApiResponse
        Public component
        Public response_errors
    End Class

    Public Async Sub Login(Username As String, Password As String)
        Dim x As Integer
        x = Await auth(Username, Password)

        If x > 0 Then
            LoggedInAccessLevel = x
            LoginTimeOut = 1800
            AlarmsAndNotifications.UpdateSystemLog(Username & " Logged in with access level - " & LoggedInAccessLevel)
        Else
            AlarmsAndNotifications.UpdateSystemLog(Username & " Attempted Login")
        End If
    End Sub
    'Logout
    Public Function Logout()
        AlarmsAndNotifications.UpdateSystemLog(LoggedInUserName & " Logged Out")
        LoggedInUserName = ""
        LoggedInAccessLevel = 0
        LoggedInCountDown = 0
        PopUpConfig.Close()
        Return True
    End Function

    Public Async Function auth(Username As String, Password As String) As Task(Of Integer)
        Dim client As HttpClient
        Dim requestMessage As HttpRequestMessage
        Dim responseMessage As HttpResponseMessage
        Dim responseBody As String
        Dim authMessageBody As AuthentikApiAuthenticationRequest
        Dim r As AuthentikApiResponse
        Dim user As AuthentikUserRecord
        Dim authLevel As Integer = 0

        Try
            client = New HttpClient()
            client.BaseAddress = New Uri("https://sso.ehmr.org.uk/api/v3/")
            client.DefaultRequestHeaders.Add("User-Agent", "signallingsystem/0.1")

            authMessageBody = New AuthentikApiAuthenticationRequest()
            authMessageBody.uid_field = Username
            authMessageBody.password = Password

            requestMessage = New HttpRequestMessage(HttpMethod.Post, "flows/executor/default-authentication-flow/")
            requestMessage.Content = New StringContent(JsonConvert.SerializeObject(authMessageBody), Encoding.UTF8, "application/json")

            responseMessage = Await client.SendAsync(requestMessage)
            responseBody = Await responseMessage.Content.ReadAsStringAsync()
            r = JsonConvert.DeserializeObject(Of AuthentikApiResponse)(responseBody)


            If Not r.component = "xak-flow-redirect" Then
                Return -1
            End If
            requestMessage = New HttpRequestMessage(HttpMethod.Get, "core/users/me/")
            responseMessage = Await client.SendAsync(requestMessage)
            responseBody = Await responseMessage.Content.ReadAsStringAsync()
            user = JsonConvert.DeserializeObject(Of AuthentikUserApiResponse)(responseBody).user
            For Each group In user.groups
                If group.name = "Signalling Level 3" Then
                    authLevel = 3
                ElseIf group.name = "Signalling Level 2" Then
                    authLevel = 2
                ElseIf group.name = "Signalling Level 1" Then
                    authLevel = 1
                End If
            Next

            If authLevel = 0 Then
                Return 0
            End If

            LoggedInUserName = user.name
            Return authLevel
        Catch e As Exception
            'MsgBox("Exception: " + e.ToString())
        End Try
    End Function

    Public Sub loginOperator(Name As String)
        If Not operatorName = "" Then Return
        operatorName = Name
        AlarmsAndNotifications.UpdateSystemLog(Name & " now operating the frame")
        ChangeSystemmLogicState("Manual")
    End Sub

    Public Sub logoutOperator()
        AlarmsAndNotifications.UpdateSystemLog(operatorName & " no longer operating the frame")
        operatorName = ""
        ChangeSystemmLogicState("Computer")
    End Sub
    'Timer
    Public Sub UserManagmentSecoundTick()
        If Not LoginTimeOut = 0 Then LoginTimeOut -= 1
        If Mode = LogicModeComputer And LoginTimeOut = 0 And LoggedInAccessLevel > 0 Then Logout()
    End Sub
End Module
```


-------------------------------

Updated on 2022-11-18 at 12:39:06 +0000
