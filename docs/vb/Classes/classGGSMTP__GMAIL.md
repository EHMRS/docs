---
title: GGSMTP_GMAIL

---

# GGSMTP_GMAIL





## Public Functions

|                | Name           |
| -------------- | -------------- |
| [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[New](/SignallingSystem-doc/vb/Classes/classGGSMTP__GMAIL/#function-new)**(string GmailAccount, string GmailPassword, string SMTPSERVER ="smtp.gmail.com", Int32 ServerPort =587, bool EnableSSl =True) |
| bool | **[SendMail](/SignallingSystem-doc/vb/Classes/classGGSMTP__GMAIL/#function-sendmail)**(string[] ToAddressies, string Subject, string BodyText, string[] AttachedFiles =Nothing) |

## Protected Functions

|                | Name           |
| -------------- | -------------- |
| override [void](/SignallingSystem-doc/vb/Files/SerialPixelLeds_8vb/#variable-void) | **[Finalize](/SignallingSystem-doc/vb/Classes/classGGSMTP__GMAIL/#function-finalize)**() |

## Public Properties

|                | Name           |
| -------------- | -------------- |
| string | **[ErrorText](/SignallingSystem-doc/vb/Classes/classGGSMTP__GMAIL/#property-errortext)**  |
| bool | **[EnableSSL](/SignallingSystem-doc/vb/Classes/classGGSMTP__GMAIL/#property-enablessl)**  |
| string | **[GmailAccount](/SignallingSystem-doc/vb/Classes/classGGSMTP__GMAIL/#property-gmailaccount)**  |
| string | **[GmailPassword](/SignallingSystem-doc/vb/Classes/classGGSMTP__GMAIL/#property-gmailpassword)**  |
| string | **[SMTPSERVER](/SignallingSystem-doc/vb/Classes/classGGSMTP__GMAIL/#property-smtpserver)**  |
| Int32 | **[ServerPort](/SignallingSystem-doc/vb/Classes/classGGSMTP__GMAIL/#property-serverport)**  |

## Public Functions Documentation

### function New

```csharp
void New(
    string GmailAccount,
    string GmailPassword,
    string SMTPSERVER ="smtp.gmail.com",
    Int32 ServerPort =587,
    bool EnableSSl =True
)
```


### function SendMail

```csharp
bool SendMail(
    string[] ToAddressies,
    string Subject,
    string BodyText,
    string[] AttachedFiles =Nothing
)
```


## Protected Functions Documentation

### function Finalize

```csharp
override void Finalize()
```


## Public Property Documentation

### property ErrorText

```csharp
string ErrorText;
```


### property EnableSSL

```csharp
bool EnableSSL;
```


### property GmailAccount

```csharp
string GmailAccount;
```


### property GmailPassword

```csharp
string GmailPassword;
```


### property SMTPSERVER

```csharp
string SMTPSERVER;
```


### property ServerPort

```csharp
Int32 ServerPort;
```


-------------------------------

Updated on 2022-11-15 at 15:52:04 +0000