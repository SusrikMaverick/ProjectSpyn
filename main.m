clear vars -except brick % Clear all variables/indices
brick = ConnectBrick('E33'); % Connects to the brick after clearing variables

global key % For the keyboard

brick.SetColorMode(1, 2); % Color mode set to 2 in port 1
brick.MoveMotor('A', -40); % Start the motors
brick.MoveMotor('D', -40);


while 1 % While the vehicle moves

i = 0;
for i = 0:1:70 % For loop to keep the brick reading the colors while it is in motion

    touch = brick.TouchPressed(3); % Reads if the sensor gets pressed or not
    distance = brick.UltrasonicDist(2); % Reads the distance
    color = brick.ColorCode(1); % Read the colors
    disp(distance); % Displays the distance

if distance > 70 % Determines if there is a wall or not. With the distance being greater than 45, it means that there is no wall and will begin to turn left

    pause(.75);
    brick.StopMotor('A');
    brick.StopMotor('D');

    pause(.8);
    brick.MoveMotor('A', 40); % Turns the vehicle left
    brick.MoveMotor('D', -40);

    pause(.9);
    brick.StopMotor('A');
    brick.StopMotor('D');

    pause(.8);
    brick.MoveMotor('A', -40);
    brick.MoveMotor('D', -40); % After turning left, it will continue to move forward.

    pause(1.5);

end

if distance == 255 % When the vehicle is point blank close to the wall, the ultrasonic sensor will read 255 and go left since it's higher than the threshold. This will prevent that.

      pause(.75);
      brick.MoveMotor('A', -40);
      brick.MoveMotor('D', -40); % Will continue to drive straight
      pause(1);

end

if touch % If the touch sensor was pressed, it will reverse.

    pause(0.1);
    disp('Touch sensor hit');
    brick.StopMotor('A');
    brick.StopMotor('D');

    pause(.6);
    brick.MoveMotor('A', 40); % Reverses the vehicle
    brick.MoveMotor('D', 40);

    pause(.7);
%   brick.StopMotor('A');
%   brick.StopMotor('D');
%   pause(.25);
%  if distance > 45 After reversing, the brick will
%    pause(0.25);
%    brick.StopMotor('A');
%    brick.StopMotor('D');
%    pause(.5);
%    brick.MoveMotor('A', 35);
%    brick.MoveMotor('D', -30);
%    pause(.25);
%    brick.StopMotor('A');
%    brick.StopMotor('D');
%    pause(.5);
%    brick.MoveMotor('A', -35);
%    brick.MoveMo2tor('D', -30);
%    pause(1);
    if distance < 75
          % The ultrasonic determines if there is a wall on the left side, and if there is, it will turn right
          pause(.8);
          brick.StopMotor('A');
          brick.StopMotor('D');

          pause(.8);
          brick.MoveMotor('A', -40); % Turns the car to the right
          brick.MoveMotor('D', 40);

          pause(.9);
          brick.StopMotor('A');
          brick.StopMotor('D');

          pause(.9);
          brick.MoveMotor('A', -40);
          brick.MoveMotor('D', -40); % Will continue to drive straight

          pause(.25);

end
end

switch color % Switch case depending on the color the sensor reads

case 2 % CASE BLUE. Brick will go into manual mode

brick.StopMotor('A');
brick.StopMotor('D');
InitKeyboard();
in_blue = true;

while (in_blue)

pause(0.1);

    switch key
        case 'uparrow'

        brick.MoveMotor('A', -40);
        brick.MoveMotor('D', -40);

        case 'downarrow'

        brick.MoveMotor('A', 40);
        brick.MoveMotor('D', 40);

        case 'leftarrow'

        brick.MoveMotor('A', 40);
        brick.MoveMotor('D', -40);

        case 'rightarrow'
        brick.MoveMotor('A', -40);
        brick.MoveMotor('D', 40);

        case 'w'
        brick.MoveMotor('C', 10);

        case 's'
        brick.MoveMotor('C', -10);

        case 0
        brick.StopMotor('A');
        brick.StopMotor('D');

        case 'q'
        break;

    end
end

CloseKeyboard();

case 3 % CASE GREEN. Brick will go into manual mode

brick.StopMotor('A');
brick.StopMotor('D');
InitKeyboard();
in_green = true;

while (in_green)
pause(0.1);
    switch key
        case 'uparrow'
        brick.MoveMotor('A', -40);
        brick.MoveMotor('D', -40);
        case 'downarrow'
        brick.MoveMotor('A', 40);
        brick.MoveMotor('D', 40);
        case 'leftarrow'
        brick.MoveMotor('A', 40);
        brick.MoveMotor('D', -40);
        case 'rightarrow'
        brick.MoveMotor('A', -40);
        brick.MoveMotor('D', 40);
        case 'w'
        brick.MoveMotor('C', 10);
        case 's'
        brick.MoveMotor('C', -10);
        case 0
        brick.StopMotor('A');
        brick.StopMotor('D');
        case 'q'
        brick.StopMotor('A');
        brick.StopMotor('D');
        pause(0.1);
        in_green = false;
        brick.MoveMotor('A', -40);
        brick.MoveMotor('D', -40);
        pause(.1);
    end
end
CloseKeyboard();

case 4 % CASE YELLOW. Brick will go in manual mode.

brick.StopMotor('A');
brick.StopMotor('D');
InitKeyboard();
in_yellow = true;

while (in_yellow)
pause(0.1);
    switch key
        case 'uparrow'
        brick.MoveMotor('A', -40);
        brick.MoveMotor('D', -40);
        case 'downarrow'
        brick.MoveMotor('A', 40);
        brick.MoveMotor('D', 40);
        case 'leftarrow'
        brick.MoveMotor('A', 40);
        brick.MoveMotor('D', -40);
        case 'rightarrow'
        brick.MoveMotor('A', -40);
        brick.MoveMotor('D', 40);
        case 'w'
        brick.MoveMotor('C', 10);
        case 's'
        brick.MoveMotor('C', -10);
        case 0
        brick.StopMotor('A');
        brick.StopMotor('D');
        case 'q'
        brick.StopMotor('A');
        brick.StopMotor('D');
        pause(0.1);
        in_yellow = false;
        brick.MoveMotor('A', -40);
        brick.MoveMotor('D', -40);
        pause(0.1);

    end
end
CloseKeyboard();

case 5 % CASE RED. Brick will stop, pause for 3 seconds, then start moving forward again
    brick.StopMotor('A');
    brick.StopMotor('D');

    pause(3);
    brick.MoveMotor('A', -40);
    brick.MoveMotor('D', -40);

    pause(3);

end
end
end


