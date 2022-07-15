<?php

namespace App\Http\Controllers;

use App\Http\Requests\Company\ContactRequest;
use App\Http\Requests\Company\CompanyRequest as ModelRequest;
use App\Http\Requests\Company\CompanyUpdateRequest as ModelRequestUpdate;
use App\Http\Requests\Company\UserRequest;
use App\Http\Requests\Company\UserUpdateRequest;
use App\Http\Requests\Company\StoreRequest;
use App\Models\Branch;
use App\Models\Company;
use App\Models\CompanyContact;
use App\Models\Device;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Response;

class CompanyController extends Controller
{
    public function validateCompany(ModelRequest $request)
    {
        return ["status" => true, "company_payload" => $request->validated()];
    }

    public function validateContact(ContactRequest $request)
    {
        return ["status" => true, "contact_payload" => $request->validated()];
    }

    public function validateCompanyUser(UserRequest $request)
    {
        return ["status" => true, "user_payload" => $request->validated()];
    }

    public function validateCompanyUserUpdate(UserUpdateRequest $request)
    {
        return ["status" => true];
    }

    public function list(Company $Company)
    {
        return $Company->select('id','name')->get();
    }
    public function index(Company $model, Request $request)
    {
        return $model->with(['user', 'contact','modules'])->paginate($request->per_page);
    }
    public function show($id): JsonResponse
    {
        $record = Company::with(['user', 'contact', 'branches','modules'])->where('id', $id)->first();

        return Response::json([
            'record' => $record,
            'status' => true,
            'message' => null,
        ], 200);
    }

    public function store(StoreRequest $request)
    {
        $data = $request->validated();

        $user = [
            "name" => $data['name'],
            "password" => Hash::make($data['password']),
            "email" => $data['email'],
            "is_master" => 1
        ];

        $company = [
            "name" => $data['company_name'],
            "location" => $data['location'],
            "member_from" => $data['member_from'],
            "expiry" => $data['expiry'],
            "max_employee" => $data['max_employee'],
            "max_devices" => $data['max_devices'],
        ];

        if (isset($request->logo)) {
            $company['logo'] = saveFile($request, 'media/company/logo', 'logo', $request->company_name, 'logo');
        }

        $contact = [
            "name" => $data['contact_name'],
            "number" => $data['number'],
            "position" => $data['position'],
            "whatsapp" => $data['whatsapp']
        ];

        DB::beginTransaction();

        try {
            $role = Role::firstOrCreate(['name' => 'company']);

            if (!$role) {
                return $this->response('Role cannot add.',null, false);
            }

            $user["role_id"] = $role->id;

            $user = User::create($user);

            if (!$user) {
                return $this->response('User cannot add.',null, false);
            }

            $company["user_id"] = $user->id;

            $company = Company::create($company);

            if (!$company) {
                return $this->response('Company cannot add.',null, false);
            }

            $contact['company_id'] = $company->id;

            $contact = CompanyContact::create($contact);

            if (!$contact) {
                return $this->response('Contact cannot add.',null, false);
            }

            $company->logo = asset('media/company/logo' . $company->logo);

            DB::commit();

            return $this->response('Company Successfully created.',Company::with(['user', 'contact'])->find($company->id), true);

        } catch (\Throwable $th) {
            DB::rollBack();
            throw $th;
        }

    }

    public function destroy($id)
    {
        $record = Company::find($id);
        $user = User::find($record->user_id);
        $contact = CompanyContact::where('company_id', $id);
        if ($contact->delete()) {
            $record->delete();
            $user->delete();
            return Response::noContent(204);
        } else {
            return Response::json(['message' => 'No such record found.'], 404);
        }

    }

    public function search(Company $model, Request $request, $key)
    {
        $model = $this->FilterCompanyList($model, $request, class_basename($model));

        $fields = [
            'name',
            'location',
            'contact' => ['name','number','position','whatsapp'],
            'user'    => ['name','email']
        ];

        $model = $this->process_search($model, $key, $fields);

        $model->with('contact');

        $model->orderByDesc('id');

        return $model->paginate($request->per_page);
    }

    public function branches(Request $request, $id)
    {
        return Branch::where('company_id', $id)->with(['user', 'contact'])->orderByDesc('id')->paginate($request->perPage);
    }

    public function devices(Request $request, $id)
    {
        return Device::where('company_id', $id)->with(['status'])->orderByDesc('id')->paginate($request->perPage);
    }

    public function updateCompany(ModelRequest $request, $id)
    {
        $data = $request->validated();

        if (isset($request->logo)) {
            $data['logo'] = saveFile($request, 'media/company/logo', 'logo', $request->name, 'logo');
        }

        $company = Company::find($id)->update($data);

        if (!$company) {
            return $this->response('Company cannot updated.',null, false);
        }

        return $this->response('Company successfully updated.',$company, true);

    }

    public function updateContact(ContactRequest $request, $id)
    {
        $contact = CompanyContact::where('company_id', $id)->update($request->validated());

        if (!$contact) {
            return $this->response('Contact cannot updated.',null, false);
        }

        return $this->response('Contact successfully updated.',$contact, true);
    }

    public function updateCompanyUser(UserUpdateRequest $request, $id)
    {
        $data = $request->validated();

        $arr = [
            "name" => $data["name"],
            "email" => $data["email"],
        ];

        if (isset($request->password)) {
            $arr['password'] = Hash::make($data["password"]);
        }
        $record = User::find(Company::find($id)->user_id)->update($arr);

        if (!$record) {
            return $this->response('User cannot update.',null, false);
        }

        return $this->response('User successfully updated.',$record, true);
    }
}
