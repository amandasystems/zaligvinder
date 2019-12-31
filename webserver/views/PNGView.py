import base64

class PNGView:
    def __init__ (self, data):
        self._text =  data
        
    def header (self,sendto):
        sendto.send_header ('Content-type','image/png')
        sendto.end_headers ()

    def response_code (self,sendto):
        sendto.send_response (200)

    def message (self,sendto):
        sendto.write (self._text.read())
