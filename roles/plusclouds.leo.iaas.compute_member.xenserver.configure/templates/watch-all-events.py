#!/usr/bin python
import XenAPI
import sys
import time
import subprocess
from pprint import pprint

iso8601 = "%Y%m%dT%H:%M:%SZ"

def main(session):
    try:
        call_timeout = 30.0
        polling_interval = 1
        token = ''
        event_types = ["*"]
        while True:
            try:
                print "Polling for events..."
                output = session.xenapi.event_from(event_types, token, call_timeout)
                events = output["events"]
                token = output["token"]

                print "Number of events retrieved: %s" % len(events)

                now = time.strftime(iso8601, time.gmtime(time.time()))
                fmt = '{"uuid":"%s","time":"%s","id":"%s","ref":"%s","class":"%s","type":"%s","name":"%s","snapshot":%s}'

                if len(events) > 0:
                    hdr = fmt % ("uuid", "time", "id", "ref", "class","type", "name of object", "snapshot")

                for event in events:
                    name = "n/a"
                    snapshot = ""
                    if "snapshot" in event.keys():
                        snapshot = event["snapshot"]
                        if "name_label" in snapshot.keys():
                            name = snapshot["name_label"]
                    msg = str(fmt % (uuid, now, event["id"], event["ref"], event["class"], event["operation"], name, repr(snapshot))).encode('utf-8')
                    # print msg
                    subprocess.call(['wget', '-qO', '/dev/null', '--post-data=' + msg, 'https://event-poller.plusclouds.com'])
                time.sleep(polling_interval)

            except KeyboardInterrupt:
                break

    except XenAPI.Failure, e:
        print e.details
        session.xenapi.session.logout()
        sys.exit(1)
    session.xenapi.session.logout()


def print_usage():
    print """
Usage:
    %s <url> <username> <password>
or
    %s [http://]localhost [<username>] [<password>]
""" % (sys.argv[0], sys.argv[0])


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print_usage()
        sys.exit(1)

    url = sys.argv[1]
    username = sys.argv[2]
    password = sys.argv[3]

    try:
        uuid = open("/home/host-uuid", "r").read()
    except:
        file = open("/home/host-uuid", "w")
        uuid = sudo("xe host-list | head -n 1 | cut -d :  -f 2 | awk '{$1=$1};1'")
        file.write(uuid)
        file.close()

    if len(sys.argv) > 5:
        print uuid, "| Event log script failed."

    if url == "http://localhost" or url == "localhost":
        new_session = XenAPI.xapi_local()
    else:
        new_session = XenAPI.Session(url)
    try:
        new_session.xenapi.login_with_password(username, password, '1.0', 'xen-api-scripts-watch-all-events.py')
    except XenAPI.Failure, f:
        print "Failed to acquire a session: %s" % f.details
        sys.exit(1)
    main(new_session)
