FROM n8nio/n8n:latest

# Set environment variables
ENV N8N_PORT=10000
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=UTC
ENV N8N_DISABLE_UI=false

# Copy workflows as root user
USER root
RUN mkdir -p /home/node/.n8n/workflows
COPY workflows/*.json /home/node/.n8n/workflows/
RUN chown -R node:node /home/node/.n8n

# Switch back to node user
USER node

EXPOSE 10000

# Use the proper entrypoint
ENTRYPOINT []
CMD ["/usr/local/bin/node", "/usr/local/lib/node_modules/n8n/bin/n8n", "start"]

CMD ["n8n", "start"]
