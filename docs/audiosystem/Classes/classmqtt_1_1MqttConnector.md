---
title: mqtt::MqttConnector
summary: Mqtt Connector class. 

---

# mqtt::MqttConnector



Mqtt Connector class. 

## Public Functions

|                | Name           |
| -------------- | -------------- |
| def | **[init](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/#function-init)**(self self)<br>Initialise the module.  |
| def | **[connect_mqtt](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/#function-connect-mqtt)**(self self)<br>Connect to the MQTT server.  |
| def | **[on_connect](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/#function-on-connect)**(self self, [client](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/#variable-client) client, userdata userdata, flags flags, response_code response_code)<br>Callback on client connect.  |
| def | **[on_message](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/#function-on-message)**(self self, [client](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/#variable-client) client, userdata userdata, message message)<br>Callback on message received.  |
| def | **[send_message](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/#function-send-message)**(self self, topic topic, payload payload)<br>Helper function to send a message.  |
| def | **[prep_payload](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/#function-prep-payload)**(self self, data data)<br>Helper function to prepare the wrapper for the message.  |

## Public Attributes

|                | Name           |
| -------------- | -------------- |
| | **[broker](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/#variable-broker)**  |
| | **[port](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/#variable-port)**  |
| string | **[client_id](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/#variable-client-id)**  |
| | **[username](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/#variable-username)**  |
| | **[password](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/#variable-password)**  |
| | **[client](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/#variable-client)**  |
| bool | **[connected](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/#variable-connected)**  |
| | **[connected](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/#variable-connected)**  |

## Public Functions Documentation

### function init

```python
def init(
    self self
)
```

Initialise the module. 

### function connect_mqtt

```python
def connect_mqtt(
    self self
)
```

Connect to the MQTT server. 

### function on_connect

```python
def on_connect(
    self self,
    client client,
    userdata userdata,
    flags flags,
    response_code response_code
)
```

Callback on client connect. 

### function on_message

```python
def on_message(
    self self,
    client client,
    userdata userdata,
    message message
)
```

Callback on message received. 

### function send_message

```python
def send_message(
    self self,
    topic topic,
    payload payload
)
```

Helper function to send a message. 

### function prep_payload

```python
def prep_payload(
    self self,
    data data
)
```

Helper function to prepare the wrapper for the message. 

## Public Attributes Documentation

### variable broker

```python
static broker =  os.getenv("MQTT_BROKER");
```


### variable port

```python
static port =  os.getenv("MQTT_PORT");
```


### variable client_id

```python
static string client_id =  'audioplayer';
```


### variable username

```python
static username =  os.getenv("MQTT_USERNAME");
```


### variable password

```python
static password =  os.getenv("MQTT_PASSWORD");
```


### variable client

```python
static client =  None;
```


### variable connected

```python
static bool connected =  False;
```


### variable connected

```python
connected;
```


-------------------------------

Updated on 2022-11-18 at 16:18:58 +0000