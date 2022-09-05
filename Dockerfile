# FROM <IMAGE_NAME>
FROM node:10

# WORKDIR <이동할 경로>
# cd <DIR_NAME>
WORKDIR /usr/src/app

# COPY <src>... <dest>
# 호스트 컴퓨터에 있는 디렉터리나 파일을 Docker 이미지의 파일 시스템으로 복사
COPY package*.json ./
# ADD는 강력한 버전의 COPY
# ADD <src>... <dest>

# RUN <COMMAND>
RUN npm install

# 이미지를 빌드한 디렉터리의 모든 파일을 컨테이너의 usr/src/app 디렉터리로 복사
# 아까 usr/src/app 디렉터리로 이동했기 때문
COPY . .

# 3000/TCP 포트로 리스닝
# 지정하지 않으면 TCP가 기본값으로 사용
EXPOSE 3000

# ENTRYPOINT ["<커맨드>", "<파라미터1>", "<파라미터2>"]
# 명령문은 이미지를 컨테이너로 띄울 때 항상 실행되야 하는 커맨드를 지정할 때 사용

# 해당 이미지를 컨테이너로 띄울 때 디폴트로 실행할 커맨드
# ENTRYPOINT 명령문으로 지정된 커맨드에 디폴트로 넘길 파라미터를 지정할 때 
ENTRYPOINT [ "npm" ]
CMD ["start"]

# ENV <키>=<값>
# ENV NODE_ENV production

# ARG <이름>
# ARG <이름>=<기본 값>
# ARG port=8080