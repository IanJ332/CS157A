**Team Collaboration and Responsibilities:**

- **Landon:** Constructed the EER diagram, designed the database structure, and handled debugging.
- **Ray:** Constructed the diagram, designed the database structure, performed backend database optimization, and handled debugging.
- **David:** Set up the backend database, developed functions, and participated in frontend page design.
- **Ian:** Develop backend database, Designed the front end, developed functions, and connected to the database.

**Configuration Steps:**

1. **Create MySQL Database:**
   - Open MySQL Workbench and create a new database named `ticketmaster`.
   - Set the user to root.

2. **Import Tables:**
   - Use MySQL Workbench to import each table using the schemas file located at `Root/Queries` in the group’s GitHub repository for this project. This file contains all the `CREATE TABLE` statements for the tables.

3. **Replace Tomcat Folder:**
   - Replace the current `Tomcat/webapps/root` folder in your Tomcat server folder location with the group’s root folder from the GitHub repository for the project.
    
4. **Add Connector:**
   - Add the `mysql-connector-java-8.0.33.jar` file to the `lib` directory of your Tomcat installation (e.g., `Apache Software Foundation\Tomcat 10.1\lib`).
   - If your development environment is not Windows, please download the correct connector from [MySQL Connector](https://dev.mysql.com/downloads/connector/j/8.0.html) and repeat step one.

5. **Update JSP Files:**
   - Open each JSP file in the Tomcat folder.
   - Replace the password fields with your actual database password. The current placeholder for the password is 'baiyingchen'.

6. **Start Tomcat Server:**
   - Ensure the Tomcat server is running.
   - If the server does not start, please reboot your server and try again.

7. **Access the Website:**
   - Open your web browser and enter [http://localhost:8080/FirstPage.html](http://localhost:8080/FirstPage.html) in the address bar.
   - This will access the website. You can now navigate to the pages shown in the screenshots in the previous section and begin using TicketMaster.

8. **Debugging Tips:**
   - Ensure your database is up and running.
   - Make sure your MySQL Connector version is 8.0.33.
   - Database name is `ticketmaster` (all lower case).

9. **Additional Information:**
   - To download Tomcat, visit the [Apache Tomcat website](https://tomcat.apache.org/download-10.cgi).
   - For MySQL Connector/J downloads, visit the [MySQL Connector website](https://dev.mysql.com/downloads/connector/j/8.0.html).
   - `testing data.sql` are data used for demo and demonstration for final proposal.
   - `drop database.sql` & `serch table info.sql` is for quick search information and help you drop the database.

10. **Tutorial Videos:**
   - [Tutorial Video 1](https://www.youtube.com/watch?v=3QUqHiLUvFY&t=411s)
   - [Tutorial Video 2](https://www.youtube.com/watch?v=rElJIPRw5iM&t=8516s)

## Sources and Copyright

All assignments and examples, unless otherwise noted, are sourced from the internet and my own work. All rights to explanations and content are reserved by me.

## Disclaimer

The explanations and rights to all content in this directory are solely owned by team.

Thank you for using this resource. If you have any questions or need further clarification, please feel free to reach out.

