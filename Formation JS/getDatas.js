function getDatas() {
  var leagueSelect = document.getElementById("league-select");
  var selectedLeagueId = leagueSelect.value;

  var requestOptions = {
      method: 'GET',
      redirect: 'follow'
  };

  fetch("proxy.php?leagueId=" + selectedLeagueId, requestOptions)
      .then(response => response.json())
      .then(data => {
          var table = data[0]['data']['table']['all'];
          var tableHtml = "";
          var listHtml = "";
          var legends = data[0]['data']['legend'];

          table.forEach(team => {
              tableHtml += createTableRowHTML(team);
              listHtml += createListHTML(team);
          });

          if (selectedLeagueId != "" || selectedLeagueId != null || selectedLeagueId != 0) {
              document.getElementById("home").classList.remove("selected");
              document.getElementById("all").classList.add("selected");
              document.getElementById("away").classList.remove("selected");
              document.getElementById("five-last").classList.remove("selected");
          }

          document.querySelector("#legends").innerHTML = createLegendsHTML(legends);

          document.querySelector("#table").innerHTML = tableHtml;
          document.querySelector("#list").innerHTML = listHtml; // Ajout de cette ligne

          document.getElementById("all").addEventListener("click", function() {
              var table = data[0]['data']['table']['all'];
              var tableHtml = "";
              var listHtml = "";

              table.forEach(team => {
                  tableHtml += createTableRowHTML(team);
                  listHtml += createListHTML(team);
              });

              document.getElementById("home").classList.remove("selected");
              document.getElementById("all").classList.add("selected");
              document.getElementById("away").classList.remove("selected");
              document.getElementById("five-last").classList.remove("selected");

              document.querySelector("#table").innerHTML = tableHtml;
              document.querySelector("#list").innerHTML = listHtml;
          });

          document.getElementById("home").addEventListener("click", function() {
              var table = data[0]['data']['table']['home'];
              var tableHtml = "";
              var listHtml = "";

              table.forEach(team => {
                  tableHtml += createTableRowHTML(team);
                  listHtml += createListHTML(team);
              });

              document.getElementById("home").classList.add("selected");
              document.getElementById("all").classList.remove("selected");
              document.getElementById("away").classList.remove("selected");
              document.getElementById("five-last").classList.remove("selected");

              document.querySelector("#table").innerHTML = tableHtml;
              document.querySelector("#list").innerHTML = listHtml;
          });

          document.getElementById("away").addEventListener("click", function() {
              var table = data[0]['data']['table']['away'];
              var tableHtml = "";
              var listHtml = "";

              table.forEach(team => {
                  tableHtml += createTableRowHTML(team);
                  listHtml += createListHTML(team);
              });

              document.getElementById("home").classList.remove("selected");
              document.getElementById("all").classList.remove("selected");
              document.getElementById("away").classList.add("selected");
              document.getElementById("five-last").classList.remove("selected");

              document.querySelector("#table").innerHTML = tableHtml;
              document.querySelector("#list").innerHTML = listHtml;
          });

          document.getElementById("five-last").addEventListener("click", function() {
              var table = data[0]['data']['table']['form'];
              var tableHtml = "";
              var listHtml = "";

              table.forEach(team => {
                  tableHtml += createTableRowHTML(team);
                  listHtml += createListHTML(team);
              });

              document.getElementById("home").classList.remove("selected");
              document.getElementById("all").classList.remove("selected");
              document.getElementById("away").classList.remove("selected");
              document.getElementById("five-last").classList.add("selected");

              document.querySelector("#table").innerHTML = tableHtml;
              document.querySelector("#list").innerHTML = listHtml;
          });
      })

      .catch(error => console.log('error', error));
}


function createTableRowHTML(team) {
  return `
    <tr class="ad" onclick="window.open('https://www.fotmob.com${team['pageUrl']}', '_blank');" ${team['id'] == 8592 ? "style='background-color: #3a3a3b;'" : ""}>
      <td class="cell" style="border-top-left-radius: 10px;border-bottom-left-radius: 10px;"><span class="legend-position" style="background-color: ${team['qualColor']}">${team['idx']}</span></td>
      <td class="cell">
        <div class="team">
          <img height="30" src="https://images.fotmob.com/image_resources/logo/teamlogo/${team['id']}_xsmall.png" />
          <span>${team['shortName']}</span>
          </div>
          </td>
          <td class="cell">${team['played']}</td>
          <td class="cell">${team['wins']}</td>
          <td class="cell">${team['draws']}</td>
          <td class="cell">${team['losses']}</td>
          <td class="cell">${team['goalConDiff'] > 0 ? "+" + team['goalConDiff'] : "" + team['goalConDiff']}</td>
          <td class="cell">${team['scoresStr']}</td>
          <td class="cell" style="border-bottom-right-radius: 10px;border-top-right-radius: 10px;">${team['pts']}</td>
        </tr>
      `;
}

function createListHTML(team) {
  return `
        <li class="item" onclick="window.open('https://www.fotmob.com${team['pageUrl']}', '_blank');"}>
          <dl class="ad" ${team['id'] == 8592 ? "style='background-color: #3a3a3b;'" : ""}>
            <div class="row">
              <dt class="name">Position</dt>
              <dd class="value">
                <td><span class="legend-position" style="background-color: ${team['qualColor']}">${team['idx']}</span></td>
              </dd>
            </div>
            <div class="row">
              <dt class="name">Équipe</dt>
              <dd class="value">
                <div class="team">
                  <img height="30" src='https://images.fotmob.com/image_resources/logo/teamlogo/${team['id']}_xsmall.png' />
                  <span>${team['shortName']}</span>
                </div>
              </dd>
            </div>
            <div class="row">
              <dt class="name">Matchs Joués</dt>
              <dd class="value">${team['played']}</dd>
            </div>
            <div class="row">
              <dt class="name">Victoires</dt>
              <dd class="value">${team['wins']}</dd>
            </div>
            <div class="row">
              <dt class="name">Nuls</dt>
              <dd class="value">${team['draws']}</dd>
            </div>
            <div class="row">
              <dt class="name">Défaites</dt>
              <dd class="value">${team['losses']}</dd>
            </div>
            <div class="row">
              <dt class="name">Différence</dt>
              <dd class="value">${team['goalConDiff']}</dd>
            </div>
            <div class="row">
              <dt class="name">+/-</dt>
              <dd class="value">${team['scoresStr']}</dd>
            </div>
            <div class="row">
              <dt class="name">Points</dt>
              <dd class="value">${team['pts']}</dd>
            </div>
          </dl>
        </li>
      `;
}

function createLegendsHTML(legends) {
  var legendHtml = "";
  legends.forEach(legend => {
      legendHtml += `
          <li>
            <i class="legend-icon" style="background-color: ${legend['color']}"></i>
            ${legend['title']}
          </li>
        `;
  });
  return legendHtml;
}

window.addEventListener('DOMContentLoaded', getDatas);