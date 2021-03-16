#!/usr/bin/env python3

import time

def main():
    log = open('/var/run/long-living-app-log', mode='a')
    while True:
        log.write("I am alive!\n")
        log.flush()
        time.sleep(5)

if __name__ == "__main__":
    main()
