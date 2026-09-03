#!/usr/bin/env bash

# --chat-template-args '{"enable_thinking":false}'
# --chat-template-args '{"reasoning_effort":"medium"}'

uv run mlx_lm.server \
    --model mlx-community/Qwen3.8-27B-4bit \
    --use-default-chat-template \
    --prefill-step-size 8192 \
    --trust-remote-code \
    --log-level DEBUG \
    --max-tokens 8192
    

# In opencode set this as the provider:
# 
# vi ~/.config/opencode/opencode.jsonc
# 
# {
#   "$schema": "https://opencode.ai/config.json",
#   "provider": {
#     "mlx_local": {
#       "npm": "@ai-sdk/openai-compatible",
#       "name": "mlx-lm (local)",
#       "options": {
#         "baseURL": "http://localhost:8080/v1"
#       },
#       "models": {
#         "mlx-community/Qwen3.8-27B-4bit": {
#           "name": "Qwen3.8-27B-4bit",
#           "tools": true
#         }
#       }
#     }
#   }
# }

# In pi set this as the provider:
# 
# vi ~/.pi/agent/modes.json
# 
# "mlx-lm" : {
#     "api" : "openai-completions",
#     "apiKey" : "nothing",
#     "baseUrl" : "http:\/\/127.0.0.1:8080\/v1",
#     "compat" : {
#         "maxTokensField" : "max_tokens",
#         "supportsDeveloperRole" : false,
#         "supportsReasoningEffort" : true,
#         "thinkingFormat" : "qwen"
#     },
#     "models" : [
#         {
#             "contextWindow" : 262144,
#             "id" : "mlx-community/Qwen3.8-27B-4bit",
#             "maxTokens" : 200000,
#             "reasoning" : true,
#             "thinkingLevelMap" : {
#                 "minimal" : null,
#                 "xhigh" : "medium"
#             }
#         }
#     ]
# },
