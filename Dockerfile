FROM node:17.9.0-slim    #Base image
LABEL maintainer="Obify" #Who maintains this docker file
RUN useradd adminapi     #At docker image build time this commands runs and creates a user with name adminapi which will be used as user to run all commads after this line
WORKDIR /app             #Inside docker during runtime the container will have a folder name app that will be used as working directory from now on (app folder will e created)
RUN chown adminapi /app /home     #The owner of the folder app and home will now be changed to adminapi    
COPY . .                          # copy all files from the source location at the level where Docker file is to the folder app which is our working directory
RUN npm install                   # Runs npm install inside app folder to download node modeules during image build time
EXPOSE 9090                       # It acts as documentation to tell that actuall express app will run on 9090 port inside the container hence 9090 needs to be exposed
USER adminapi                     # Specifies that the container should switch to user adminapi and run any cmd commands at docker run time
ENV MONGO_URL=""                  # MONGO_URL is an environment variable which can be passed during docker run command
CMD ["npm","start"]               # the commands that we want the container to run at startup of container
