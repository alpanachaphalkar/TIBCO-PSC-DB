#!/bin/sh

pg_ctl -o "-c listen_addresses='localhost'" -w restart