FROM n8nio/n8n:latest

# Set the port that Render expects
ENV N8N_PORT=10000
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=UTC
ENV N8N_DISABLE_UI=false

# Create workflows directory and copy workflows
USER root
RUN mkdir -p /home/node/.n8n/workflows
COPY workflows/*.json /home/node/.n8n/workflows/
RUN chown -R node:node /home/node/.n8n
USER node

EXPOSE 10000

CMD ["n8n", "start"]
