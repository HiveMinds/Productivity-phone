## What is this?
[![Build Status](https://raw.githubusercontent.com/a-t-0/gitlab-ci-build-statuses/master/hiveminds/Productivity-phone/main/build_status.svg)](http://2gzyxa5ihm7nsggfxnu52rck2vv4rvmdlkiu3zzui5du4xyclen53wid.onion/)


Software that automatically installs and configures an opensource system on your phone that enables you to optimize your productivity. It empowers the user to actively select which information the user wants to consume by fencing off undesired digital tempations. It is opinionated in the sense that it blocks all social media, youtube, image searches, news sites and adult content. Not because I think they are bad, instead it is because I am highly passionate about the opportunities that I am given and I want to give those opportunities and pursuits my complete dedication. I hope this software can support fellow beings in reaching their goals.

## Future
Additionally I like to use my phone to verbally talk to the self-hosted taskwarrior in the medium-long term using natural language, and get spoken/visual reminders of my automatically scheduled tasks. In the long term, I think the phone can tie into the Hiveminds eco system that brings users together in mutual segments of their journey.

## Status: Bleeding Edge
The basic functionality of automatically installing another operating system (both LineageOS and Fairphone Open OS are supported) on the Fairphone 2 is provided. However, the code has not yet been cleaned, is poorly/chaotically/inconsistently structured, and it lacks the most basic sense of generality (for example, it does not yet allow device ids of lengths other than 8 characters for `adb`, and 17 for `fastboot`).

## How to use
As mentioned in the status, I would recommended to work on [the issues in the Alpha release](https://github.com/a-t-0/Productivity-phone/milestone/1) before using it, however if you are enthousiastic  to give it a try, at the risk of bricking your FP2:
0. Download this repository
1. Browse into this repository in your terminal and run the main code:
```
cd Productivity-phone
chmod +x main.sh
./main.sh
```

## Testing
Currently testing is not yet meaningfull. If you would like writing tests, you can contribute to improving the tests as described in [the issues for the Enhanced release milestone](https://github.com/a-t-0/Productivity-phone/milestone/2). After considering the warning in status, one can run the tests with the following steps:
0. Download this repository
1. Browse into this repository in your terminal and run the main code:
```
cd Productivity-phone
chmod +x test.sh
./test.sh
```
