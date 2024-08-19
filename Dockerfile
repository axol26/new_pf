# build stage
FROM node:lts-alpine AS build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

ARG VITE_LINKEDIN
# ENV VITE_LINKEDIN=$VITE_LINKEDIN
ARG VITE_ASPX
# ENV VITE_ASPX=$VITE_ASPX
ARG VITE_VUE
# ENV VITE_VUE=$VITE_VUE
ARG VITE_REACT
# ENV VITE_REACT=$VITE_REACT
ARG VITE_BACKEND
# ENV VITE_BACKEND=$VITE_BACKEND
ARG VITE_AWS
ARG VITE_GITHUB

# RUN echo $VITE_LINKEDIN; echo $VITE_VUE
RUN npm run build

# production stage
FROM nginx:stable-alpine AS production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]