# Traffic_Signal_controller
 Traffic_Signal_controller allows the traffic to flow smoothly between Highway and Country road.<br/>
 The Highway signal is green, as many vehicles move on the Highway road. When there's a vehicle on country road, the sensor detects the vehicle and turns the signal from green to red on the highway road and signals green for country road.<br/>
When the sensor detects no vheicles/ all vehicles have passed, it signals red to country road and resumes Highway traffic.<br/>
This module uses FSM(Finite State Machince) in order to make the traffic flow smoother.<br/>
## FSM
|**States**  |       **highwayrd**  | **countryrd** <br/>|
| --- | --- | --- |
|S0          |   GREEN    |   RED<br/>|
|S1           |  YELLOW   |   RED<br/>|
|S2          |   RED      |   RED<br/>|
||S3          |   RED     |    GREEN<br/>|
S4           |  RED      |   YELLOW<br/>|

## OUTPUT
                   0 highway road = 10, country road = 00 car on country road =0
                 250 highway road = 10, country road = 00 car on country road =1
                 255 highway road = 01, country road = 00 car on country road =1
                 285 highway road = 00, country road = 00 car on country road =1
                 315 highway road = 00, country road = 10 car on country road =1
                 350 highway road = 00, country road = 10 car on country road =0
                 355 highway road = 00, country road = 01 car on country road =0
                 385 highway road = 10, country road = 00 car on country road =0
                 550 highway road = 10, country road = 00 car on country road =1
                 555 highway road = 01, country road = 00 car on country road =1
                 585 highway road = 00, country road = 00 car on country road =1
                 615 highway road = 00, country road = 10 car on country road =1
                 750 highway road = 00, country road = 10 car on country road =0
                 755 highway road = 00, country road = 01 car on country road =0
                 785 highway road = 10, country road = 00 car on country road =0
