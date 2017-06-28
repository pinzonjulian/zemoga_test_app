# Zemoga Test Profiles App by Julián Pinzón

## 1. About the project
This project covers the following:
1. Creating a Rails App from scratch
2. Creating a User model w/ authentication
3. Creating a Admin model w/ authentication
4. Uploading images for User model
5. Connecting with Twitter's API to pull a user's tweets
6. Building an API with 2 endpoints: 1. Read User info. 2. Update user info

## 2. About the app

### 2.1 Types of users
This app is comprised of two types of users:
1. Users: Regular users with a profile
2. Admins: Administrative users who have access only to the DB administrative interface (Rails admin)

### 2.2 Creating users
1. To create a User: Sign up through the users/sign_up page
2. To create an Admin: Run the app's console and create one. It needs an email and a password

### 2.3 Environment Variables
This app relies on environment variables to configure the connection to the Twitter API and to AWS.
Since this is just a test App, Twitter Config Vars for Development have been stored in secrets.yml without encryption (Due to unknown issue with encrypted secrets )

## 4. Issues
1. Currently there's an Issue in production with image uploading to AWS through Carrierwave. It might be incompatibility with latest version of Ruby (2.4.1) and Rails (5.1.1)
