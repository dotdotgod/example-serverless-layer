#!/bin/bash

# LayerName을 매개변수로 받기.
LAYER_NAME="$1"

# Layer ARN 가져오기.
LAYER_ARN=$(aws lambda list-layer-versions --layer-name "${LAYER_NAME}" --query 'LayerVersions[0].LayerVersionArn' --output text)

# Layer ARN을 SSM 파라미터로 등록.
aws ssm put-parameter --name "${LAYER_NAME}" --value "${LAYER_ARN}" --type "SecureString" --overwrite

echo "SSM 파라미터 등록이 완료되었습니다."