<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;


use \App\Http\Controllers\AuthController;
use \App\Http\Controllers\UserController;

use App\Http\Controllers\PermissionController;
use App\Http\Controllers\AssignPermissionController;
use App\Http\Controllers\ModuleController;
use App\Http\Controllers\AssignModuleController;
use App\Http\Controllers\RoleController;

use \App\Http\Controllers\DepartmentController;
use \App\Http\Controllers\DesignationController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\BranchController;
use App\Http\Controllers\DeviceController;
use App\Http\Controllers\DeviceStatusController;
use App\Http\Controllers\AttendanceLogController;

use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\AllowanceController;
use App\Http\Controllers\BankInfoController;
use App\Http\Controllers\CommissionController;
use App\Http\Controllers\DeductionController;
use App\Http\Controllers\DocumentInfoController;
use App\Http\Controllers\OvertimeController;
use App\Http\Controllers\PersonalInfoController;
use App\Http\Controllers\SalaryController;
use App\Http\Controllers\SalaryTypeController;

use App\Http\Controllers\ScheduleController;

use App\Http\Controllers\CountController;
use App\Http\Controllers\DutyOrganizerController;

Route::get('/test', function (Request $request) {
    // code here
});

// Auth
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('/login', [AuthController::class, 'login']);
Route::get('/me', [AuthController::class, 'me'])->middleware('auth:sanctum');
Route::get('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');

// Assign Permission
Route::post('assign-permission/delete/selected', [AssignPermissionController::class, 'dsr']);
Route::get('assign-permission/search/{key}', [AssignPermissionController::class, 'search']); // search records
Route::get('assign-permission/nars', [AssignPermissionController::class, 'notAssignedRoleIds']);
Route::resource('assign-permission', AssignPermissionController::class);

// User
Route::apiResource('users', UserController::class);
Route::get('users/search/{key}', [UserController::class, 'search']);
Route::post('users/delete/selected', [UserController::class, 'deleteSelected']);

// Department
Route::apiResource('departments', DepartmentController::class);
Route::get('departments/search/{key}', [DepartmentController::class, 'search']);
Route::post('departments/delete/selected', [DepartmentController::class, 'deleteSelected']);

// Schedule
Route::apiResource('schedule', ScheduleController::class);
Route::get('schedule/search/{key}', [ScheduleController::class, 'search']);
Route::post('schedule/delete/selected', [ScheduleController::class, 'deleteSelected']);

// Designation
Route::apiResource('designation', DesignationController::class);
Route::get('designations-by-department', [DesignationController::class, 'designations_by_department']);
Route::get('designation/search/{key}', [DesignationController::class, 'search']);
Route::post('designation/delete/selected', [DesignationController::class, 'deleteSelected']);

//  Company
Route::get('company/list', [CompanyController::class, 'list']);

Route::apiResource('company', CompanyController::class)->except('update');
Route::post('company/{id}/update', [CompanyController::class, 'updateCompany']);
Route::post('company/{id}/update/contact', [CompanyController::class, 'updateContact']);
Route::post('company/{id}/update/user', [CompanyController::class, 'updateCompanyUser']);
Route::post('company/validate', [CompanyController::class, 'validateCompany']);
Route::post('company/contact/validate', [CompanyController::class, 'validateContact']);
Route::post('company/user/validate', [CompanyController::class, 'validateCompanyUser']);
Route::post('company/update/user/validate', [CompanyController::class, 'validateCompanyUserUpdate']);
Route::get('company/search/{key}', [CompanyController::class, 'search']);
Route::get('company/{id}/branches', [CompanyController::class, 'branches']);
Route::get('company/{id}/devices', [CompanyController::class, 'devices']);

//  Permission
Route::apiResource('permission', PermissionController::class);
Route::get('user/{id}/permission', [PermissionController::class, 'permissions']);
Route::get('permission/search/{key}', [PermissionController::class, 'search']);
Route::post('permission/delete/selected', [PermissionController::class, 'deleteSelected']);

// Role
Route::apiResource('role', RoleController::class);
Route::get('user/{id}/role', [RoleController::class, 'roles']);
Route::get('role/search/{key}', [RoleController::class, 'search']);
Route::get('role/permissions/search/{key}', [RoleController::class, 'searchWithRelation']);
Route::get('role/{id}/permissions', [RoleController::class, 'getPermission']);
Route::post('role/{id}/permissions', [RoleController::class, 'assignPermission']);
Route::post('role/delete/selected', [RoleController::class, 'deleteSelected']);
// Branch
Route::apiResource('branch', BranchController::class)->except('update');
Route::post('branch/{id}/update', [BranchController::class, 'update']);
Route::post('branch/{id}/update/contact', [BranchController::class, 'updateContact']);
Route::post('branch/{id}/update/user', [BranchController::class, 'updateBranchUserUpdate']);
Route::post('branch/validate', [BranchController::class, 'validateBranch']);
Route::post('branch/contact/validate', [BranchController::class, 'validateContact']);
Route::post('branch/user/validate', [BranchController::class, 'validateBranchUser']);
Route::post('branch/update/user/validate', [BranchController::class, 'validateBranchUserUpdate']);
Route::get('branch/search/{key}', [BranchController::class, 'search']);

// Device
Route::apiResource('device', DeviceController::class);
Route::get('device/search/{key}', [DeviceController::class, 'search']);
Route::post('device/delete/selected', [DeviceController::class, 'deleteSelected']);

//  Device Status
Route::apiResource('device_status', DeviceStatusController::class);
Route::get('device_status/search/{key}', [DeviceStatusController::class, 'search']);
Route::post('device_status/delete/selected', [DeviceStatusController::class, 'deleteSelected']);

// Module
Route::apiResource('module', ModuleController::class);
Route::get('module/search/{key}', [ModuleController::class, 'search']);
Route::post('module/delete/selected', [ModuleController::class, 'deleteSelected']);

// Assign Permission
Route::post('assign-module/delete/selected', [AssignModuleController::class, 'dsr']);
Route::get('assign-module/search/{key}', [AssignModuleController::class, 'search']);
Route::get('assign-module/nacs', [AssignModuleController::class, 'notAssignedCompanyIds']);
Route::resource('assign-module', AssignModuleController::class);

// AttendanceLogs
Route::get('attendance_logs/{id}/search/{key}', [AttendanceLogController::class, 'AttendanceLogsSearch']);
Route::get('attendance_logs/{key}', [AttendanceLogController::class, 'AttendanceLogs']);
Route::apiResource('attendance_logs', AttendanceLogController::class);



// -----------------------Company App-------------------------------

// Company Auth
Route::post('/CompanyLogin', [AuthController::class, 'CompanyLogin']);

Route::post('no-shift-employees/delete/selected', [DutyOrganizerController::class, 'deleteSelected']);
Route::apiResource('no-shift-employees', DutyOrganizerController::class);

//  Employee
Route::apiResource('employee', EmployeeController::class);
Route::get('employeesByDepartment', [EmployeeController::class, 'employeesByDepartment']);
Route::get('employeesByDesignation/{key}', [EmployeeController::class, 'employeesByDesignation']);
Route::get('designationsByDepartment/{key}', [EmployeeController::class, 'designationsByDepartment']);

Route::post('employee/validate', [EmployeeController::class, 'validateEmployee']);
Route::post('employee/contact/validate', [EmployeeController::class, 'validateContact']);
Route::post('employee/other/validate', [EmployeeController::class, 'validateOther']);
Route::post('employee/{id}/update', [EmployeeController::class, 'updateEmployee']);
Route::post('employee/{id}/update/contact', [EmployeeController::class, 'updateContact']);
Route::post('employee/{id}/update/other', [EmployeeController::class, 'updateOther']);
Route::get('employee/search/{key}', [EmployeeController::class, 'search']);
Route::post('employee/import', [EmployeeController::class, 'import']);
Route::resource('personalinfo', PersonalInfoController::class);
Route::resource('bankinfo', BankInfoController::class);
Route::resource('documentinfo', DocumentInfoController::class);

// Salary Type
Route::apiResource('salary_type', SalaryTypeController::class);
Route::get('salary_type/search/{key}', [SalaryTypeController::class, 'search']);
Route::post('salary_type/delete/selected', [SalaryTypeController::class, 'deleteSelected']);

// Salary
Route::apiResource('salary', SalaryController::class);

// Deduction
Route::apiResource('deduction', DeductionController::class);

// Overtime
Route::apiResource('overtime', OvertimeController::class);

// Allowance
Route::apiResource('allowance', AllowanceController::class);

// Commission
Route::apiResource('commission', CommissionController::class);

Route::get('/count', CountController ::class);
