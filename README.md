<img src="https://github.com/user-attachments/files/19179349/RADAR-PROJECT-IMAGE.pdf"/> 
Radar-system-with-Ardruino
This repository presents the development of a radar system using an Arduino microcontroller for object detection and distance measurement. The project utilises ultrasonic sensors to emit and receive sound waves, applying the time-of-flight principle to calculate object distances. A servo motor rotates the sensor across a 180-degree range, providing a broad field of detection. The detected data is visualised in real-time on a graphical user interface (GUI).

The report covers the hardware setup, software implementation, and system testing, emphasising performance metrics such as range accuracy, detection speed, and angular coverage. Challenges encountered, including unfamiliarity with new software, software bugs, and sensor alignment issues, were addressed through calibration and code refinements. This project showcases the practical application of Arduino-based systems in radar technology, demonstrating their accessibility and cost-effectiveness for small- to medium-scale object detection solutions.



<h2> COMPONENTS USED </h2>
S/N	PRODUCT	QUANTITY <br>
1	HC-SR04 Ultrasonic	1	<br>
2	Arduino Uno	1	<br>
3	Active Buzzer	1	<br>
4	220Ω 1/4W Resistors	4	<br>
5	1kΩ 2W Resistor	1	<br>
6	9G Servo Motor	1	<br>
7	Slide Switch	1		<br>


<h2>Radar system on the processing app</h2>
<img width="1300" alt="Screenshot 2025-01-01 at 15 26 50" src="https://github.com/user-attachments/assets/1045d319-f71a-476c-96ef-ee13c80fe12e" />

<h2>Fully Developed Radar System</h2>
<img width="144" alt="Screenshot 2025-01-01 at 15 26 50" src="https://github.com/user-attachments/assets/b954d132-209a-43c0-be31-f6ca8d0f9370"/>

<h2>Radar System circuit diagram</h2>
<img width="1300" src="https://github.com/user-attachments/assets/20224688-419e-45ed-977a-3d80a53b8afd"/>
<h5>made with Tinkercad</h5>

<br><br/>

<h2>CONCLUSION</h2>
The Arduino-based radar system demonstrates how fundamental radar principles can be effectively implemented using low-cost, readily available hardware. The system achieves real-time object detection and distance measurement by integrating an ultrasonic sensor, servo motor, and Arduino microcontroller, showcasing practical applications in obstacle detection, navigation, and surveillance.

The project emphasises the importance of signal processing, time-of-flight calculations, and hardware-software integration in developing functional prototypes. It also highlights the versatility of Arduino-based systems in exploring complex engineering concepts.

This radar system serves as a stepping stone for more advanced applications, with potential enhancements such as extended range, increased accuracy, and wireless communication for remote monitoring. It bridges theoretical knowledge and practical implementation, providing a valuable learning experience in robotics and automation.



<h2>RECOMMENDATION</h2>
The radar system can be significantly enhanced by focusing on several key areas to improve performance and adaptability for various applications. Firstly, the detection range and accuracy can be upgraded by integrating RF radar modules and high-resolution sensors. To visualise the data effectively, advanced data visualisation techniques can be implemented using Python, allowing real-time tracking and analysis. Additionally, wireless connectivity could be added through Bluetooth or Wi-Fi, enabling remote control and monitoring of the system if you’d like to still visualise the data on an external system.

To boost the system’s processing power, microcontrollers such as a Raspberry Pi should be incorporated, allowing for complex computations and the implementation of machine learning algorithms for object classification. A reliable power source, such as a 9V battery, should be used to power the microcontrollers and sensors, ensuring mobility and efficiency. The system should also feature a 5.0” 40-pin TFT Display (800 x 480) or an alternative OLED display for better interaction and data visualisation.

The radar system will be optimised for challenging environments, ensuring energy efficiency and adaptability to diverse use cases such as autonomous navigation, security, and industrial automation.
