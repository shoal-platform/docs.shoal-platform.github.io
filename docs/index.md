# Shoal Quick Start Guide

Welcome to Shoal — the simplest way to deploy your application to the internet. Point Shoal at your GitHub repo, connect a proxy, and hit deploy. Shoal handles containers, scaling, SSL, and routing automatically, so you can focus on building.

This guide walks you through everything you need to get started — from core concepts to deploying apps with databases, schedulers, and multi-service routing.

## Things you need to know

### What is a proxy server? Why do I need one?
A proxy server sits in front of your app and routes incoming traffic to the right place. Think of it as a receptionist — visitors don't go straight to your desk, they check in first. On Shoal, your proxy handles this automatically so your app is reachable from the internet without any extra setup.

It also keeps your app secure and stable. The proxy shields your app from direct exposure to the internet, handles SSL so all traffic is encrypted, and protects against sudden spikes by rate limiting incoming requests — so a surge in traffic won't take your app down.

### What is a container?
A container is a lightweight package that holds your app and everything it needs to run — code, dependencies, settings. It works the same way on any machine, so there are no "works on my computer" surprises. Shoal runs your app inside containers behind the scenes.

### What is a Dockerfile?
A Dockerfile is a simple text file that describes how to build your container. It lists the steps to set up your app — what base image to start from, what files to copy in, and what command to run. Think of it as a recipe: Shoal follows it to package your app into a container that's ready to deploy.

*Coming soon: Shoal will be able to build and deploy your app without needing a Dockerfile at all.*

### What is a scheduler?
A scheduler runs tasks on a timer — like a cron job or a recurring reminder. If you need something to happen every night at midnight or every 5 minutes, a scheduler handles that for you without leaving a server running 24/7.

### Where does Shoal deploy?
Shoal currently deploys into **Google Cloud Platform (GCP)**. Support for Azure, AWS, and other cloud providers is coming soon — and if you want full control, you'll be able to deploy into your own private infrastructure too.

### What's a project, and an environment?
A **project** is a collection of services that belong together — your app, its database, maybe a background worker. An **environment** is a version of that project for a specific purpose: typically `development` (for testing changes) and `production` (the live version your users see). Changes in development don't affect production until you're ready.


