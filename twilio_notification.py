# Download the helper library from https://www.twilio.com/docs/python/install
from twilio.rest import Client

account_sid = 'AC76d9b17b2c23170b7019924f709f366b'
auth_token = '8fba7a54c6e3dc3754043b3865fa9d82'
client = Client(account_sid, auth_token)

user_sample = [
  {
    "_id": "5e804c501c9d440000986adc",
    "name": "Lizzie Siegle",
    "milesRan": 20,
    "milesGoal": 30
  },
  {
    "_id": "5e804c501c9d440000986adc",
    "name": "Jeff Lawson",
    "milesRan": 5,
    "milesGoal": 20
  }
]

if (user_sample[0].get("milesRan") >= user_sample[1].get("milesGoal")):
  message = client.messages \
                  .create(
                      body='Oh, no! ' + user_sample[0].get("name") + ' surpassed your running goal this week. Get moving to keep the lead!',
                      from_='+13107364584',
                      to='+19162673363'
                  )
  print(message.sid)
else:
  print("Nothing sent!");
