# OrangeHRM - Manual Test Cases

This document contains 10 manual test cases for the main functionalities of OrangeHRM, including standard flows and edge cases.

## TC01: Login with valid credentials
**Objective:** Verify that a valid user can access the system.
**Steps:**
1. Navigate to the OrangeHRM login page.
2. Enter a valid username :Admin
3. Enter a valid password : admin123
4. Click the "Login" button.
**Expected Result:** The user is successfully redirected to the Dashboard.
**Status:** Passed ✅



## TC02: Login with invalid credentials (Negative)
**Objective:** Verify the error message when attempting to log in with incorrect data.
**Steps:**
1. Navigate to the login page.
2. Enter an invalid username or incorrect password.
3. Click "Login".
**Expected Result:** The system displays the message "Invalid credentials" and denies access.
**Status:** Passed ✅


## TC03: Login with excessively long password (Edge Case)
**Objective:** Verify how the system handles a password that exceeds standard limits.
**Steps:**
1. Navigate to the login page.
2. Enter a valid username : Admin
3. Enter a password with more than 18 characters: 1251521251254445
4. Click "Login".
**Expected Result:** The system should not crash. It should either truncate the input or display a validation error message.
**Status:** Passed ✅


## TC04: Add a new employee with valid data (PIM)
**Objective:** Verify that it is possible to register a new employee.
**Steps:**
1. Navigate to the "PIM" module.
2. Click on "Add Employee".
3. Fill in the "First Name" and "Last Name".
4. Click "Save".
**Expected Result:** The employee is successfully saved, and their personal details page is displayed.
**Status:** Passed ✅


## TC05: Add employee with empty mandatory fields (Edge Case)
**Objective:** Verify that the system prevents saving an employee without a First Name or Last Name.
**Steps:**
1. Navigate to the "PIM" module -> "Add Employee".
2. Leave "First Name" and "Last Name" completely blank.
3. Click "Save".
**Expected Result:** The system highlights the mandatory fields in red with a "Required" error message and prevents saving.
**Status:** Failed ❌ (See BUG-001)



## TC06: Search for an employee by partial name
**Objective:** Verify if the search function works with partial names.
**Steps:**
1. Navigate to "PIM" -> "Employee List".
2. Enter only the first 3 letters of an existing employee's name.
3. Click "Search".
**Expected Result:** The table displays all employees whose names match the partial input.
**Status:** Passed ✅




## TC07: Apply for leave in the past (Edge Case)
**Objective:** Verify if the system allows or correctly blocks a leave request for dates that have already passed.
**Steps:**
1. Navigate to "Leave" -> "Apply".
2. Select any "Leave Type".
3. Set the "From Date" and "To Date" to a month ago.
4. Click "Apply".
**Expected Result:** The system should display a clear message like "Invalid date" or "Cannot apply for leave in the past".
**Actual Result:** The system blocks the submission but displays an unrelated error message: "No Working Days Selected".
**Status:** Failed ❌ (See BUG-002)
Severity: Low 



## TC08: Approve a leave request (Admin/Supervisor)
**Objective:** Verify that a supervisor can approve a leave request.
**Steps:**
1. Log in as an Admin or Supervisor.
2. Navigate to "Leave" -> "Leave List".
3. Find a pending request and select "Approve".
4. Save the action.
**Expected Result:** The leave status changes to "Approved" or "Scheduled".
**Status:** Blocked ⚠️ (Test data unavailable: No pending leave requests from other employees to approve).


## TC09: Punch In without adding a note
**Objective:** Verify that an employee can record their start time without mandatory notes.
**Steps:**
1. Navigate to "Time" -> "Attendance" -> "Punch In/Out".
2. Leave the note field blank.
3. Click "In".
**Expected Result:** The system successfully records the punch-in time and displays a "Successfully Saved" toast message.
**Status:** Passed ✅.

## TC10: Upload an unsupported file format as profile picture (Edge Case)
**Objective:** Verify validation when uploading a non-image file as a profile picture.
**Steps:**
1. Navigate to "My Info".
2. Click on the profile picture to change it.
3. Attempt to upload a `.pdf` or `.txt` file.
4. Click "Save".
**Expected Result:** The system rejects the file and displays a "File type not allowed" error message.
**Status:** Passed ✅