# Real Estate Management System
 
## Overview
The Real Estate Management System is a web-based application designed to streamline real estate operations, including property management, customer management, and staff assignments. The project follows a three-layer architecture for maintainability and scalability. It uses SSR (Server-Side Rendering) to generate dynamic content on the server.
## Technologies
* **Backend: Spring Boot, Spring MVC, Spring Data JPA, Spring Security**
* **Frontend: JSP, Bootstrap, JavaScript**
* **Database: MySQL**


## Features
### User Authentication & Role-Based Access Control (RBAC) using Spring Security

* Implemented session-based authentication to secure API endpoints.

* Role-based access control (RBAC) to restrict user permissions.


### Property & Customer Management

* CRUD operations for managing properties, customers, and staff.

* Designed and optimized Native SQL queries to enable dynamic filtering and pagination across 16 building criteria and 5 customer criteria, improving query performance and handling.

* Pagination and sorting for optimized data retrieval.

### Staff Assignment & Role Management

* Backend logic for assigning staff to buildings and customers.

* Secure endpoint permissions to ensure managers can assign tasks, and staff members can only access assigned buildings and customers.



