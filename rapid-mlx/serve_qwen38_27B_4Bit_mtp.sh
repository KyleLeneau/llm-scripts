#!/usr/bin/env bash

uv run rapid-mlx serve qwen3.8-27b-4bit \
    --speculative-config '{"method":"mtp"}'

# benchmark with llama-benchy (https://github.com/eugr/llama-benchy)
# 
# uvx llama-benchy \
#     --base-url http://127.0.0.1:8000/v1 \
#     --model qwen3.8-27b-4bit \
#     --depth 0 4096 8192 16384 32768 \
#     --latency-mode generation
