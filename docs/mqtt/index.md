# MQTT

The disparate parts of the signalling system use MQTT to exchange messages and 
work together. MQTT is a well established messaging platform that is in use
across the internet by many companies including the likes of Facebook for their
messenger platform.

## Published Subscriber model

MQTT works on a publisher subscriber model.

When a client first connects it subscribes to one or more topics. Any number
of clients can subscribe to the same topic. Any message that is then sent to
that topic are sent down to the subscribers.

### Wildcards
Topics are hierarchical, allowing clients to subscribe to a topic and any sub
topics using wildcards. There are two wildcards: `#` and `+`.

- `#` can only appear at the end of a topic string, and matches anything.
- `+` only matches one level, and can be anywhere in the topic string

For example, take the following subscribers

- `signalling/points/#`
- `signalling/points/+/request`
- `signalling/+/request`

A message that is sent to `/signalling/points/5a/request` will match the first
two, but not the third.  
A message that is sent to `signalling/points/5a/output` will match the first,
but not the other two.  
A message that is sent to `signalling/platform/request` will match the third,
but not the other two.

### Authorisation
Clients will be limited in what they are able to access, both for read and
write. This not only helps to provide extra security, but also cuts down on
unnecessary messages hitting clients.

### Retained messages
Messages that are sent can be sent with the retain flag. If the retain flag is
set, then the message will be sent to any client that subscribes to the topic,
even if it subscribes after the message has been sent. Only one retained message
is permitted per topic

Messages that are sent from the main logic and from the 485 headend are all sent
with the retain flag set. Messages to and from the audio system and client apps
are not sent with the retain flag.

## Message structure
### Topics
See the [topics](topics.md) page for more information about the topics that are
in use, and the payloads expected by each topic

### Message payloads
MQTT itself does not impose any message structure on messages. For the
Signalling system, however, the following message structure is in use:

```json
{
  "username": "system",
  "source": "mainlogic",
  "payload": {
    "danger": true,
    "caution": false,
    "clear": false,
    "route_1": false,
    "route_2": false,
    "shunt": false
  }
}
```

The username specifies who is responsible for sending the message. Where it is 
a system process, this will always be system. Where it is a client request,
it will be in the form of their email address.

The source is the source application of the request, be it the main logic,
audioplayer, 485headend, client application, etc.

The payload of the message varies depending on the type of message. Above is 
the signal output for a signal. More information about payloads can be found on
the [topics](topics.md) page.