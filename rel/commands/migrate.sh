#!/bin/sh

release_ctl eval --mfa "Isp.Tasks.Release.migrate/1" --argv -- "$@"
