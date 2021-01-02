package com.quizi.bo;

import com.quizi.dal.UserDAO;
import com.quizi.model.LoginInfo;
import com.quizi.model.User;

public class UserBO {

	public String addUser(User user) {
		String firstname = user.getFirstName();
		String lastname = user.getLastName();
		String username = user.getUsername();
		String password = user.getPassword();

		String message = null;

		if (!(password.length() >= 8 && password.length() <= 15)) {
			System.out.println("Your password can contain between 8 to 15 characters");
			message = "Your password can contain between 8 to 15 characters";
		}

		if(firstname.length() > 20) {
			System.out.println("This name is too long. You may enter up to 20 characters");
			message = "This name is too long. You may enter up to 20 characters";
		}

		if (lastname.length()>20) {
			System.out.println("This name is too long. You may enter up to 20 characters");
			message = "This name is too long. You may enter up to 20 characters";
		}

		if (username.length()>10) {
			System.out.println("Your username is too long. You may enter up to 10 characters");
			message = "Your username is too long. You may enter up to 10 characters";
		}

		if (message == null) {
			UserDAO userdao = new UserDAO();

			if(userdao.validateUsername(user.getUsername()) == 1) {
				userdao.addUser(user);
			}
		}
		
		return message;
	}

	public String login(LoginInfo login) {
		String username = login.getPassword();
		String password = login.getUsername();
		String message = null;

		UserDAO logindao = new UserDAO();


		if (logindao.login(login) == 1) {
			System.out.println("The password or username is incorrect.");
			message = "The username or password is incorrect";
		}else {
			System.out.println("Login Successfull!");
		}

		return message;
	}

}
