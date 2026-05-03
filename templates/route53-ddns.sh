#!/bin/bash
set -euo pipefail

CACHE_FILE=/var/cache/route53-ddns/last-ip

CURRENT_IP=$(curl -s checkip.amazonaws.com)
LAST_IP=$(cat "$CACHE_FILE" 2>/dev/null || echo "")

if [ "$CURRENT_IP" = "$LAST_IP" ]; then
  exit 0
fi

ZONE_ID=$(aws route53 list-hosted-zones --query "HostedZones[?Name=='devinl.im.'].Id" --output text | cut -d/ -f3)
aws route53 change-resource-record-sets \
  --hosted-zone-id "$ZONE_ID" \
  --change-batch "{\"Changes\":[{\"Action\":\"UPSERT\",\"ResourceRecordSet\":{\"Name\":\"api.devinl.im\",\"Type\":\"A\",\"TTL\":300,\"ResourceRecords\":[{\"Value\":\"$CURRENT_IP\"}]}}]}"

echo "$CURRENT_IP" > "$CACHE_FILE"
echo "Updated api.devinl.im: ${LAST_IP:-<none>} -> $CURRENT_IP"
