#!/usr/bin/env bash

# 26B Parameters
# 4B Active Mixture of Experts
# Fine tuned for instructions (it)
# 4 Bit quantization
# chat template in bundle
# 

# --chat-template-args '{"enable_thinking":false}'
# --chat-template-args '{"reasoning_effort":"medium"}'

# https://huggingface.co/google/gemma-4-26B-A4B-it-qat-q4_0-gguf

~/Development/_open_source/llama.cpp/build/bin/llama-server \
    -hf google/gemma-4-26B-A4B-it-qat-q4_0-gguf \
    --temp 1.0 \
    --top-p 0.95 \
    --top-k 64 \
    --host 0.0.0.0 \
    --port 8080 \
    --metrics

# benchmark with llama-benchy (https://github.com/eugr/llama-benchy)
# 
# uvx llama-benchy \
#     --base-url http://orin-agx-01:8080/v1 \
#     --model google/gemma-4-26B-A4B-it-qat-q4_0-gguf \
#     --depth 0 4096 8192 16384 32768 \
#     --latency-mode generation


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
