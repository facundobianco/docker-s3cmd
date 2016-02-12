# Docker container for s3cmd

This is a lightweight docker image for [s3cmd](http://s3tools.org/s3cmd) (77.18 MB).

## How to use it

Get the image

```
docker pull vando/s3cmd
```

And then connet to it

```
docker run -e AWS_ACCESS_KEY_ID=<your access key> -e AWS_SECRET_ACCESS_KEY=<your secret key> \
           -v /path/to/backupdir:/mnt/hdd \
           --name=s3cmd -d -it vando/s3cmd sh
```

## Store your AWS credentials in a file

(I based this tip in the article [GPG + s3cmd](https://brandur.org/fragments/gpg-s3cmd) from @brandur.)

You should store your AWS credentials in encrypt file with GPG (press Ctrl+D to exit)

```
gpg -ear <your email> -o aws-credentials.asc
```

The file should have those lines

```
AWS_ACCESS_KEY_ID=<your access key>
AWS_SECRET_ACCESS_KEY=<your secret key>
```

Before to use docker s3cmd image, run

```
eval `gpg -d aws-credentials.asc`
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
```

and then start the container with

```
docker run -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY \
           -v /path/to/backupdir:/mnt/hdd \
           --name=s3cmd -d -it vando/s3cmd sh
```
