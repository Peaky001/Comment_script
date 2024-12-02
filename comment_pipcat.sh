#!/bin/bash


FILE="/home/shrey01/agentyuga/HRBot/app/services/interview_service.py"


if [[ ! -f $FILE ]]; then
  echo "Error: File '$FILE' not found!"
  exit 1
fi

sed -i \
    -e 's|^from app.utils.pipecat.config import Config|#&|' \
    -e 's|^from app.utils.pipecat.run import main as run_bot|#&|' \
    -e 's|^from app.utils.pipecat.transport import PipecatTransport|#&|' \
    -e '/async def _run_phone_interview_bot/,/def _build_bot_command/{ 
  /def _build_bot_command/! s/^/#/ 
}' "$FILE"

echo "Specific lines in '$FILE' have been commented out."
