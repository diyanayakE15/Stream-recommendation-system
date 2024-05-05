import pymysql
import hashlib
import base64
import os
import tabulate

def hash_password(password, salt=None):
    if salt is None:
        salt = hashlib.sha256(os.urandom(32)).hexdigest().encode('ascii')
    hashed_password = hashlib.pbkdf2_hmac('sha256', password.encode('utf-8'), salt, 100000)
    encoded_password = base64.b64encode(hashed_password + salt).decode('ascii')
    return encoded_password

def verify_password(stored_password, provided_password):
    decoded_password = base64.b64decode(stored_password.encode('ascii'))
    hashed_password = decoded_password[:-64]
    salt = decoded_password[-64:]
    hashed_provided_password = hashlib.pbkdf2_hmac('sha256', provided_password.encode('utf-8'), salt, 100000)
    return hashed_password == hashed_provided_password

def register():
    print("You have not registered yet.\nFill in the following details in order to login")
    while(1):
        Username=input("Username: ")
        mycursor.execute("Select Username from Student where Username=%s",Username)
        check=mycursor.fetchall()
        if check!=():
            print("This Username is already registered\nTry Again")
            continue
        Password=input("Password: ")
        Hashed_Password = hash_password(Password)
        Name=input("Name: ")
        Email_ID=input("Email ID: ")
        Marks=float(input("Marks: "))
        Preference=input("Study preference: ")
        mycursor.execute("INSERT INTO Student(Username,Password,Name,Email_ID,Marks,Preference) VALUES (%s, %s, %s,%s, %s, %s)", (Username,Hashed_Password,Name,Email_ID,Marks,Preference))
        print("Your details are saved successfully! ")
        mydb.commit()
        break

mydb = pymysql.connect(
  host="localhost",
  user="root",
  password="root",
  database="stream_recommendation"
)

mycursor = mydb.cursor()

while (1):
    print("Enter your details:")
    Username=input("Username: ")
    mycursor.execute("SELECT Password FROM Student WHERE Username=%s",Username)
    result = mycursor.fetchall()
    if result==():
        register()
    else:
        Password=input("Password: ")
        if verify_password(result[0][0],Password):
            while(1):
                print("What do you want to do next?\n1.Select Stream\n2.Select College\n3.Change User\n4.Check Details")
                option=int(input("Enter your choice: "))
                if(option==1):
                    mycursor.execute("Select Preference from Student where Username=%s",Username)
                    Preference=mycursor.fetchall()
                    mycursor.execute("Select Lower(Stream_ID) from Stream_recommendation where Course_Preference=%s",Preference[0][0].lower())
                    Stream_ID=mycursor.fetchall()
                    print("Streams available:\n1.Science\n2.Commerce\n3.Humanities")
                    print(f"According to your study preference choice {Stream_ID[0][0]} is the best stream for you")
                    Stream_ID=int(input("Enter the stream you prefer: "))
                    if Stream_ID in [1,2,3]:
                        mycursor.execute("Update Student Set Stream_ID= %s where Username= %s",(Stream_ID,Username))
                        mydb.commit()
                        print("Your Stream Preference has been saved")
                    else:
                        print("Invalid choice")
                elif(option==2):
                    mycursor.execute("Select Stream_ID from Student where Username=%s",Username)
                    Stream_ID=mycursor.fetchall()
                    if Stream_ID == ((None,),):
                        print("You have not selected a Stream yet\nPlease select a stream first")
                    else:
                        College=()
                        mycursor.execute("Select Stream_ID from Student where Username=%s",Username)
                        Stream_ID=mycursor.fetchall() 
                        if(Stream_ID[0][0]==1):
                            mycursor.execute("Select College_ID,Name,Cut_Off from Science")
                            Science_colleges=mycursor.fetchall()
                            print(tabulate.tabulate(Science_colleges,headers=["ID,College","Cut Off"]))
                            College=int(input("Enter you college preference(index no.): "))
                            mycursor.execute("Select Name from Science where College_ID=%s",College)
                            College=mycursor.fetchall()
                            mycursor.execute("Update Student set College_choosen=%s where Username=%s",(College,Username))
                            mydb.commit()
                            
                        elif(Stream_ID[0][0]==2):
                            mycursor.execute("Select College_ID,Name,Cut_Off from Commerce")
                            Commerce_colleges=mycursor.fetchall()
                            print(tabulate.tabulate(Commerce_colleges,headers=["ID,College","Cut Off"]))
                            College=int(input("Enter you college preference(index no.): "))
                            mycursor.execute("Select Name from Commerce where College_ID=%s",College)
                            College=mycursor.fetchall()
                            mycursor.execute("Update Student set College_choosen=%s where Username=%s",(College,Username))
                            mydb.commit()
                        elif(Stream_ID[0][0]==3):
                            mycursor.execute("Select College_ID,Name,Cut_Off from Humanities")
                            Humanities_colleges=mycursor.fetchall()
                            print(tabulate.tabulate(Humanities_colleges,headers=["ID,College","Cut Off"]))
                            College=int(input("Enter you college preference(index no.): "))
                            mycursor.execute("Select Name from Humanities where College_ID=%s",College)
                            College=mycursor.fetchall()
                            mycursor.execute("Update Student set College_choosen=%s where Username=%s",(College,Username))
                            mydb.commit()
                        print("College Prefernce saved!!")
                        break
                elif(option==3):
                    break
                elif(option==4):
                    mycursor.execute("Select Name,Email_ID,Marks,Preference,Stream_ID,College_choosen from Student where Username=%s",Username)
                    all_details=mycursor.fetchall()
                    print("\n")
                    print(tabulate.tabulate(all_details,headers=["Name","Email_ID","Marks","Preference","Stream","College_choosen"]))
                    print("\nStream:\n1-> Science\n2-> Commerce\n3-> Humanities")
                    break
                else:
                    print("Enter a valid choice")
        else:
            print("Invalid Password!\nNot registered yet?")
            Choice=input("Enter your Choice(y/n):")
            if(Choice.lower()=="y"):
                register()
    main_choice=input("Do you want to logout?(y/n): ")
    if(main_choice.lower()=="y"):
        print("Thanky you!!")
        break


        
        

      
    







