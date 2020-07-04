package com.shopdongho.controller.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.shopdongho.model.AccountModel;
import com.shopdongho.model.EmployeeModel;
import com.shopdongho.service.AccountService;
import com.shopdongho.service.EmployeeService;

import javassist.expr.Instanceof;

@Controller
public class EmployeeController {

	String pathimage = "./static/images/employees/";
	
	@Autowired
	EmployeeService employeeSer;
	
	@Autowired
	AccountService accoutService;

	@RequestMapping("admin-listEmployee")
	public String showListEmployees(Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		List<EmployeeModel> lsEmp = employeeSer.findAll();
		model.addAttribute("listEmployees", lsEmp);
		return "admin/listEmployees";
	}

	@RequestMapping("admin-showAddEmployees")
	public String showAddEmployees(@RequestParam List<String> acc, @RequestParam String message, Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("acc", acc);
		if(message.equals("Username đã tồn tại!")) {
			model.addAttribute("message", message);
		}else {
			model.addAttribute("messageDate", message);
		}
		model.addAttribute("employee", new EmployeeModel());
		return "admin/addEmployee";
	}

	@RequestMapping(value = "admin-showEmployeeInfo")
	public String showEmployeeInfo(@RequestParam String id, @RequestParam("list") String list, Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}
		EmployeeModel employee = employeeSer.findOne(Integer.parseInt(id));
		model.addAttribute("employee", employee);
		model.addAttribute("list", list);
		return "admin/infoEmployee";
	}

	@RequestMapping("admin-deleteEmployee")
	public String deleteEmployee(@RequestParam String id, RedirectAttributes redirectAttb, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		EmployeeModel emp = employeeSer.findOne(Integer.parseInt(id));
		EmployeeModel empSession = (EmployeeModel) session.getAttribute("employeeSession");
		if(!emp.getAccount().getUsername().equals("Admin") && emp.getEmployeeID() != empSession.getEmployeeID()) {
			redirectAttb.addAttribute("message", employeeSer.delete(Integer.parseInt(id)));
			accoutService.delete(emp.getAccount());
		}
		return "redirect:admin-listEmployee";
	}
	
	@RequestMapping("admin-seacrhEmployee")
	public String seacrhEmployee(@RequestParam String search, Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		List<EmployeeModel> lsEmp = employeeSer.searchEmployee(search);
		model.addAttribute("listEmployees", lsEmp);
		return "admin/listEmployees";
	}
	
	@RequestMapping("admin-addEmployee")
	public RedirectView addEmployee(@RequestParam List<String> acc, RedirectAttributes reAttributes, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return new RedirectView("admin-home");
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return new RedirectView("admin-home");
			}
		}
		try {
			Date d = Date.valueOf(acc.get(7));
			Date minDate = Date.valueOf("1980-01-01");
			Date maxDate = Date.valueOf("2002-01-01");
			if(d.after(maxDate)) {
				reAttributes.addAttribute("message", "Sorry ngày không hợp lệ!");
				reAttributes.addAttribute("acc", acc);
				return new RedirectView("admin-showAddEmployees");
			}
			if(d.before(minDate)) {
				reAttributes.addAttribute("message", "Sorry ngày không hợp lệ!");
				reAttributes.addAttribute("acc", acc);
				return new RedirectView("admin-showAddEmployees");
			}
		} catch (Exception e) {
			reAttributes.addAttribute("message", "Định dạng ngày không đúng!");
			reAttributes.addAttribute("acc", acc);
			return new RedirectView("admin-showAddEmployees");
		}
		AccountModel account = new AccountModel(0, acc.get(0), acc.get(1), Integer.parseInt(acc.get(2)));
		String message = accoutService.insert(account);
		if(message.equals("Username đã tồn tại!")) {
			reAttributes.addAttribute("message", message);
			reAttributes.addAttribute("acc", acc);
			return new RedirectView("admin-showAddEmployees");
		}else {
			List<AccountModel> lastAccount = accoutService.getLastAccount();
			EmployeeModel employee = new EmployeeModel(0, lastAccount.get(0), acc.get(3), acc.get(4), acc.get(5), acc.get(6), Date.valueOf(acc.get(7)), pathimage + acc.get(8), acc.get(9));
			employeeSer.save(employee);
			return new RedirectView("admin-listEmployee");
		}
	}

	@RequestMapping(value = "admin-showEditAccount")
	public String showEditAccount(@RequestParam("id") int id, @RequestParam("message") String message, Model model, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return "redirect:admin-home";
			}
		}
		model.addAttribute("account", accoutService.findOne(id));
		model.addAttribute("message", message);
		return "admin/editEmployeeAccount";
	}
	
	@RequestMapping("admin-editEmployeeAccount")
	public RedirectView editEmployeeAccount(@ModelAttribute("account") AccountModel account, RedirectAttributes reAttributes, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return new RedirectView("admin-home");
		}else {
			EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
			if(emp.getAccount().getRole() == 0) {
				session.removeAttribute("employeeSession");
				return new RedirectView("admin-home");
			}
		}
		
		String message = accoutService.edit(account);
		if(message.equals("Username "+ account.getUsername() +" đã tồn tại!")) {
			reAttributes.addAttribute("message", message);
			reAttributes.addAttribute("id", account.getAccountID());
			return new RedirectView("admin-showEditAccount");
		}
		EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
		if(emp.getAccount().getAccountID() == account.getAccountID()) {
			if(emp.getAccount().getRole() != account.getRole()) {
				session.removeAttribute("employeeSession");
				return new RedirectView("admin-home");
			}
			session.setAttribute("employeeSession", employeeSer.findOneByAccount(account));
		}
		return new RedirectView("admin-listEmployee");
	}
	
	@RequestMapping("admin-editEmployee")
	public String editEmployee(@RequestParam List<String> acc, Model model, RedirectAttributes reAttributes, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}
		String img;
		EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
		if(acc.get(11).equals("")) {
			img = emp.getPhoto();
		}else {
			img = pathimage + acc.get(11);
		}
		try {
			Date d = Date.valueOf(acc.get(5));
			Date minDate = Date.valueOf("1980-01-01");
			Date maxDate = Date.valueOf("2002-01-01");
			if(d.after(maxDate)) {
				reAttributes.addAttribute("message", "Sorry ngày không hợp lệ!");
				reAttributes.addAttribute("acc", acc);
				return "redirect:admin-information";
			}
			if(d.before(minDate)) {
				reAttributes.addAttribute("message", "Sorry ngày không hợp lệ!");
				reAttributes.addAttribute("acc", acc);
				return "redirect:admin-information";
			}
		}catch(Exception e) {
			reAttributes.addAttribute("message", "Định dạng ngày không đúng!");
			return "redirect:admin-information";
		}
		AccountModel account = new AccountModel(Integer.parseInt(acc.get(7)), acc.get(8), acc.get(9), Integer.parseInt(acc.get(10)));
		EmployeeModel employee = new EmployeeModel(Integer.parseInt(acc.get(0)), account, acc.get(1), acc.get(2), acc.get(3), acc.get(4), Date.valueOf(acc.get(5)), img, acc.get(6));
		employeeSer.save(employee);
		session.setAttribute("employeeSession", employee);
		return "redirect:admin-home";
	}
	
	@RequestMapping(value = "admin-information")
	public String showEmployeeInformation(Model model, @RequestParam("message") String message, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}
		model.addAttribute("message", message);
		return "admin/editEmployee";
	}
	
	@RequestMapping(value = "admin-ShowChangePass")
	public String showChangePass(Model model, @RequestParam("message") String message, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}
		model.addAttribute("message", message);
		return "admin/changePassword";
	}
	
	@RequestMapping(value = "admin-changePass")
	public String changePass(RedirectAttributes reAttributes, HttpServletRequest request, HttpSession session) {
		if(session.getAttribute("employeeSession") == null) {
			return "redirect:admin-home";
		}
		EmployeeModel emp = (EmployeeModel) session.getAttribute("employeeSession");
		String oldPass = request.getParameter("oldPass");
		String newPass = request.getParameter("newPass");
		String comfirmPass = request.getParameter("comfirmPass");
		if(!oldPass.equals(emp.getAccount().getPassword())) {
			reAttributes.addAttribute("message", "Mật khẩu cũ không đúng!");
			return "redirect:admin-ShowChangePass";
		}else if(!newPass.equals(comfirmPass)) {
			reAttributes.addAttribute("message", "Xác nhận mật khẩu không trùng khớp!");
			return "redirect:admin-ShowChangePass";
		}else if(oldPass.equals(newPass)) {
			reAttributes.addAttribute("message", "Mật khẩu mới phải khác mật khẩu cũ!");
			return "redirect:admin-ShowChangePass";
		}else {
			AccountModel acc = emp.getAccount();
			acc.setPassword(newPass);
			accoutService.save(acc);
			reAttributes.addAttribute("message", "");
			return "redirect:admin-information";
		}
	}
}
