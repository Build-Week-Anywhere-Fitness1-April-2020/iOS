//
//  mockData.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/29/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation

let jsonData = """
[
    {
        "id": 1,
        "name": "Introduction to Yoga with Adrienne",
        "time": "2020-11-7 9AM",
        "duration": 1.5,
        "intensity": "Beginner",
        "location": "New Jersey",
        "maxSize": 16,
        "classType": "Yoga",
        "imgUrl": "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "equipmentRequired": "Yoga Mat",
        "arrivalDescription": "Please come on time and ready for a great introduction to Yoga.",
        "additionalInfo": null,
        "cost": 23.56,
        "courseDescription": "Intense yoga session",
        "address": "706 Hart Dr. Pompton Lakes, NJ 07442",
        "startDate": "01-01-2020",
        "instructor": "instructor1",
        "days": [
            "Monday",
            "Wednesday",
            "Friday"
        ]
    },
{
        "id": 2,
        "name": "Intermediate Yoga with Adrienne",
        "time": "2020-11-7 9AM",
        "duration": 1.5,
        "intensity": "Intermediate",
        "location": "New Jersey",
        "maxSize": 16,
        "classType": "Yoga",
        "imgUrl": "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "equipmentRequired": "Yoga Mat",
        "arrivalDescription": "We get a little more intense and focused on form during this session.  Make sure you've taken our introductory course first.",
        "additionalInfo": null,
        "cost": 5.00,
        "courseDescription": "Intermediate yoga session",
        "address": "706 Hart Dr. Pompton Lakes, NJ 07442",
        "startDate": "01-01-2020",
        "instructor": "instructor1",
        "days": [
            "Monday",
            "Wednesday",
            "Friday"
        ]
    },
{
        "id": 3,
        "name": "Crossfit",
        "time": "2020-11-7 9AM",
        "duration": 1.5,
        "intensity": "Advanced",
        "location": "New Jersey",
        "maxSize": 16,
        "classType": "Crossfit",
        "imgUrl": "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "equipmentRequired": "Nothing to bring but yourself and a good attitude.",
        "arrivalDescription": "We're in a large open space near the Safeway. Call if you have trouble finding us.",
        "additionalInfo": "None",
        "cost": 45.55,
        "courseDescription": "Intense Crossfit workout",
        "address": "706 Hart Dr. Pompton Lakes, NJ 07442",
        "startDate": "01-01-2020",
        "instructor": "instructor1",
        "days": [
            "Monday",
            "Wednesday",
            "Friday"
        ]
    },
{
        "id": 4,
        "name": "Crossfit",
        "time": "2020-11-7 9AM",
        "duration": 1.5,
        "intensity": "Beginner",
        "location": "New Jersey",
        "maxSize": 16,
        "classType": "Crossfit",
        "imgUrl": "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "equipmentRequired": "Nothing",
        "arrivalDescription": "This is where your life changes.",
        "additionalInfo": "This course is for begnniners.  Crossfit can be intense, but we make it easy to get started.",
        "cost": 50.00,
        "courseDescription": "Introductory Crossfit session",
        "address": "706 Hart Dr. Pompton Lakes, NJ 07442",
        "startDate": "01-01-2020",
        "instructor": "instructor1",
        "days": [
            "Monday",
            "Wednesday",
            "Friday"
        ]
    },
{
        "id": 5,
        "name": "Weightlifting",
        "time": "2020-11-7 9AM",
        "duration": 1.5,
        "intensity": "Intermediate",
        "location": "New Jersey",
        "maxSize": 16,
        "classType": "Weightlifting",
        "imgUrl": "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "equipmentRequired": "Weight lifting belt",
        "arrivalDescription": "None",
        "additionalInfo": "We're going to focusing on deadlifts with the proper form and technique.  It is important to master the movement before moving up to very heavy lifts.",
        "cost": 5.00,
        "courseDescription": "Intermediate session",
        "address": "706 Hart Dr. Pompton Lakes, NJ 07442",
        "startDate": "01-01-2020",
        "instructor": "instructor1",
        "days": [
            "Monday",
            "Wednesday",
            "Friday"
        ]
    },
{
        "id": 6,
        "name": "Weightlifting",
        "time": "2020-11-7 9AM",
        "duration": 1.5,
        "intensity": "Advanced",
        "location": "New Jersey",
        "maxSize": 16,
        "classType": "Weightlifting",
        "imgUrl": "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "equipmentRequired": "None",
        "arrivalDescription": "None",
        "additionalInfo": "This is where we separate the pretenders from the champions.  Be prepared.",
        "cost": 20.36,
        "courseDescription": "Intense weightlifting session",
        "address": "706 Hart Dr. Pompton Lakes, NJ 07442",
        "startDate": "01-01-2020",
        "instructor": "instructor1",
        "days": [
            "Monday",
            "Wednesday",
            "Friday"
        ]
    },
{
        "id": 7,
        "name": "Academy Crossfit",
        "time": "2020-11-7 9AM",
        "duration": 1.5,
        "intensity": "Beginner",
        "location": "New Jersey",
        "maxSize": 16,
        "classType": "Crossfit",
        "imgUrl": "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "equipmentRequired": "None",
        "arrivalDescription": "Make sure to fill out the forms on the website before arrival.",
        "additionalInfo": "This course is for begnniners.  Crossfit can be intense, but we make it easy to get started.",
        "cost": 12.56,
        "courseDescription": "Introductory Crossfit session",
        "address": "706 Hart Dr. Pompton Lakes, NJ 07442",
        "startDate": "01-01-2020",
        "instructor": "instructor1",
        "days": [
            "Monday",
            "Wednesday",
            "Friday"
        ]
    },
{
        "id": 8,
        "name": "Crossfit",
        "time": "2020-11-7 9AM",
        "duration": 1.5,
        "intensity": "Expert",
        "location": "New Jersey",
        "maxSize": 16,
        "classType": "Crossfit",
        "imgUrl": "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        "equipmentRequired": "None",
        "arrivalDescription": "Sign in at the front desk and go through the first door on the right.",
        "additionalInfo": "If you've made it this far, you know what to expect.",
        "cost": 30.99,
        "courseDescription": "Intense crossfit session",
        "address": "706 Hart Dr. Pompton Lakes, NJ 07442",
        "startDate": "01-01-2020",
        "instructor": "instructor1",
        "days": [
            "Monday",
            "Wednesday",
            "Friday"
        ]
    },
{
           "id": 9,
           "name": "Pilates",
           "time": "2020-11-7 9AM",
           "duration": 1.5,
           "intensity": "Intermediate",
           "location": "New Jersey",
           "maxSize": 16,
           "classType": "Pilates",
           "imgUrl": "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
           "equipmentRequired": "None",
           "arrivalDescription": "Make sure not disturb class in session if you arrive early.",
           "additionalInfo": "We have expert instructors and the latest equipment.",
           "cost": 30.99,
           "courseDescription": "Intermediate Pilates session",
           "address": "706 Hart Dr. Pompton Lakes, NJ 07442",
           "startDate": "01-01-2020",
           "instructor": "instructor1",
           "days": [
               "Monday",
               "Wednesday",
               "Friday"
        ]
    },
{
            "id": 10,
            "name": "Pilates",
            "time": "2020-11-7 9AM",
            "duration": 1.5,
            "intensity": "Beginner",
            "location": "New Jersey",
            "maxSize": 16,
            "classType": "Pilates",
            "imgUrl": "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
            "equipmentRequired": "None",
            "arrivalDescription": "Make sure not disturb class in session if you arrive early.",
            "additionalInfo": "Need help getting started with Pilates?  We specialize in Pilates and are experienced with clients at all levels.",
            "cost": 30.99,
            "courseDescription": "Introductory Pilates session",
            "address": "706 Hart Dr. Pompton Lakes, NJ 07442",
            "startDate": "01-01-2020",
            "instructor": "instructor1",
            "days": [
                    "Monday",
                    "Wednesday",
                    "Friday"
            ]
    }
]
""".data(using: .utf8)!
