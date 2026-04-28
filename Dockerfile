# 1. 베이스 이미지 (Node.js 환경)
FROM node:20-slim

# 2. 작업 디렉토리
WORKDIR /app

# 3. 리눅스 패키지 설치 (기본 도구 + git + curl)
# Claude Code 설치를 위해 git과 curl이 추가로 필요합니다.
RUN apt-get update && apt-get install -y \
    iputils-ping \
    git \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# 4. AI 개발 도구 설치
# - Codex: OpenAI
# - Gemini: Google Generative AI CLI
# - Claude Code: Anthropic의 새로운 CLI 도구
RUN npm install -g @openai/codex \
    @google/generative-ai \
    @anthropic-ai/claude-code

# 5. 기본 실행 명령어
CMD ["/bin/bash"]