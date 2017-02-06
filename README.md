# SpringMVCHibernateWithSpringSecurity
Spring MVC 4 + Spring Security 4 + Hibernate Example

********************
The project shows a simple user-management application. One can create a new user, edit or delete an existing user, and list all the users. User can be associated with one or more UserProfile, showing many-to-many relationship. URL’s of the applications are secured using Spring Security. That means, based on the roles of logged in user, access to certain URL’s will be granted or prohibited. On the view layer, user will see only the content he/she is allowed to based on the roles assigned to him/her, thanks to Spring Security tags for view layer.