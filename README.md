How to install

-----------#1: Setup environment-----------

1. Tomcat 8.5 – Download latest Apache Tomcat from this here: http://tomcat.apache.org/download-80.cgi
2. Make sure you download Eclipse IDE for Java EE Developers (Neon v4.6) – Download link:
http://www.eclipse.org/downloads/eclipse-packages/
3. Spring 4.3.7 (No download required) – we will use Maven dependency:
https://crunchify.com/how-to-import-all-spring-mvc-dependencies-to-your-maven-project/
4. JDK 1.8 – Download link:
http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
5. Install postgreSQL 9.3, link: https://www.postgresql.org/download/

=> Set environment variable cho Java JDK (MAC eo biet)
-> Cai dat tomcat(ko can start)
-> checkout source tu link nay: https://github.com/khangtrieuvy/dogodct.git
-----------#1: Setup environment-----------

-----------#2: How to run-----------

Sau khi import project tu git vao Eclipse, build project bang maven:
Right click vao project -> chon Run As -> Maven build

=> ko co error thi run thu tren server tomcat = cach:
Right click vao project -> chon Run As -> Run on server

=> Khi co chinh sua thi chi can save lai file la no auto publish lai, ko can build + restart server

-----------#2: How to run-----------