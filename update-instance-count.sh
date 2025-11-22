#!/bin/bash

# 주기적으로 인스턴스 개수를 업데이트하는 스크립트
# systemd 타이머나 cron으로 실행

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
COUNT=$($SCRIPT_DIR/get-instance-count.sh)

# .env 파일 업데이트
if [ -f "$SCRIPT_DIR/.env" ]; then
  # INSTANCE_COUNT가 이미 있으면 업데이트, 없으면 추가
  if grep -q "^INSTANCE_COUNT=" "$SCRIPT_DIR/.env"; then
    # 기존 라인 삭제 후 새로 추가
    grep -v "^INSTANCE_COUNT=" "$SCRIPT_DIR/.env" > "$SCRIPT_DIR/.env.tmp"
    echo "INSTANCE_COUNT=$COUNT" >> "$SCRIPT_DIR/.env.tmp"
    mv "$SCRIPT_DIR/.env.tmp" "$SCRIPT_DIR/.env"
  else
    echo "INSTANCE_COUNT=$COUNT" >> "$SCRIPT_DIR/.env"
  fi
else
  echo "INSTANCE_COUNT=$COUNT" > "$SCRIPT_DIR/.env"
fi

# Node.js 앱 재시작 (systemd 사용 시)
# systemctl restart football-app 2>/dev/null || true
