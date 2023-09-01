# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Populating the admin
Hrist.create(email: "weezyaye@gmail.com", password: "We(xxZ&3YaY7eee", password_confirmation: "We(xxZ&3YaY7eee", admin: true)
Hrist.create(email: "weezyal@gmail.com", password: "wE2^Zyy!!AalL", password_confirmation: "wE2^Zyy!!AalL", admin: true)
Rider.create(name: "Albion Krosi", email: "albion@gmail.com", password: "albion123", password_confirmation: "albion123", mobile: "123123123")