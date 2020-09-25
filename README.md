# README

Popper is a social media platform that I developed during Spring 2020. I created this program to understand the logic behind other social media platforms such as Instagram and Facebook. I used Ruby on Rails, HTML, and SCSS (a superset of CSS) to develop the software.

Popper brings implements features such as:
- Unique user accounts protected by a username/email and a password
- Ability to share images and blogs
- Ability to like and comment on posts
- Ability to follow other users (the program also ensures that your home page only features posts from users you follow!)

At the time of creation, this program used Ruby version 2.6.3 and Rails 6.0.2.2. 

# Deployment of software:
You must have rails installed. To do so, follow Step 3.1 in the following website: https://guides.rubyonrails.org/v5.0/getting_started.html

In addition to rails, you will need to have access to these gems:
- devise 
- carrierwave
- mini_magick 
- will_paginate

You can download these gems at https://rubygems.org. Note that your computer may require additional steps to install these gems. 

Download this repository on your computer, access ~/Social_Media_Website and enter `rails server`.

On a web browser, go to "http://localhost:3000". You will see the home page of the website. Navigate as you please.
