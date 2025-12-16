<!DOCTYPE html>
<html>
<head>
    <title>User Messages</title>
</head>
<body>

<h2>Stored Messages</h2>

@foreach($messages as $msg)
    <p>
        <strong>{{ $msg->username }}</strong><br>
        {{ $msg->message }}<br>
        <small>{{ $msg->created_at }}</small>
    </p>
    <hr>
@endforeach

</body>
</html>
