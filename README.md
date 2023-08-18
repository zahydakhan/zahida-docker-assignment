# zahida-docker-assignment
### Step1. Selected App: Django Blog App
### Step2: Identified Dependencies
```
asgiref==3.3.1
django==3.1.7
pytz==2021.1
sqlparse==0.4.1
```
### Step3: Firstly, I created requirement.txt file and added dependencies in requirement.txt
```
FROM python:3.8-slim-buster     
# base image

WORKDIR /app 
# Change Work Directory

COPY requirements.txt requirements.txt
# Copy requirements.txt

RUN pip3 install -r requirements.txt
# Run the requirements.txt to install dependencies

COPY . . 
# Copy all files to the working directory

CMD ["python3", "manage.py", "runserver"]
# Command to run when the container is started
```
**Command to build image**
```
docker build -t djangoapp .
```

### Step 4: Created Docker Image sucesfully
![image](https://github.com/zahydakhan/zahida-docker-assignment/assets/45081511/a35d0ff4-5f74-4f3d-8064-82348fe0b52d)

<summary>Logs</summary>
<details>
  [+] Building 62.3s (11/11) FINISHED                                                                                           docker:default
 => [internal] load build definition from Dockerfile                                                                                    0.3s
 => => transferring dockerfile: 223B                                                                                                    0.1s
 => [internal] load .dockerignore                                                                                                       0.3s
 => => transferring context: 2B                                                                                                         0.1s
 => [internal] load metadata for docker.io/library/python:3.8-slim-buster                                                               4.9s
 => [auth] library/python:pull token for registry-1.docker.io                                                                           0.0s
 => [1/5] FROM docker.io/library/python:3.8-slim-buster@sha256:8799b0564103a9f36cfb8a8e1c562e11a9a6f2e3bb214e2adc23982b36a04511        31.1s
 => => resolve docker.io/library/python:3.8-slim-buster@sha256:8799b0564103a9f36cfb8a8e1c562e11a9a6f2e3bb214e2adc23982b36a04511         0.5s
 => => sha256:8b91b88d557765cd8c6802668755a3f6dc4337b6ce15a17e4857139e5fc964f3 27.14MB / 27.14MB                                       19.1s
 => => sha256:8799b0564103a9f36cfb8a8e1c562e11a9a6f2e3bb214e2adc23982b36a04511 988B / 988B                                              0.0s
 => => sha256:90834dba6381dfc3957573dc7a3e6c5c8ed255cf60079329a6da2b5e6d4257b8 1.37kB / 1.37kB                                          0.0s
 => => sha256:addd6962740ab9fd79a788945daa24348c11adcec97d47a647e0a61c86cc9f60 6.87kB / 6.87kB                                          0.0s
 => => sha256:824416e234237961c9c5d4f41dfe5b295a3c35a671ee52889bfb08d8e257ec4c 2.78MB / 2.78MB                                          3.1s
 => => sha256:8f777578c172d018077d3dc22d6654911fff60066097943fe8c4697ecf8aac35 12.89MB / 12.89MB                                       15.0s
 => => sha256:cbfea27109a8b1136059a7973ccb8243889faf162ebc173a05909dcb0bec03c9 244B / 244B                                              3.9s 
 => => sha256:276dfcf5deffff3c5d540a8e0d9a18656a4c03637a8b4f4eec1f4a147799c901 3.14MB / 3.14MB                                          8.9s 
 => => extracting sha256:8b91b88d557765cd8c6802668755a3f6dc4337b6ce15a17e4857139e5fc964f3                                               6.3s 
 => => extracting sha256:824416e234237961c9c5d4f41dfe5b295a3c35a671ee52889bfb08d8e257ec4c                                               0.5s
 => => extracting sha256:8f777578c172d018077d3dc22d6654911fff60066097943fe8c4697ecf8aac35                                               2.1s 
 => => extracting sha256:cbfea27109a8b1136059a7973ccb8243889faf162ebc173a05909dcb0bec03c9                                               0.0s 
 => => extracting sha256:276dfcf5deffff3c5d540a8e0d9a18656a4c03637a8b4f4eec1f4a147799c901                                               1.2s 
 => [internal] load build context                                                                                                       0.5s 
 => => transferring context: 8.90kB                                                                                                     0.2s 
 => [2/5] WORKDIR /app                                                                                                                  0.7s 
 => [3/5] COPY requirements.txt requirements.txt                                                                                        0.2s 
 => [4/5] RUN pip3 install -r requirements.txt                                                                                         21.5s 
 => [5/5] COPY . .                                                                                                                      0.2s 
 => exporting to image                                                                                                                  2.9s 
 => => exporting layers                                                                                                                 2.9s 
 => => writing image sha256:bff6399f2c418b0b2d1c002467ddde330e0003ad71f64275c8cdf0a49f5ee048                                            0.0s 
 => => naming to docker.io/library/djangoapp                                                                                            0.0s 

What's Next?
  View summary of image vulnerabilities and recommendations → docker scout quickview
</details>

### Step5: Pushing the image to DockerHub
1. Created a new repo in Docker Hub with name "python-django"

2. Used the below command to signin to DockerHub
   ```
   docker login -u YOUR-USER-NAME
   ```

3. Used the docker tag command to tag image
   ```
   docker tag djangoapp:latest zahydakhan/python-django:latest
   ```
4. Used the docker images command to view tagged image
   ```
   docker images
   ```
5. Now push the image to DockerHub
   ```
   docker push zahydakhan/python-django:latest
   ```
<summary>LOGS</summary>
<details>
The push refers to repository [docker.io/zahydakhan/python-django]
de409a634d75: Pushed
88cb8a17b716: Pushed
98004e3ebc1a: Pushed
6dfc61288941: Pushed
e6c5004ee77f: Mounted from library/python
997b8e79e84f: Mounted from library/python
3054512b6f71: Mounted from library/python
ae2d55769c5e: Mounted from library/python
e2ef8a51359d: Mounted from library/python
latest: digest: sha256:e96316cb82478feecc44191acaf4eea9154964911193397bbf8eb7c44346ac8c size: 2204
</details>

![image](https://github.com/zahydakhan/zahida-docker-assignment/assets/45081511/73391710-93e0-487d-95e9-0c9a9518dd56)








