package com.example.case_study_module3.controller.account;

import com.example.case_study_module3.common.Email;
import com.example.case_study_module3.model.account.Account;
import com.example.case_study_module3.model.customer.Customer;
import com.example.case_study_module3.service.account.AccountService;
import com.example.case_study_module3.service.account.IAccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Random;

import static com.sun.org.apache.xalan.internal.xsltc.compiler.Constants.CHARACTERS;

@WebServlet(name = "AccountServlet", value = "/account")
public class AccountServlet extends HttpServlet {
    private static final IAccountService accountService = new AccountService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                showLoginForm(request, response);
                break;
            case "logout":
                logoutAccount(request, response);
                break;
            case "create":
                showCreateUserForm(request, response);
                break;
            case "userList":
                displayUserList(request, response);
                break;
            case "register":
                showRegisterForm(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "forgotPassword":
                showCheckUserNameForm(request, response);
                break;
            case "checkCode":
                showCheckCodeForm(request, response);
                break;
            default:
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
                requestDispatcher.forward(request, response);
        }
    }

    private void showCheckUserNameForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/check_code.jsp").forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");

        accountService.deleteUser(userName);
        RequestDispatcher requestDispatcher;

        request.setAttribute("msg", "Đã xoá tài khoản " + userName);
        requestDispatcher = request.getRequestDispatcher("/account?action=userList");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("/account/edit.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void displayUserList(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        RequestDispatcher requestDispatcher;
        if (!session.isNew()) {
            Account account = (Account) session.getAttribute("account");
            if (account.getRoleName().equals("admin")) {
                List<Account> accountList = accountService.getAllUser();
                if (accountList != null) {
                    request.setAttribute("accountList", accountList);
                } else {
                    request.setAttribute("msg", "Không có tài khoản nào ở trong danh sách");
                }
                requestDispatcher = request.getRequestDispatcher("/list_user.jsp");

            } else {
                request.setAttribute("msg", "Xin lỗi, bạn không có quyền vào mục này!");
                requestDispatcher = request.getRequestDispatcher("/error.jsp");
            }
        } else {
            requestDispatcher = request.getRequestDispatcher("/product-servlet");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreateUserForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("/create_user.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void logoutAccount(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        if (session != null) {
            session.invalidate();
        }
        try {
            response.sendRedirect("/product-servlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void showCheckCodeForm(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        Map<String, String> errMap = accountService.checkValidateUserName(userName);
        RequestDispatcher requestDispatcher;
        if (errMap.isEmpty()) {
            Account account = accountService.findByUserName(userName);
            if (account != null) {
                Customer customer = accountService.findCustomerByUserName(userName);
                if (customer != null) {
                    Random random = new Random();
                    StringBuilder code = new StringBuilder(4);
                    for (int i = 0; i < 4; i++) {
                        code.append(CHARACTERS.charAt(random.nextInt(CHARACTERS.length())));
                    }
                    Email.sendEmail(customer.getEmail(), System.currentTimeMillis() + "", String.valueOf(code));

                    request.setAttribute("code", String.valueOf(code));
                    request.setAttribute("userName", userName);
                    requestDispatcher = request.getRequestDispatcher("/change_password.jsp");
                } else {
                    request.setAttribute("userName", userName);
                    request.setAttribute("msg", "Tài khoản chưa đăng kí mail!");
                    requestDispatcher = request.getRequestDispatcher("/check_code.jsp");
                }
            } else {
                request.setAttribute("userName", userName);
                request.setAttribute("msg", "Tài khoản không tồn tại!");
                requestDispatcher = request.getRequestDispatcher("/check_code.jsp");

            }
        } else {
            request.setAttribute("userName", userName);
            request.setAttribute("errMap", errMap);
            requestDispatcher = request.getRequestDispatcher("/check_code.jsp");

        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                loginAccount(request, response);
                break;
            case "createUser":
                createUser(request, response);
                break;
            case "editUser":
                editPassword(request, response);
                break;
            case "checkForgotPassword":
                checkForgotPassword(request, response);
                break;
        }
    }



    private void checkForgotPassword(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        String code = request.getParameter("code");
        String inputCode = request.getParameter("inputCode");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        Map<String, String> errMap = accountService.checkValidateForgotPassword(password, confirmPassword);
        RequestDispatcher requestDispatcher;
        if (errMap.isEmpty()) {
            if (code.equals(inputCode) && password.equals(confirmPassword)) {
                accountService.forgotPassword(userName, password);
                request.setAttribute("mess", "Đã đổi mật khẩu thành công, hãy đăng nhập!");
                requestDispatcher = request.getRequestDispatcher("/login.jsp");
            } else {
                request.setAttribute("password", password);
                request.setAttribute("confirmPassword", confirmPassword);
                request.setAttribute("inputCode", inputCode);
                if (!code.equals(inputCode) || inputCode == null) {
                    request.setAttribute("mess", "Mã không chính xác!");
                }
                if (!password.equals(confirmPassword)) {
                    request.setAttribute("msg", "Mật khẩu không khớp");
                }
                request.setAttribute("userName", userName);
                request.setAttribute("code", code);
                request.setAttribute("userName", userName);
                requestDispatcher = request.getRequestDispatcher("/change_password.jsp");
            }
        } else {
            request.setAttribute("userName", userName);
            request.setAttribute("errMap", errMap);
            requestDispatcher = request.getRequestDispatcher("/change_password.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void editPassword(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        String oldPassword = request.getParameter("oldPassword");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        Map<String, String> errMap = accountService.checkValidatePassword(oldPassword, password, confirmPassword);
        if (errMap.isEmpty()) {
            errMap = accountService.editUser(userName, oldPassword, password, confirmPassword);
        }
        request.setAttribute("errMap", errMap);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        Map<String, String> errMap = accountService.checkValidateAccount(userName, password, confirmPassword);

        RequestDispatcher requestDispatcher;

        if (errMap.isEmpty()) {
            boolean rowUpdate;
            String msgSigin = "";
            if (!accountService.checkUserName(userName)) {
                if (password.equals(confirmPassword)) {
                    rowUpdate = accountService.addUser(new Account(userName, password, "user"));
                    if (rowUpdate) {
                        request.setAttribute("userName", userName);
                        requestDispatcher = request.getRequestDispatcher("/login.jsp");
                    } else {
                        msgSigin = "Đăng kí thất bại, vui lòng thử lại!";
                        requestDispatcher = request.getRequestDispatcher("/create.jsp");
                    }
                } else {
                    request.setAttribute("msg", "Mật khẩu không khớp,vui lòng nhập lại!");
                    requestDispatcher = request.getRequestDispatcher("/create.jsp");
                }

            } else {
                errMap.put("errUserName", "Tên tài khoản trùng lặp, vui lòng chọn tên khác!");
                request.setAttribute("errMap", errMap);
                requestDispatcher = request.getRequestDispatcher("/create_user.jsp");
            }
            request.setAttribute("userName", userName);
            request.setAttribute("password", password);
            request.setAttribute("confirmPassword", confirmPassword);
            request.setAttribute("msgErr", msgSigin);
        } else {
            request.setAttribute("userName", userName);
            request.setAttribute("password", password);
            request.setAttribute("confirmPassword", confirmPassword);
            request.setAttribute("errMap", errMap);
            requestDispatcher = request.getRequestDispatcher("/login.jsp");
        }

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void loginAccount(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        Map<String, String> errMap = accountService.checkValidateLogin(userName, password);

        if (errMap.isEmpty()) {
            Account account = accountService.login(userName, password);
            if (account != null) {
                HttpSession session = request.getSession();
                session.setAttribute("account", account);
                Cookie userNameCookie = new Cookie("userName", userName);
                Cookie passwordCookie = new Cookie("password", password);
                Cookie rememberMeCookie = new Cookie("rememberMe", rememberMe);
                if (rememberMe != null) {
                    userNameCookie.setMaxAge(60 * 60 * 24 * 30);
                    passwordCookie.setMaxAge(60 * 60 * 24 * 30);
                    rememberMeCookie.setMaxAge(60 * 60 * 24 * 30);
                }
                response.addCookie(userNameCookie);
                response.addCookie(passwordCookie);
                response.addCookie(rememberMeCookie);

                Customer customer = accountService.findCustomerByUserName(userName);
                if (customer != null && account.getRoleName().equals("admin")) {
                    request.setAttribute("userName", userName);
//                    request.setAttribute("msg", "Đăng nhập thành công");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin_home.jsp");
                    try {
                        requestDispatcher.forward(request, response);
                    } catch (ServletException e) {
                        throw new RuntimeException(e);
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                } else {
                    request.setAttribute("userName", userName);
//                    request.setAttribute("msg", "Đăng nhập thành công");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/user_home.jsp");
                    try {
                        requestDispatcher.forward(request, response);
                    } catch (ServletException e) {
                        throw new RuntimeException(e);
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                }
            } else {
                request.setAttribute("msg", "Sai mật khẩu hoặc tài khoản không tồn tại!");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
                try {
                    requestDispatcher.forward(request, response);
                } catch (ServletException e) {
                    throw new RuntimeException(e);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        } else {
            request.setAttribute("errMap", errMap);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/user_home.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }


}