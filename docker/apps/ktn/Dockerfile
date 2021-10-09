FROM node:latest

WORKDIR /kill-the-newsletter

COPY package*.json ./
RUN npm ci --production
COPY . .

VOLUME /kill-the-newsletter/static/feeds/
VOLUME /kill-the-newsletter/static/alternate/

ENV WEB_PORT=8000
ENV EMAIL_PORT=2525
ENV BASE_URL=https://$KTN_SUBDOMAIN.$DOMAINNAME1
ENV EMAIL_DOMAIN=$DOMAINNAME1
ENV ISSUE_REPORT=mailto:$YOUR_MAILTO_EMAIL

EXPOSE 8000
EXPOSE 2525

CMD npx ts-node .
