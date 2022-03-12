#!/bin/bash

kubectl label nodes \
	legvm1.co.slakin.net \
	legvm2.co.slakin.net \
	legvm3.co.slakin.net \
	legvm4.co.slakin.net \
	legvm5.co.slakin.net \
	legvm6.co.slakin.net \
	legvm7.co.slakin.net \
	plan.upgrade.cattle.io/focal=enabled

