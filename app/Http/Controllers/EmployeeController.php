<?php

namespace App\Http\Controllers;

use App\Http\Requests\Employee\EmployeeContactRequest;
use App\Http\Requests\Employee\EmployeeImportRequest;
use App\Http\Requests\Employee\EmployeeOtherRequest;
use App\Http\Requests\Employee\EmployeeRequest;
use App\Http\Requests\Employee\EmployeeUpdateRequest;
use App\Models\Employee;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;

class EmployeeController extends Controller
{
    public function validateEmployee(EmployeeRequest $request)
    {
        return ['status' => true];
    }

    public function validateContact(EmployeeContactRequest $request)
    {
        return ['status' => true];
    }

    public function validateOther(EmployeeOtherRequest $request)
    {
        return ['status' => true];
    }

    public function store(Request $request)
    {

        try {
            $record = User::create([
                'name' => $request->user_name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
            ]);

            $arr = [
                'first_name' => $request->first_name,
                'last_name' => $request->last_name,

                'phone_number' => $request->phone_number,
                'whatsapp_number' => $request->whatsapp_number,
                'phone_relative_number' => $request->phone_relative_number,
                'whatsapp_relative_number' => $request->whatsapp_relative_number,

                'employee_id' => $request->employee_id,
                'joining_date' => $request->joining_date,
                'department_id' => $request->department_id,
                'designation_id' => $request->designation_id,

                'user_id' => $record->id,
            ];

            if ($request->hasFile('profile_picture')) {
                $profile_picture = $request->profile_picture->getClientOriginalName();
                $request->profile_picture->move(public_path('media/employee/profile_picture/'), $profile_picture);
                $product_image = url('media/employee/profile_picture/' . $profile_picture);
                $arr['profile_picture'] = $profile_picture;
            }

            if (isset($request->company_id)) {
                $arr['company_id'] = $request->company_id;
            }

            $employee = Employee::create($arr);

            $employee->profile_picture = asset('media/employee/profile_picture' . $employee->profile_picture);

            return Response::json([
                'record' => Employee::with(['user', 'designation', 'department'])->find($employee->id),
                'message' => 'Company Employee created.',
                'status' => true,
            ], 200);

        } catch (\Throwable$th) {
            throw $th;
        }

    }

    public function index(Request $request)
    {
        return Employee::with(['user', 'designation', 'department'])->orderByDesc('id')->paginate($request->per_page);
    }

    public function show($id): JsonResponse
    {
        $record = Employee::with(['user', 'designation', 'department'])->where('id', $id)->first();
        return Response::json([
            'record' => $record,
            'status' => true,
            'message' => null,
        ], 200);
    }

    public function update(ModelRequestUpdate $request, $id): JsonResponse
    {
        $data = $request->except(['contact_name', 'contact_no', 'contact_position', 'contact_whatsapp', 'user_name', 'email', 'password_confirmation', 'password']);
        if (isset($request->password)) {
            $data['password'] = Hash::make($request->password);
        }
        if (isset($request->logo)) {
            $data['logo'] = saveFile($request, 'media/company/logo', 'logo', $request->name, 'logo');
        }

        DB::beginTransaction();

        try {
            $record = Company::find($id);
            $record->update($data);

            $company = $request->setContactFields();
            CompanyContact::where('company_id', $record->id)->update($company);
            $user = $request->setUserFields();
            if (@$request->password) {
                $user['password'] = Hash::make($request->password);
            }
            User::find($record->user_id)->update($user);
            DB::commit();

        } catch (\Throwable$th) {
            DB::rollBack();
            throw $th;
        }
        return Response::json([
            'record' => Company::with(['contact'])->find($id),
            'message' => 'Company Successfully updated.',
            'status' => true,
        ], 200);
    }

    public function destroy($id)
    {
        $record = Employee::find($id);
        $user = User::find($record->user_id);
        if ($record->delete()) {
            $user->delete();
            return Response::noContent(204);
        } else {
            return Response::json(['message' => 'No such record found.'], 404);
        }

    }

    public function search(Request $request, $key)
    {
        $model = Employee::query();

        $model
            ->where('id', 'LIKE', "%$key%")
            ->orWhere('first_name', 'LIKE', "%$key%")
            ->orWhere('last_name', 'LIKE', "%$key%")
            ->orWhere('phone_number', 'LIKE', "%$key%")

            ->orWhere('whatsapp_number', 'LIKE', "%$key%")
            ->orWhere('phone_relative_number', 'LIKE', "%$key%")
            ->orWhere('whatsapp_relative_number', 'LIKE', "%$key%")
            ->orWhere('employee_id', 'LIKE', "%$key%")
            ->orWhere('joining_date', 'LIKE', "%$key%")
            ->orWhere('joining_date', 'LIKE', "%$key%")
            ->orWhere('joining_date', 'LIKE', "%$key%")

            ->orWhereHas('department', function ($query) use ($key) {
                $query->where('name', 'like', '%' . $key . '%');
            })

            ->orWhereHas('designation', function ($query) use ($key) {
                $query->where('name', 'like', '%' . $key . '%');
            })

            ->orWhereHas('user', function ($query) use ($key) {
                $query->where('name', 'like', '%' . $key . '%');
                $query->orWhere('email', 'like', '%' . $key . '%');
            });

        return $model->with(['user', 'department', 'designation'])->orderBy('id', 'desc')->paginate($request->perPage);
    }

    public function updateEmployee(EmployeeUpdateRequest $request, $id): JsonResponse
    {
        $data = $request->except(['user_name', 'email', 'password', 'password_confirmation']);
        $employee = Employee::find($id);

        $user_arr = [
            'name' => $request->user_name,
            'email' => $request->email,
        ];

        if (isset($request->password)) {
            $user_arr['password'] = Hash::make($request->password);
        }

        $user = User::where('id', $employee->user_id)->update($user_arr);

        // if (isset($request->profile_picture)) {
        //     $arr['profile_picture'] = saveFile($request, 'media/employee/profile_picture', 'profile_picture', $request->name, 'profile_picture');
        // }

        if ($request->hasFile('profile_picture')) {
            $profile_picture = $request->profile_picture->getClientOriginalName();
            $request->profile_picture->move(public_path('media/employee/profile_picture/'), $profile_picture);
            $product_image = url('media/employee/profile_picture/' . $profile_picture);
            $data['profile_picture'] = $profile_picture;
        }

        $employee->update($data);
        return Response::json([
            'record' => $employee,
            'message' => 'Employee Successfully Updated.',
            'status' => true,
        ], 200);

    }

    public function updateContact(Employee $model, Request $request, $id): JsonResponse
    {
        $model->whereId($id)->update($request->all());
        return Response::json([
            'record' => $model,
            'message' => 'Contact successfully Updated.',
            'status' => true,
        ], 200);
    }

    public function updateOther(Employee $model, EmployeeOtherRequest $request, $id): JsonResponse
    {
        $model->whereId($id)->update($request->all());
        return Response::json([
            'record' => $model,
            'message' => 'Other details successfully Updated.',
            'status' => true,
        ], 200);
    }

    public function import(EmployeeImportRequest $request)
    {

        $file = $request->file('employees');
        $data = $this->saveFile($file);


        if (is_array($data) && !$data["status"]) {
            return ["status" => false, "errors" => $data["errors"]];
        }

        $data = $this->csvParser($data);

        if (array_key_exists("status", $data)) {
            return ["status" => false, "errors" => $data["errors"]];
        }   

        $success = false;

        try {

            foreach ($data as $data) {

                $validator = $this->validateImportData($data);

                if ($validator->fails()) {
                    return [
                        "status" => false,
                        "errors" => $validator->errors()->all(),
                    ];
                }

                $iteration = [
                    'name' => $data['user_name'],
                    'email' => $data['email'],
                    'password' => Hash::make('secret'),
                ];

                $record = User::create($iteration);

                $arr = [
                    'first_name' => $data['first_name'],
                    'last_name' => $data['last_name'],

                    'phone_number' => $data['phone_number'],
                    'whatsapp_number' => $data['whatsapp_number'],
                    'phone_relative_number' => $data['phone_relative_number'],
                    'whatsapp_relative_number' => $data['whatsapp_relative_number'],

                    'employee_id' => $data['employee_id'],
                    'joining_date' => $data['joining_date'],
                    'department_id' => $data['department_code'],
                    'designation_id' => $data['designation_code'],

                    'user_id' => $record->id,
                    'company_id' => $request->company_id,
                ];

                $employee = Employee::create($arr);

                $success = $employee ? true : false;

            }

        } catch (\Throwable $th) {
            throw $th;
        }

        if ($success) {

            return response()->json([
                'message' => 'Employee imported successfully.',
                'status' => true,
            ], 200);
        }

        return response()->json([
            'message' => 'Employee cannot import.',
            'status' => true,
        ], 200);

        // return $this->validateImportData($data);
    }

    public function validateImportData($data)
    {
        return Validator::make($data, [
            'first_name' => ['required', 'min:3', 'max:100'],
            'last_name' => ['required', 'min:3', 'max:100'],
            'user_name' => 'required|min:3|max:100',
            'email' => 'required|min:3|max:191|unique:users',
            'phone_number' => ['required', 'min:8', 'max:15'],
            'whatsapp_number' => ['required', 'min:8', 'max:15'],
            'employee_id' => ['required'],
            'joining_date' => ['required', 'date'],
            'department_code' => ['required'],
            'designation_code' => ['required'],
        ]);
    }

    public function saveFile($file)
    {
        $filename = $file->getClientOriginalName();
        if ($filename != "employees.csv") {
            return [
                "status" => false,
                "errors" => ["wrong file " . $filename . " (valid file is employees.csv)"],
            ];
        }

        $extension = $file->getClientOriginalExtension();
        $tempPath = $file->getRealPath();
        $fileSize = $file->getSize();
        $location = 'media/employee/imports';
        $file->move($location, $filename);
        return public_path($location . "/" . $filename);
    }

    public function csvParser($filepath)
    {
        $columns = ["employee_id", "first_name", "last_name", "user_name", "email", "phone_number", "whatsapp_number", "phone_relative_number", "whatsapp_relative_number", "joining_date", "department_code", "designation_code"];

        $header = null;
        $data = [];

        if (($filedata = fopen($filepath, "r")) !== false) {
            while (($row = fgetcsv($filedata, 1000, ',')) !== false) {

                if (!$header) {
                    $header = $row;

                    if ($header != $columns) {
                        return [
                            "status" => false,
                            "errors" => ["header mismatch"],
                        ];
                    }

                } else {
                    if (count($header) != count($row)) {
                        return [
                            "status" => false,
                            "errors" => ["column mismatch"],

                        ];
                    }

                    $data[] = array_combine($header, $row);
                }

            }
            fclose($filedata);
        }

        if (count($data) == 0) {
            return [
                "status" => false,
                "errors" => "file is empty",
            ];
        }

        return $data;
    }
}
