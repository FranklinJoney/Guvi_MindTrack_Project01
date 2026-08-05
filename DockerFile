# Use official Nginx image
FROM nginx:alpine

# Set working directory
WORKDIR /usr/share/nginx/html

# Remove default nginx static assets
RUN rm -rf ./*

# Copy built files from dist folder into nginx html directory
COPY dist/ .
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 3000 instead of default 80
EXPOSE 3000

# Override default nginx config to listen on port 3000
CMD ["nginx", "-g", "daemon off;"]