#!/usr/bin/python3
import subprocess

def get_keychain_pass(account=None, server=None):
    # For now, just hard-coding the lookup since this won't need to work for multiple acocunts
    command = "pass email/box.gindi.io"
    output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    return output.strip().decode("utf-8")
