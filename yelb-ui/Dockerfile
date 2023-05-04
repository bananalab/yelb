FROM node:12.22

WORKDIR /
ADD clarity-seed-newfiles clarity-seed-newfiles
ADD build.sh build.sh

RUN /build.sh

FROM nginx:1.17.10

WORKDIR /
ADD startup.sh startup.sh

ENV UI_ENV=prod 

RUN chmod +x startup.sh

COPY --from=0 /clarity-seed/src/prod/dist /clarity-seed/prod/dist
COPY --from=0 /clarity-seed/src/test/dist /clarity-seed/test/dist
COPY --from=0 /clarity-seed/src/dev/dist /clarity-seed/dev/dist

CMD ["./startup.sh"]

