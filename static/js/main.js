
function redraw() {

    let content = "<h2>API Test</h2><ul>";
    content += "<li><a href='/api/observations'>List of Observations</a></li>";
    content += "<li><a href='/api/users'>List of Users</a></li>";
    content += "<li><a href='/api/users/1'>Detail of one user</a></li>";
    content += "<li><a href='/api/observations/1'>Detail of one observation</a></li>";
    content += "</ul>";
    // update the page
    document.getElementById("target").innerHTML = content;
}







function fetchUsers (){
  console.log("call fetchUsers")
    axios.get('http://127.0.0.1:8010/api/users')
        .then(response => {
            const users = response.data;
            console.log(`GET list users`, users);
            let content ="<table class='table'>";
              content += "<thead>";
              content += " <tr>";
                content +=  "<th scope='col'>Id</th>";
                content += " <th scope='col'>First</th>";
                  content += "<th scope='col'>Last</th>";
                  content += "<th scope=col'>Handle</th>";
              content += " </tr>";
              content += "</thead>";
              content += "<tbody>";
              content +=  " <tr>";
                content += " <th scope='row'>1</th>";
                content += " <td>Mark</td>";
                content +=  "  <td>Otto</td>";
                content += "  <td>@mdo</td>";
              content += "  </tr>";
            content += "  </tbody>";
            content += "</table>";

            document.getElementById("target").innerHTML = content;

        })
        .catch(error => console.error(error));
};



window.onload = function() {
    redraw();
    fetchUsers();
};
