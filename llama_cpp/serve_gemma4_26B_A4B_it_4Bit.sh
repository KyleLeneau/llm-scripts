#!/usr/bin/env bash

# 26B Parameters
# 4B Active Mixture of Experts
# Fine tuned for instructions (it)
# 4 Bit quantization
# chat template in bundle
# 
# Could try `mlx-community/gemma-4-26B-A4B-it-qat-4bit` for quantization aware training (4 bit aware training)
# `mlx-community/gemma-4-26b-a4b-it-4bit` is post training compression to 4bit

# --chat-template-args '{"enable_thinking":false}'
# --chat-template-args '{"reasoning_effort":"medium"}'

uv run mlx_lm.server \
    --model mlx-community/gemma-4-26B-A4B-it-qat-4bit \
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
#         "mlx-community/gemma-4-26b-a4b-it-4bit": {
#           "name": "gemma-4-26b-a4b-it-4bit",
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
#     },
#     "models" : [
#         {
#             "contextWindow" : 262144,
#             "id" : "mlx-community/gemma-4-26b-a4b-it-4bit",
#             "maxTokens" : 200000,
#             "reasoning" : true,
#             "thinkingLevelMap" : {
#                 "minimal" : null,
#                 "xhigh" : "medium"
#             }
#         }
#     ]
# },
