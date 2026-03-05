<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Validator;

class DashboardController extends Controller
{
    private $baseUrl = 'https://api.restful-api.dev/collections/products';
    private $apiKey = 'e0aa92f2-1bfe-4826-b352-c4a835e4a282';


    public function index(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'search' => 'nullable',
            ],
            [],
            [
                'search' => 'Pencarian',
            ]
        );
        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator->errors())
                ->withInput()
                ->with('error', $validator->errors()->first());
        }

        // Panggil API
        $response = Http::withHeaders([
            'x-api-key' => $this->apiKey,
        ])->get($this->baseUrl . '/objects');

        // Cek apakah request berhasil
        if ($response->successful()) {
            $data = $response->json();

            // Filter berdasarkan search parameter
            if ($request->filled('search')) {
                $search = strtolower($request->input('search'));
                $data = array_filter($data, function ($item) use ($search) {
                    return strpos(strtolower($item['name'] ?? ''), $search) !== false ||
                        strpos(strtolower($item['data']['color'] ?? ''), $search) !== false;
                });
                $data = array_values($data); // Re-index array
            }
            return view('admin.products.index', ['data' => $data]);
        }

        // Tangani jika API error
        abort(500, 'Failed to fetch data from API');
    }

    public function create()
    {
        $years = range(date('Y'), date('Y') - 20);
        return view('admin.products.create', ['years' => $years]);
    }

    public function store(Request $request)
    {
        Validator::make(
            $request->all(),
            [
                'name' => 'required|max:50',
                'year' => 'required|integer',
                'price' => 'required|numeric',
                'cpu_model' => 'required|max:50',
                'hardisk_size' => 'required|integer',

            ],
        )->validate();

        // Hit to api
        $body = [
            'name' => $request->name,
            'data' => [
                'year' => $request->year,
                'price' => $request->price,
                'CPU model' => $request->cpu_model,
                'Hard disk size' => $request->hardisk_size,
            ],
        ];
        $response = Http::withHeaders([
            'x-api-key' => $this->apiKey,
        ])->post($this->baseUrl . '/objects', $body);

        if (!$response->successful()) {
            return redirect()->back()
                ->withInput()
                ->with('error', 'Failed to create product');
        }

        return redirect()
            ->route('admin.dashboard')
            ->with('success', 'Product successfully created');
    }

    public function edit($id)
    {
        $response = Http::withHeaders([
            'x-api-key' => $this->apiKey,
        ])->get($this->baseUrl . '/objects/' . $id);

        if (!$response->successful()) {
            abort(404, 'Product not found');
        }
        $data = $response->json();
        $years = range(date('Y'), date('Y') - 20);
        return view('admin.products.edit', ['data' => $data, 'years' => $years]);
    }

    public function update(Request $request, $id)
    {
        Validator::make(
            $request->all(),
            [
                'name' => 'required|max:50',
                'year' => 'required|integer',
                'price' => 'required|numeric',
                'cpu_model' => 'required|max:50',
                'hardisk_size' => 'required|integer',

            ],
        )->validate();

        // Hit to api
        $body = [
            'name' => $request->name,
            'data' => [
                'year' => $request->year,
                'price' => $request->price,
                'CPU model' => $request->cpu_model,
                'Hard disk size' => $request->hardisk_size,
            ],
        ];
        $response = Http::withHeaders([
            'x-api-key' => $this->apiKey,
        ])->put($this->baseUrl . '/objects/' . $id, $body);

        if (!$response->successful()) {
            return redirect()->back()
                ->withInput()
                ->with('error', 'Failed to update product');
        }

        return redirect()
            ->route('admin.dashboard')
            ->with('success', 'Product successfully updated');
    }

    public function destroy($id)
    {

        $response = Http::withHeaders([
            'x-api-key' => $this->apiKey,
        ])->delete($this->baseUrl . '/objects/' . $id);

        if (!$response->successful()) {
            return redirect()->back()
                ->with('error', 'Failed to delete product');
        }
        return redirect()
            ->route('admin.dashboard')
            ->with('success', 'Product successfully deleted');
    }
}
