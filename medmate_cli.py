import mysql.connector
from mysql.connector import errors
mydb=mysql.connector.connect(host = "localhost", user = "root", passwd = "12345")

mycur=mydb.cursor()
mycur.execute("USE medmate")


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


# Customer Sign Up
def customer_signup(signup_flag):
    flag1=1
    while flag1==1 :
        customer_name=input("Your Name: ")
        customer_age=input("Age: ")    
        customer_phone_number=input("Phone Number: ")
        customer_address=input("Address: ")
        flag2=1
        while flag2==1:
            customer_password=input("Create a Password: ")
            customer_password_again=input("Re-enter Your Password: ")
            prompt=input("Type YES/yes to continue: ")
            if prompt=="YES" or prompt=='yes':
                if(customer_password==customer_password_again):
                    try:
                        q="INSERT INTO customer values(DEFAULT, '"+customer_name+"', '"+customer_password+"', '"+customer_address+"', '"+customer_phone_number+"', '"+customer_age+"')"
                        mycur.execute(q)
                        mydb.commit()
                        flag1=0
                        flag2=0
                        print("Welcome to MedMate. Your Account has Successfully been created. Please Proceed to Login")
                        signup_flag=True
                    except mysql.connector.errors.Error as e:
                        print("ERROR: ")
                        print(e)
                        flag2=0
                        print("Please Try again: ")
                else:
                    print("Your passwords do not match. Please type the password again")
                    flag1=0
    return signup_flag
            

# Customer Login
def Customer_login(login_flag):
    flag=1
    while(flag==1):
        customer_phone = input("Enter Phone Number:  ")
        customer_Password = input("Enter Password: ")
        st="SELECT custPassword, custName, customerID from customer where custPhoneNumber="+customer_phone
        mycur.execute(st)
        recs=mycur.fetchone()
        if recs==None:
            print("No such account. Please Try again")
            continue
        if recs[0]==customer_Password:
            print("Successfully Logged in as "+ recs[1]+"\n")
            login_flag=True
            flag=0
        else:
            print("Wrong Password. Please Try again")
    return [login_flag, recs[2]]

# Manager Login
def employee_login(login_flag):
    flag=1
    while(flag==1):
        employee_phone = input("Enter Phone Number:  ")
        employee_password = input("Enter Password: ")
        st="SELECT employeePassword, employeeUsername, employeeID from employee where employeePhoneNumber="+employee_phone
        mycur.execute(st)
        recs=mycur.fetchone()
        if recs==None:
            print("No such account. Please Try again")
            continue
        if recs[0]==employee_password:
            print("Successfully Logged in as "+ recs[1]+"\n")
            login_flag=True
            flag=0
        else:
            print("Wrong Password. Please Try again")
    return [login_flag, recs[2]]


def add_medicines_to_stock():
    drug_name=input("Enter drug's Name: ")
    drug_price=input("Enter drug's price: ")
    manu_date=input("Enter drug's Manufacturing Date: ")
    exp_date=input("Enter drug's expiry date: ")
    drug_qty=input("Enter drug's quantity: ")
    company_id=input("Enter manufacturing company's ID")

    check_company_id= "select manuCompanyID from drugmanufacturer"
    mycur.execute(check_company_id)
    check_company_id_recs=mycur.fetchall()
    company_id_list=[]
    for x in check_company_id_recs:
        company_id_list+=[x[0]]
    if int(company_id) not in company_id_list:
        print ("This Company ID does not exist. Please Try again")
        return
    else:
        add_medicine="INSERT INTO medicine values(DEFAULT, '"+drug_name+"',"+drug_price+", '"+manu_date+"', '"+exp_date+"', "+drug_qty+", '"+company_id+"');"
        mycur.execute(add_medicine)
        mydb.commit()
        print("Medicine has been successfully added to the stock")

def delete_medicine_from_stock():
    drug_id=input("Enter the drug ID of the medicine you want to delete: ")
    check_drug_id= "select drugID from medicine;"
    mycur.execute(check_drug_id)
    check_drug_id_recs=mycur.fetchall()
    check_drug_id_list=[]
    for x in check_drug_id_recs:
        check_drug_id_list+=[x[0]]
    if int(drug_id) not in check_drug_id_list:
        print ("This drug ID does not exist please try again")
        return
    else:
        delete_medicine="delete from medicine where drugID="+drug_id
        mycur.execute(delete_medicine)
        mydb.commit()
        print("Medicine has been successfully deleted from stock")



def increase_quantity_of_med(drug_id, new_qty):
    check_drug_id= "select drugID from medicine;"
    mycur.execute(check_drug_id)
    check_drug_id_recs=mycur.fetchall()
    check_drug_id_list=[]
    for x in check_drug_id_recs:
        check_drug_id_list+=[x[0]]
    if int(drug_id) not in check_drug_id_list:
        print ("This drug ID does not exist please try again")
        return
    else:
        update_qty="UPDATE medicine set drugQuantity=drugQuantity+"+new_qty+" where drugID="+drug_id
        mycur.execute(update_qty)
        mydb.commit()
        print("Quantity of medicine has been successfully updated")


def view_orders():
    view_order_command='''
    select orderdetails.orderDate "Date", billingdetails.medicineOrderID "Order ID", billingdetails.totalPrice "Price(Rs)", 
    billingdetails.modeOfPayment "Payment Method", billingdetails.billingAddress "Delivery Address" 
    from orderdetails inner join billingdetails on orderID=medicineOrderID where billingdetails.modeOfPayment in ('UPI','COD','CARD');'''

    mycur.execute(view_order_command)
    view_order_recs=mycur.fetchall()

    if len(view_order_recs)==0:
        print("No records found")
        return
    else:
        print("ORDER DETAILS: ")
        display_table(view_order_recs, mycur.description)


def view_orders_between_dates(date1, date2):
    view_order_command='''
    select orderdetails.orderDate "Date", billingdetails.medicineOrderID "Order ID", billingdetails.totalPrice "Price(Rs)", 
    billingdetails.modeOfPayment "Payment Method", billingdetails.billingAddress "Delivery Address" 
    from orderdetails inner join billingdetails on orderID=medicineOrderID where billingdetails.modeOfPayment in ('UPI','COD','CARD')
    AND orderdetails.orderDate BETWEEN '''+"'"+date1+"' AND "+"'"+date2+"'"

    mycur.execute(view_order_command)
    view_order_recs=mycur.fetchall()

    if len(view_order_recs)==0:
        print("No records found between the given dates")
        return
    else:
        print("ORDER DETAILS: ")
        display_table(view_order_recs, mycur.description)

def summary():
    show_summary="select sum(totalCost) 'Total Sale (Rs)' from cart"
    mycur.execute(show_summary)
    show_summary_recs=mycur.fetchall()
    print('TOTAL SALES OF YOUR BRANCH')
    display_table(show_summary_recs, mycur.description)

summary()

#Customer Menu
def customer_queries_options(customer_id):
    hehe="y"
    while hehe=="y":
        choice2=int(input('''Please choose from the below options:
        1. Buy Medicines
        2. View all medicines available
        3. View Medicines by a specific Drug Manufacturer
        4. View Cart
        5. Remove medicines from cart or Update quantities
        6. Proceed to Checkout
        7.Log Out
        Enter Choice
        '''))
        if choice2==1:
            st='''select medicine.drugID "MedicineID",medicine.drugName "Medicine", medicine.drugPrice "Price(Rs)", medicine.drugManufacturingDate "ManufacturingDate", 
            medicine.drugExpiryDate "ExpiryDate", medicine.drugQuantity "Quantity", drugManufacturer.manuCompanyName "ManufacturingCompany" from medicine 
            inner join drugManufacturer where medicine.drugCompanyID=drugManufacturer.manuCompanyID;'''
            mycur.execute(st)
            recs=mycur.fetchall()
            if len(recs)==0:
                print("No records found")
            else:
                print("DISPLAYING DETAILS OF ALL MEDICINES AVAILABLE: \n")
                display_table(recs, mycur.description)
            answer="y"
            while answer=="y":
                options=int(input('''1.Add Medicines to cart\n2.Back\nEnter Option: '''))
                if options==1:
                    drug_id=input("Enter Drug ID of medicine to be added: ")
                    requested_qty=input("Enter quantity of the drug you wish to buy: ")
                    checker="SELECT cartDrugID from productinfo where cartCustomerID="+customer_id
                    mycur.execute(checker)
                    checker_records=mycur.fetchall()
                    checker_records_int=[]
                    for x in checker_records:
                        checker_records_int+=[x[0]]

                    #CASE 1: IF "the cart already contains the product, then update the quantity value"
                    if(int(drug_id) in checker_records_int):
                        try:
                            reduce_quantity='''UPDATE medicine set drugQuantity=drugQuantity-'''+requested_qty+'''
                                        WHERE drugID='''+drug_id+''';'''
                            mycur.execute(reduce_quantity)
                            update_quantity='''UPDATE productinfo set cartDrugQuantity=cartDrugQuantity+'''+requested_qty+'''
                                        WHERE cartCustomerID='''+customer_id+''' AND cartDrugID='''+drug_id+''';'''
                            mycur.execute(update_quantity)
                            print("Medicine with "+drug_id+" successfully added to cart")
                            mydb.commit()
                            get_cart_cost="select productinfo.cartCustomerID, productinfo.cartDrugID, medicine.drugPrice, productinfo.cartDrugQuantity from productinfo inner join medicine on productinfo.cartDrugID=medicine.drugID;"
                            mycur.execute(get_cart_cost)
                            get_cart_cost_recs=mycur.fetchall()
                            cart_cost=0
                            for x in get_cart_cost_recs:
                                if x[0]==int(customer_id):
                                    cart_cost+=(int(x[2])*int(x[3]))
                            print("Total cost of your cart: ",cart_cost)
                            update_cart_cost="UPDATE cart set totalCost= "+str(cart_cost)+" where cartCustomerID ="+ str(customer_id) +" ;"
                            mycur.execute(update_cart_cost)
                            mydb.commit()

                        except mysql.connector.Error as error:
                            print("Error:")
                            print(error)
                            mydb.rollback()
                
                    else:
                        try:
                            reduce_quantity='''UPDATE medicine set drugQuantity=drugQuantity-'''+requested_qty+'''
                                        WHERE drugID='''+drug_id+''';'''
                            mycur.execute(reduce_quantity)
                            add_medicine_to_cart= "INSERT INTO productinfo values ('"+customer_id+"','"+drug_id+"','"+requested_qty+"');"
                            mycur.execute(add_medicine_to_cart)
                            print("Medicine with "+drug_id+" successfully added to cart")
                            mydb.commit()
                            get_cart_cost="select productinfo.cartCustomerID, productinfo.cartDrugID, medicine.drugPrice, productinfo.cartDrugQuantity from productinfo inner join medicine on productinfo.cartDrugID=medicine.drugID;"
                            mycur.execute(get_cart_cost)
                            get_cart_cost_recs=mycur.fetchall()
                            cart_cost=0
                            for x in get_cart_cost_recs:
                                if x[0]==int(customer_id):
                                    cart_cost+=(int(x[2])*int(x[3]))
                            print("Total cost of your cart: ",cart_cost)
                            update_cart_cost="UPDATE cart set totalCost= "+str(cart_cost)+" where cartCustomerID ="+ str(customer_id) +" ;"
                            mycur.execute(update_cart_cost)
                            mydb.commit()

                        except mysql.connector.Error as error:
                            print("Error:")
                            print(error)
                            mydb.rollback()
                    
                elif options==2:
                    answer="n"
                else:
                    print("Please choose options between 1 and 2 only")
                    continue
                
        elif choice2==2:
            show_medicines()

        elif choice2==3:
            companyID=str(input("Enter the drug manufacturer ID: "))
            embedded_query1(companyID)

        elif choice2==4:
            view_cart='''select medicine.drugName "Medicine Name", medicine.drugPrice "Price (RS)", productinfo.cartDrugQuantity "Quantity" 
            from medicine inner join productinfo on medicine.drugID=productinfo.cartDrugID where cartCustomerID='''+customer_id+";"
            mycur.execute(view_cart)
            view_cart_recs=mycur.fetchall()
            if len(view_cart_recs)==0:
                print("Your Cart is Empty")
            else:
                print("YOUR CART:")
                display_table(view_cart_recs, mycur.description)
                get_cart_cost="select productinfo.cartCustomerID, productinfo.cartDrugID, medicine.drugPrice, productinfo.cartDrugQuantity from productinfo inner join medicine on productinfo.cartDrugID=medicine.drugID;"
                mycur.execute(get_cart_cost)
                get_cart_cost_recs=mycur.fetchall()
                cart_cost=0
                for x in get_cart_cost_recs:
                    if x[0]==int(customer_id):
                        cart_cost+=(int(x[2])*int(x[3]))
                print("Total cost of your cart: ",cart_cost)
                update_cart_cost="UPDATE cart set totalCost= "+str(cart_cost)+" where cartCustomerID ="+ str(customer_id) +" ;"
                mycur.execute(update_cart_cost)
                mydb.commit()
                # total_cost="Select totalCost from cart where cartCustomerID="+customer_id+";"
                # mycur.execute(total_cost)
                # total_cost_recs=mycur.fetchone()
                # print("TOTAL COST OF CART: (RS)", total_cost_recs[0])
        elif choice2==5:
            view_cart='''select medicine.drugName "Medicine Name", medicine.drugPrice "Price (RS)", productinfo.cartDrugQuantity "Quantity" 
            from medicine inner join productinfo on medicine.drugID=productinfo.cartDrugID where cartCustomerID='''+customer_id+";"
            mycur.execute(view_cart)
            view_cart_recs=mycur.fetchall()
            if len(view_cart_recs)==0:
                print("Your Cart is Empty")
            else:
                print("YOUR CART:")
                display_table(view_cart_recs, mycur.description)
            drug_id=input("Enter Drug ID of medicine to be deleted/ update quantity of: ")
            requested_qty=input("Enter updated quantity of drug (0 in case of deletion): ")
            checker="SELECT cartDrugID from productinfo where cartCustomerID="+customer_id
            mycur.execute(checker)
            checker_records=mycur.fetchall()
            checker_records_int=[]
            for x in checker_records:
                checker_records_int+=[x[0]]
            
            if(int(drug_id) not in checker_records_int):
                print("You do not have this drug in your cart")
                continue

            elif(int(drug_id) in checker_records_int):
                try:
                    find_current_qty="SELECT cartDrugQuantity from productinfo where cartCustomerID="+customer_id+" and cartDrugID="+drug_id
                    mycur.execute(find_current_qty)
                    find_current_qty_recs= mycur.fetchone()
                    current_qty=str(find_current_qty_recs[0])
                    
                    if requested_qty=="0":
                        
                        update_quantity='''UPDATE medicine set drugQuantity=drugQuantity+'''+current_qty+''' WHERE drugID='''+drug_id+''';'''
                        mycur.execute(update_quantity)
                        delete_from_cart="delete from productinfo where cartDrugID="+drug_id+" and cartCustomerID="+customer_id
                        mycur.execute(delete_from_cart)
                        print("Medicine with "+drug_id+" successfully removed from your cart")
                        mydb.commit()

                    else:
                        stock_qty=str(int(current_qty)-int(requested_qty))
                        update_quantity='''UPDATE medicine set drugQuantity= drugQuantity +'''+stock_qty+ ''' WHERE drugID='''+drug_id+''';'''
                        mycur.execute(update_quantity)
                        reduce_quantity='''UPDATE productinfo set cartDrugQuantity='''+requested_qty+''' WHERE cartCustomerID='''+customer_id+''' AND cartDrugID='''+drug_id+''';'''
                        mycur.execute(reduce_quantity)
                        print("Quantity of Medicine with "+drug_id+" successfully updated to "+requested_qty)
                        mydb.commit()
                    
                    view_cart='''select medicine.drugName "Medicine Name", medicine.drugPrice "Price (RS)", productinfo.cartDrugQuantity "Quantity" 
                    from medicine inner join productinfo on medicine.drugID=productinfo.cartDrugID where cartCustomerID='''+customer_id+";"
                    mycur.execute(view_cart)
                    view_cart_recs=mycur.fetchall()
                    if len(view_cart_recs)==0:
                        print("Your Cart is Empty")
                    else:
                        print("YOUR UPDATED CART:")
                        display_table(view_cart_recs, mycur.description)

                    
                    get_cart_cost="select productinfo.cartCustomerID, productinfo.cartDrugID, medicine.drugPrice, productinfo.cartDrugQuantity from productinfo inner join medicine on productinfo.cartDrugID=medicine.drugID;"
                    mycur.execute(get_cart_cost)
                    get_cart_cost_recs=mycur.fetchall()
                    cart_cost=0
                    for x in get_cart_cost_recs:
                        if x[0]==int(customer_id):
                            cart_cost+=(int(x[2])*int(x[3]))
                    print("Total cost of your cart: ",cart_cost)
                    update_cart_cost="UPDATE cart set totalCost= "+str(cart_cost)+" where cartCustomerID ="+ str(customer_id) +" ;"
                    mycur.execute(update_cart_cost)
                    mydb.commit()

                except mysql.connector.Error as error:
                    print("Error:")
                    print(error)
                    mydb.rollback()
            
        elif choice2==6:
            view_cart='''select medicine.drugName "Medicine Name", medicine.drugPrice "Price (RS)", productinfo.cartDrugQuantity "Quantity" 
            from medicine inner join productinfo on medicine.drugID=productinfo.cartDrugID where cartCustomerID='''+customer_id+";"
            mycur.execute(view_cart)
            view_cart_recs=mycur.fetchall()
            if len(view_cart_recs)==0:
                print("Your Cart is Empty")
            else:
                print("YOUR CART:")
                display_table(view_cart_recs, mycur.description)
            get_cart_cost="select productinfo.cartCustomerID, productinfo.cartDrugID, medicine.drugPrice, productinfo.cartDrugQuantity from productinfo inner join medicine on productinfo.cartDrugID=medicine.drugID;"
            mycur.execute(get_cart_cost)
            get_cart_cost_recs=mycur.fetchall()
            cart_cost=0
            for x in get_cart_cost_recs:
                if x[0]==int(customer_id):
                    cart_cost+=(int(x[2])*int(x[3]))
            print("Total cost of your cart: ",cart_cost)
            # update_cart_cost="UPDATE cart set totalCost= "+str(cart_cost)+" where cartCustomerID ="+ str(customer_id) +" ;"
            # mycur.execute(update_cart_cost)
            # mydb.commit()

            # cart_total_cost="select totalCost from cart where cartCustomerID="+customer_id+";"
            # mycur.execute(cart_total_cost)
            # cart_total_cost_recs=mycur.fetchone()
            # print("TOTAL CART PRICE IS: RS. ",cart_total_cost_recs)
            

            proceed_option=input("You are about to checkout. Do you want to proceed?\n1.Yes\n2.No\nEnter choice: ")
            if(proceed_option=='1'):
                if(cart_cost>10000):
                    show_discounts="select discountID 'Discount ID', discountPercentage 'Discount %' from discount order by rand() limit 3;"
                    mycur.execute(show_discounts)
                    show_discounts_recs=mycur.fetchall()
                    print(show_discounts_recs)
                    print("Congratulations! You are eligible for these discounts: Please Select the one you would like to redeem")
                    display_table(show_discounts_recs, mycur.description)
                    choose_discount=input("Please enter the Discount ID of the discount coupon you would like to apply: ")
                    discount_flag=0
                    for x in show_discounts_recs:
                        if x[0]==int(choose_discount):
                            discounted_cart_cost="UPDATE cart set totalCost=totalCost-"+"totalCost * "+str(int(x[1])/100)+" where cartCustomerID="+customer_id
                            mycur.execute(discounted_cart_cost)
                            discount_flag=1
                            mydb.commit()
                            show_total_cost="select totalCost from cart where cartCustomerID="+customer_id+";"
                            mycur.execute(show_total_cost)
                            show_total_cost_recs=mycur.fetchone()
                            print("TOTAL CHECKOUT PRICE IS: RS. ",show_total_cost_recs[0])
                            break
                    
                    if(discount_flag==0):
                        print("You do not have this discount coupon")
                        continue
                else:
                    print("You are not eligible for any discounts")
                    show_total_cost="select totalCost from cart where cartCustomerID="+customer_id+";"
                    mycur.execute(show_total_cost)
                    show_total_cost_recs=mycur.fetchone()
                    print("TOTAL CHECKOUT PRICE IS: RS. ",show_total_cost_recs)

            elif(proceed_option==2):
                continue

            show_total_cost="select totalCost from cart where cartCustomerID="+customer_id+";"
            mycur.execute(show_total_cost)
            show_total_cost_recs=mycur.fetchone()
            final_total_cost=str(show_total_cost_recs[0])

            delivery_address=input("Please enter your delivery Address: ")
            cur_date="Select CURDATE();"
            mycur.execute(cur_date)
            cur_date_rec=mycur.fetchone()
            todays_date= str(cur_date_rec[0])
            place_order="INSERT INTO orderdetails values (DEFAULT,"+ final_total_cost+", '" + delivery_address+"', '"+todays_date+"',"+customer_id+");"
            mycur.execute(place_order)
            mydb.commit()

            payment_method=input("Please enter mode of Payment:\n1.COD\n2.UPI\n3.CARD\nEnter Choice: ")
            mode_of_payment=""
            if payment_method=='1':
                mode_of_payment="COD"
            elif payment_method=='2':
                mode_of_payment="UPI"
            elif payment_method=='3':
                mode_of_payment="CARD"
            else:
                print("WRONG CHOICE.")
                continue

            order_id="select orderID from orderdetails where cartID="+customer_id+";"
            mycur.execute(order_id)
            order_id_recs=mycur.fetchall()
            order_id_string=str(order_id_recs[-1][0])
            print(order_id_string)
            mycur.execute("UPDATE billingdetails set modeOfPayment= '"+mode_of_payment+"' where medicineOrderID="+order_id_string+";")
            mydb.commit()
            print("Order has been placed! Your Order will be arriving in 3 business days")

        elif choice2==7:
            sure=input("Are you sure you want to LogOut? Y/N")
            if sure=="Y" or sure=="y":
                answer="n"
                hehe="n"
        else:
            print("Wrong Choice\n")


def show_delivery_partners():
    st="SELECT * FROM deliverypartner"
    mycur.execute(st)
    recs=mycur.fetchall()
    display_table(recs,mycur.description)



# EMPLOYEE MENU 

def employee_query_options(id):
    ans2='y'
    if check_manager(id):
        while ans2=='y': 
            choice2=int(input('''Please select the query you want to run:
            1. Add new medicines to stock
            2. Delete a medicine from stock
            3. Increase quantity of a medicine in stock
            4. View all medicines and their details
            5. View medicines sold by a particular drug manufacturer
            6. Display the customer details of those who bought drugs from a particular company
            7. Display records of all employees
            8. View all orders
            9. View orders betweeen given dates
            10. Get total sales of branch
            11. Show details of delivery partners
            12. Logout
            Enter Choice: '''))
            if choice2==1:
                add_medicines_to_stock()
            elif choice2==2:
                delete_medicine_from_stock()
            elif choice2==3:
                drug_id=input("Enter drug id which you want to update: ")
                new_qty=input("Enter the quantity to be added: ")
                increase_quantity_of_med(drug_id, new_qty)
            elif choice2==4:
                show_medicines()
            elif choice2==5:
                companyID=str(input("Enter the drug manufacturer ID: "))
                embedded_query1(companyID)
            elif choice2==6:
                companyID=str(input("Enter the drug manufacturer ID: "))
                embedded_query2(companyID)
            elif choice2==7:
                manager_query1()
            elif choice2==8:
                view_orders()
            elif choice2==9:
                date1=input("Enter start date: ")
                date2=input("Enter end date: ")
                view_orders_between_dates(date1,date2)
            elif choice2==10:
                summary()
            elif choice2==11:
                show_delivery_partners()
            elif choice2==12:
                ask=input("Are you sure you want to logout? Y/N")
                if ask=='Y' or ask=='y':
                    ans2='n'
            else:
                print("Wrong choice\n") 


#added section--------------------

#diverse queries section
def count_on_mode_of_payment():
    st='''SELECT modeOfPayment as “Mode of Payment”, count(*) “Number Of Orders” 
    FROM billingdetails 
    GROUP BY modeOfPayment;'''
    mycur.execute(st)
    recs=mycur.fetchall()
    if len(recs)==0:
        print("No records found")
    else:
        print("Counting the number of orders with mode of payment as COD/UPI/Card") 
        display_table(recs, mycur.description)

def carts_eligible_for_discount():
    st='''SELECT customer.custName AS "Customers Eligible for Discount", cart.totalCost AS "Cart Cost (Rs)"FROM customer 
    INNER JOIN cart ON cart.cartCustomerID=customer.customerID 
    WHERE cart.totalCost>10000 
    ORDER BY cart.totalCost DESC;'''
    mycur.execute(st)
    recs=mycur.fetchall()
    if len(recs)==0:
        print("No records found")
    else:
        print("Displaying customer names and their cart's total cost who are eligible for a discount (with total cart cost greater than 5000)") 
        display_table(recs, mycur.description)





#added section--------------------

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
    st="SELECT managerID from employee where employeeID="+str(id)
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



choice0=int(input('''WELCOME TO MEDMATE. YOUR ONLINE MEDICAL STORE. PLEASE ENTER THE REQUIRED NUMBER:
1. CUSTOMER
2. EMPLOYEE
Enter Choice: '''))
if(choice0==1):
    flag=1
    while(flag==1):
        choice01=int(input('''1. LOGIN\n2. SIGNUP\nEnter Choice: '''))
        if(choice01==1):
            login_flag=False
            x=Customer_login(login_flag)
            print(x)
            if(x[0]==True):
                flag=0
                while ans1=="y":
                    customer_queries_options(str(x[1]))
                    ans1=str(input("Do you want to continue? y/n"))
                
        elif(choice01==2):
            signup_flag=False
            x=customer_signup(signup_flag)
            flag=0
            if x==True:
                login_flag=False
                y=Customer_login(login_flag)
                if(y[0]==True):
                    flag=0
                    while ans1=="y":
                        customer_queries_options(str(y[1]))
                        ans1=str(input("Do you want to continue? y/n"))
        else:
            print("WRONG CHOICE! Please Choose from the choices given: 1 or 2")

elif(choice0==2):
    flag=1
    while(flag==1):
        print("Please Login to your account:")
        login_flag=False
        x=employee_login(login_flag)
        if(x[0]==True):
            flag=0
            while ans1=="y":
                employee_query_options(x[1])
                ans1=str(input("Do you want to continue? y/n"))

print("Bye Bye")