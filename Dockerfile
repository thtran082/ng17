# Build Stage
FROM node:18.18.2-alpine AS build_stage

WORKDIR /opt/app

COPY --chown=node:node ./package.json ./

COPY --chown=node:node . .

RUN npm set fetch-retry-maxtimeout 300000 && \
    npm install

RUN npm run build

# Run Stage
FROM node:18.18.2-alpine

WORKDIR /opt/app

RUN npm install --global lite-server

COPY --from=build_stage /opt/app/dist/ng17 .d
COPY --from=build /opt/app/node_modules ./node_modules

EXPOSE 8080

CMD ["lite-server", "--baseDir=\"dist/project-name\""]
