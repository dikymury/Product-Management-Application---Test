<?php

namespace App\View\Components;

use Illuminate\View\Component;
use App\Models\Schools; // Import your School model

class MenuAdmin extends Component
{
    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.admin.menu');
    }
}
