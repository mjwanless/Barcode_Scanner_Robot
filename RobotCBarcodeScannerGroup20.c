#pragma config(Sensor, S3,     colorSensor,    sensorEV3_Color, modeEV3Color_Color)
#pragma config(Motor,  motorB,          forwardMotor,  tmotorEV3_Large, PIDControl, driveLeft, encoder)



task main()
{

		// Reset all encoder values to zero
		nMotorEncoder(forwardMotor)=0;

		// Check for pre-existing .txt datalog for robotC input
		if (!datalogOpen(501,1,false)){
			displayCenteredTextLine(4,"unable to open datalog");	// If the data exists, overwrite and display an error message
		}

		// Set forward speed to constant value
		setMotorSpeed(forwardMotor,5);

		// Write data values from color sensor to file.
    while(nMotorEncoder(forwardMotor)<340) { // Change for the size of the barcode, based on wheel to encoder ratio
			datalogAddLong(0,(long)getColorReflected(S3));
			sleep(.5);
		}

		// Turn off motors and close file
		setMotorSpeed(forwardMotor,0);
		waitUntilMotorStop(forwardMotor);
		datalogClose();

}
