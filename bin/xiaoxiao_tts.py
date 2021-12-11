#!/usr/bin/env python2
# -*- coding:utf-8 -*-
"""Edge Microsoft TTS for Python."""
import sys
from ws4py.client.threadedclient import WebSocketClient
import binascii
import argparse
import json
import requests
import re
import errno

trustedClientToken = '6A5AA1D4EAFF4E9FB37E23D68491D6F4'
wsUrl = 'wss://speech.platform.bing.com/consumer/speech/synthesize/readaloud/edge/v1?TrustedClientToken='+trustedClientToken
engineListUrl = 'https://speech.platform.bing.com/consumer/speech/synthesize/readaloud/voices/list?trustedclienttoken='+trustedClientToken

class ListEngineAction(argparse.Action):
    def __init__(self, option_strings, dest, nargs=1, **kwargs):
        super(ListEngineAction, self).__init__(option_strings, dest, **kwargs)
    def __call__(self, parser, namespace, values, option_string=None):
        list = requests.get(engineListUrl).json()
        if values == '__all__':
            for obj in list:
                print('---------------')
                for x in obj:
                    name_splited = [] 
                    name_splited = re.findall('[A-Z][^A-Z]*', x)
                    for x2 in name_splited:
                        sys.stdout.write(x2)
                        if x2 != name_splited[len(name_splited)-1]:
                            sys.stdout.write(' ')
                        sys.stdout.flush()
                    print(': '+obj[x])
            print('---------------')
        else:
            found = False
            for obj in list:
                if obj['Name'] == values:
                    for x in obj:
                        name_splited = [] 
                        name_splited = re.findall('[A-Z][^A-Z]*', x)
                        for x2 in name_splited:
                            sys.stdout.write(x2)
                            if x2 != name_splited[len(name_splited)-1]:
                                sys.stdout.write(' ')
                            sys.stdout.flush()
                        print(': '+obj[x])
                    found = True
                    break
            if found == False:
                print('none found')
        sys.exit()

parser = argparse.ArgumentParser(
    description=__doc__
)
parser.add_argument(
    'text',
    help='Text to speak.',
    default='hello, world',
    nargs='?'
)
parser.add_argument(
    '-e', '--engine',
    help='Speak engine (default: "Microsoft Server Speech Text to Speech Voice (zh-CN, XiaoxiaoNeural)")',
    default='Microsoft Server Speech Text to Speech Voice (zh-CN, XiaoxiaoNeural)'
)
parser.add_argument(
    '-c', '--codec',
    help='Output codec (default: "audio-24khz-48kbitrate-mono-mp3")',
    default='audio-24khz-48kbitrate-mono-mp3'
)
parser.add_argument(
    '-l','--list',
    help='Index an engine then exit. For everything use "__all__"',
    action=ListEngineAction
)

class WSClient(WebSocketClient):
    def __init__(self, url, text, engine, codec):
        self.text = text
        self.engine = engine
        self.format = codec
        super(WSClient, self).__init__(url)
        
    def opened(self):
        self.send('Content-Type:application/json; charset=utf-8\r\n\r\nPath:speech.config\r\n\r\n{"context":{"synthesis":{"audio":{"metadataoptions":{"sentenceBoundaryEnabled":"false","wordBoundaryEnabled":"true"},"outputFormat":"'+self.format+'"}}}}\r\n')
        self.send("X-RequestId:fe83fbefb15c7739fe674d9f3e81d38f\r\nContent-Type:application/ssml+xml\r\nPath:ssml\r\n\r\n<speak version='1.0' xmlns='http://www.w3.org/2001/10/synthesis' xml:lang='en-US'><voice  name='"+self.engine+"'><prosody pitch='+0Hz' rate ='+0%' volume='+0%'>"+self.text+"</prosody></voice></speak>\r\n")

    def received_message(self, m):
        try:
            if 'turn.end' in m.data:
                self.close()
            elif 'Path:audio\r\n' in m.data:
                sys.stdout.write(m.data.split('Path:audio\r\n')[1])
                sys.stdout.flush()
            else:
                pass
        except IOError as nonsense_error:
            if nonsense_error.errno == errno.EIO: # useless I/O errors
                pass
            else: # e.g. broken pipe
                sys.exit()


if __name__ == '__main__':
    arg = parser.parse_args()
    ws = WSClient(wsUrl, arg.text, arg.engine, arg.codec)
    ws.connect()
    ws.run_forever()
