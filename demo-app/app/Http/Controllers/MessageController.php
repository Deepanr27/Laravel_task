<?php

namespace App\Http\Controllers;

use App\Models\Message;
use Illuminate\Http\Request;

class MessageController extends Controller
{
    // API: store message
    public function store(Request $request)
    {
        $request->validate([
            'username' => 'required',
            'message'  => 'required',
        ]);

        return Message::create([
            'username' => $request->username,
            'message'  => $request->message,
        ]);
    }

    // API: get messages
    public function index()
    {
        return Message::latest()->get();
    }

    // Web page
    public function showMessages()
    {
        $messages = Message::latest()->get();
        return view('messages', compact('messages'));
    }
}


