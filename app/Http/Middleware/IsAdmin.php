<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class IsAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(Auth::user() && (in_array(Auth::user()->role, ['ADMIN', 'MANAGER'])))
            return $next($request);
        return response('Unauthorized. <a href="javascript:history.back()">Go Back</a>', 401);
    }
}
