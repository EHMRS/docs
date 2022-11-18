---
title: C:/Users/rfranks/Documents/Development/EHMR/signalling-audio/mqtt.py

---

# C:/Users/rfranks/Documents/Development/EHMR/signalling-audio/mqtt.py



## Namespaces

| Name           |
| -------------- |
| **[mqtt](/SignallingSystem-doc/audiosystem/Namespaces/namespacemqtt/)** <br>MQTT Client functions.  |

## Classes

|                | Name           |
| -------------- | -------------- |
| class | **[mqtt::MqttConnector](/SignallingSystem-doc/audiosystem/Classes/classmqtt_1_1MqttConnector/)** <br>Mqtt Connector class.  |




## Source code

```python
"""! @brief MQTT Client functions"""

import os
import json
import ssl
import logging

from paho.mqtt import client as mqtt_client
from message_handlers import handle_message


class MqttConnector:
    """! Mqtt Connector class """
    broker = os.getenv("MQTT_BROKER")
    port = os.getenv("MQTT_PORT")
    client_id = 'audioplayer'
    username = os.getenv("MQTT_USERNAME")
    password = os.getenv("MQTT_PASSWORD")

    client = None
    connected = False

    def init(self):
        """! Initialise the module """
        logging.info("Connecting to MQTT")
        self.connect_mqttconnect_mqtt()
        self.clientclient.loop_start()
        while not self.connectedconnectedconnected:
            pass
        logging.info("Connected")
        self.clientclient.subscribe("signalling/audio/play")

    def connect_mqtt(self):
        """! Connect to the MQTT server """
        # Set Connecting Client ID
        self.clientclient = mqtt_client.Client(self.client_idclient_id)
        # Set the connection parameters
        self.clientclient.username_pw_set(self.usernameusername, self.passwordpassword)
        self.clientclient.tls_set(cert_reqs=ssl.CERT_NONE)
        self.clientclient.tls_insecure_set(True)

        # Set the callbacks
        self.clientclient.on_connect = self.on_connecton_connect
        self.clientclient.on_message = self.on_messageon_message

        # Actually connect
        self.clientclient.connect(self.brokerbroker, int(self.portport))

    def on_connect(self, client, userdata, flags, response_code):       # pylint:disable=unused-argument
        """! Callback on client connect """
        if response_code == 0:
            logging.debug("Connected to MQTT broker!")
            self.connectedconnectedconnected = True
        else:
            logging.debug("Failed to connect, return code %s", response_code)

    def on_message(self, client, userdata, message):                    # pylint:disable=unused-argument
        """! Callback on message received """
        outermessage = json.loads(message.payload.decode("utf-8"))
        try:
            payload = outermessage['payload']
        except KeyError:
            # Invalid message
            logging.debug("Invalid message: %s", message.payload)
            return

        handle_message(message.topic[17:], payload)


    def send_message(self, topic, payload):
        """! Helper function to send a message """
        self.clientclient.publish(topic, self.prep_payloadprep_payload(payload))

    def prep_payload(self, data):
        """! Helper function to prepare the wrapper for the message"""
        payload = {
            "username": "system",
            "source": "audioplayer",
            "payload": data
        }
        return json.dumps(payload)

mqtt = MqttConnector()
```


-------------------------------

Updated on 2022-11-18 at 16:18:58 +0000
