import mysql.connector
mydb=mysql.connector.connect(host = "localhost", user = "root", passwd = "12345")

mycur=mydb.cursor()
mycur.execute("USE medmate")


# Customer Sign Up

def customer_signup():
    customer_name=input("Your Name: ")
    customer_phone_number=input("Phone Number: ")
    

#Helper function to find maximum length of column needed for display
def find_max_col_length(recs, col_index, col_name):
    max_col_length = 0
    for record in recs:
        curr_length = len(str(record[col_index]))
        if curr_length > max_col_length:
            max_col_length = curr_length
    return max(max_col_length, len(col_name))


#Helper function to display the given table 'recs'
def display_table(recs, table_desciption):
    widths = []
    columns = []
    boundary = '|'
    separator = '+'
    index = 0
    
    for cd in table_desciption:
        widths.append(find_max_col_length(recs, index, cd[0]))
        columns.append(cd[0])
        index+=1
     
    for w in widths:
        boundary += " %-"+"%ss |" % (w,)
        separator += '-'*w + '--+'
     
    print(separator)
    print(boundary % tuple(columns))
    print(separator)
    for row in recs:
        print(boundary % row)
    print(separator)

def embedded_query1(companyID):
    st='''SELECT medicine.drugID, medicine.drugName, drugManufacturer.manuCompanyName 
    FROM medicine 
    INNER JOIN drugManufacturer 
    ON drugManufacturer.manuCompanyID=medicine.drugCompanyID 
    WHERE drugManufacturer.manuCompanyID='''+companyID
    mycur.execute(st)
    recs=mycur.fetchall()
    if len(recs)==0:
        print("No records found")
    else:
        print("Displaying all drugs sold by drug manufacturer with ID="+companyID +": ") 
        display_table(recs, mycur.description)

def embedded_query2(companyID):
    st='''SELECT customer.customerID, customer.custName, medicine.drugID, drugManufacturer.manuCompanyName 
    FROM (((customer 
    INNER JOIN productinfo ON customer.customerID=productInfo.cartCustomerID) 
    INNER JOIN medicine on productInfo.cartDrugID=medicine.drugID) 
    INNER join drugManufacturer ON 
    drugManufacturer.manuCompanyID=medicine.drugCompanyID) 
    WHERE drugManufacturer.manuCompanyID='''+companyID
    mycur.execute(st)
    recs=mycur.fetchall()
    if len(recs)==0:
        print("No records found")
    else:
        print("Displaying results of query 2: ") 
        display_table(recs, mycur.description)

def show_medicines():
    st="Select * from medicine"
    mycur.execute(st)
    recs=mycur.fetchall()
    if len(recs)==0:
        print("No records found")
    else:
        print("Displaying records of all medicines: ") 
        display_table(recs, mycur.description)

def manager_query1():
    st="SELECT * from employee"
    mycur.execute(st)
    recs=mycur.fetchall()
    if len(recs)==0:
        print("No records found")
    else:
        print("Displaying records of employees: ") 
        display_table(recs, mycur.description)


def check_manager(id):
    st="SELECT managerID from employee where employeeID="+id
    mycur.execute(st)
    recs=mycur.fetchall()
    if len(recs)==0:
        print("No records found")
        return False
    for i in recs:
        if i[0]==1:
            return True
        else:
            print("You do not have access")
            return False
    return False

def olap1():
    st='''SELECT drugExpiryDate, drugName, drugID, max(drugQuantity)
    FROM medicine
    GROUP BY drugExpiryDate, drugName, drugID WITH ROLLUP
    ORDER BY GROUPING(drugExpiryDate) DESC'''
    mycur.execute(st)
    recs=mycur.fetchall()
    if len(recs)==0:
        print("No records found")
    else:
        print("Displaying results of olap query 1: ") 
        display_table(recs, mycur.description)

def olap2():
    st='''SELECT drugName, drugCompanyID, drugID, max(drugQuantity) 
    FROM medicine 
    GROUP BY drugName, drugCompanyID, drugID WITH ROLLUP'''
    mycur.execute(st)
    recs=mycur.fetchall()
    if len(recs)==0:
        print("No records found")
    else:
        print("Displaying results of olap query 2: ") 
        display_table(recs, mycur.description)

def olap3():
    st='''SELECT orderID, orderDrugID, drugCount, orderDate, max(checkoutPrice)
    FROM orderdetails GROUP BY orderID, orderDrugID, drugCount, orderDate WITH ROLLUP'''
    mycur.execute(st)
    recs=mycur.fetchall()
    if len(recs)==0:
        print("No records found")
    else:
        print("Displaying results of olap query 3: ") 
        display_table(recs, mycur.description)

def olap4():
    st='''SELECT drugCompanyID, drugID, drugName, max(drugPrice) 
    FROM medicine GROUP BY drugCompanyID, drugID, drugName WITH ROLLUP '''
    mycur.execute(st)
    recs=mycur.fetchall()
    if len(recs)==0:
        print("No records found")
    else:
        print("Displaying results of olap query 4: ") 
        display_table(recs, mycur.description)


def updation_trigger():
    did=input("Enter drug ID of drug you want to update quantity of: ")
    qty=input("Enter new quantity of drug: ")
    try:
        st="UPDATE medicine set drugQuantity= '"+qty+"' where drugID= '"+did+"' "
        mycur.execute(st)
        print("Quantity has been updated")
    except:
        print("Drug Quantity low, can't update")
    mydb.commit()


def insertion_trigger():
    oid=input("Enter orderID: ")
    cprice=input("Enter checkout price: ")
    addr=input("Enter Delivery address: ")
    date=input("Enter order date: ")
    cnt=input("Enter drug count: ")
    did=input("Enter order drug ID: ")

    print()
    st="INSERT INTO orderdetails values('"+oid+"', '"+cprice+"', '"+addr+"', '"+date+"', '"+cnt+"', '"+did+"')"
    mycur.execute(st)
    mydb.commit()

    st1="SELECT * FROM billingdetails"
    mycur.execute(st1)
    recs=mycur.fetchall()
    if len(recs)==0:
        print("No records found")
    else:
        print("Displaying records of billing details: ") 
        display_table(recs, mycur.description)




ans1='y'
ans2='y'
choice1=int(input("Welcome to MedMate! Please choose:\n 1.Login as customer\n 2.Login as manager\n"))
if choice1==1:
    while ans1=='y':
        #if choice1==1:
        choice2=int(input('''Please select the query you want to run:\n 
        1. Display all drugs sold by a particular drug manufacturer\n 
        2. Display records of all medicines\n
        '''))
        if choice2==1:
            companyID=str(input("Enter the drug manufacturer ID: "))
            embedded_query1(companyID)
        elif choice2==2:
            show_medicines()
        else:
            print("Wrong Choice\n")
        ans1=str(input("Do you want to continue? y/n"))


elif choice1==2:
    id=str(input("Enter your employeeID: "))
    if check_manager(id):
        while ans2=='y': 
            choice2=int(input('''Please select the query you want to run:\n 
            1. Display all drugs sold by a particular drug manufacturer\n 
            2. Display the customer details of those who bought drugs from a particular company\n 
            3.Display records of all emplpyees\n
            4. Run Olap query 1
            5. Run Olap query 2
            6. Run Olap query 3
            7. Run Olap query 4
            8. This trigger adds data to the billingdetails table as soon as and order is placed.
            9. This trigger shows a message to the pharmacy when the quantity of a drug goes below 10 so that the pharmacy can order more drugs and re-stock\n 
            '''))
            if choice2==1:
                companyID=str(input("Enter the drug manufacturer ID: "))
                embedded_query1(companyID)
            elif choice2==2:
                companyID=str(input("Enter the drug manufacturer ID: "))
                embedded_query2(companyID)
            elif choice2==3:
                manager_query1()
            elif choice2==4:
                olap1()
            elif choice2==5:
                olap2()
            elif choice2==6:
                olap3()
            elif choice2==7:
                olap4()
            elif choice2==8:
                insertion_trigger()
            elif choice2==9:
                updation_trigger()
            else:
                print("Wrong choice\n")
            ans2=str(input("Do you want to continue? y/n"))

print("Bye Bye")