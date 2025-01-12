#!/bin/bash

sudo -i -u postgres psql -d zelbus -a -f queries/procedures.sql
