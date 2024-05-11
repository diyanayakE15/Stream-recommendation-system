<b>Introduction: </b><br>
The development of the stream recommendation system has aimed to provide vital guidance to students transitioning from matriculation to junior college. By addressing challenges such as decision-making complexity, limited access to resources, and technological barriers, the system offers personalized recommendations based on individual preferences and academic performance.
<br><br>
<b>Functionalities:</b><br>
This project consists of three main  functionalities: User Authentication, Stream recommendation, and college recommendation.
<br>
<i><b>User Authentication:</i></b> To ensure data privacy and confidentiality, the system offers students a secure login interface through which they can authenticate using their unique usernames and passwords. When a student creates a username the system checks whether that particular username exists or not if it already exists the user is asked to give a different username. The password is hashed before it is stored in the database so as to ensure data encryption.
<br>
<i><b>Stream Recommendation:</i></b> Students are asked to enter their academic standing and preferences after logging in. Based on the student's performance and interests, the system creates individualized suggestions for appropriate streams using algorithms and data contained in the database.
<br>
<i><b>College Recommendation:</i></b> The method shows students a list of suggested colleges that offer courses in their selected stream after they have chosen their desired stream. Students can examine comprehensive details about every college, such as facilities, faculty biographies, and admission requirements. But this feature is available only when the stream has been selected by the student. So if the stream is not selected, the system will take the user back to the stream selection page.

<b>Prerequisites</b><br>
Python 3.x
MySQL database
Installation and Setup<br>

<b>Clone the repository:</b><br>
git clone https://github.com/your-username/stream-recommendation.git

<b>Install the required dependencies:</b><br>
pip install pymysql tabulate
Set up a MySQL database and update the connection details in the code (host, user, password, database).

<b>Run the script:</b><br>
python interface.py<br>
<b>Usage:</b><br>
Run the script and follow the prompts to register or log in.
Upon login, make selections for stream and college as per the provided options.
View your details to confirm the choices made.
