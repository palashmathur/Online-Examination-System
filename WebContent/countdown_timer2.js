function showTimer() {
    in_time = document.getElementById("hidden").value;

    var time = in_time;

    timetry = localStorage.getItem("countdown");
    {
        if (timetry == null) {
            localStorage.setItem("countdown", time);
        }
        else {
            time = timetry;
        }
    }

    timer_div = document.getElementById("timer_div");
    timer_div.innerHTML = time;

    var my_timer = setInterval(function () {


        var min = 0, sec = 0;
        var time_up = false;

        t = time.split(":");


        min = parseInt(t[0]);
        sec = parseInt(t[1]);

        if (sec == 0) {
            if (min > 0) {
                sec = 59;
                min--;
            }

            else {
                time_up = true;
            }
        }
        else {
            sec--;
        }
        if (min < 10) {
            min = "0" + min;
        }
        if (sec < 10) {
            sec = "0" + sec;
        }
        time = min + ": " + sec;

        if (time_up) {
            time = "Time Up !"
            timer_div = document.getElementById("timer_div");
            timer_div.innerHTML = time;
        }
        else {
            timer_div = document.getElementById('timer_div');
            timer_div.innerHTML = time;
            localStorage.setItem("countdown", time);
        }

        if (time_up) {
            clearInterval(my_timer);
            localStorage.removeItem("countdown");
            
        }
    }, 1000);
}