
const form = document.querySelector('form');

const formEvent = form.addEventListener('submit', event => {
    event.preventDefault();

    const participant = document.querySelector('#participant').value;
    const temperature = document.querySelector('#temperature').value;
    const weather = document.querySelector('#weather').value;
    const wind = document.querySelector('#wind').value;
    const height = document.querySelector('#height').value;
    const girth = document.querySelector('#girth').value;
    const location = document.querySelector('#location').value;
    const leaf_size = document.querySelector('#leaf_size').value;
    const leaf_shape = document.querySelector('#leaf_shape').value;
    const bark_texture = document.querySelector('#bark_texture').value;
    const bark_color = document.querySelector('#bark_color').value;
    const forms = { participant,temperature,weather,wind,height,girth,location,leaf_size,leaf_shape,bark_texture,bark_color };
    console.log(forms) //,forms
    axios.post('http://127.0.0.1:8010/api/observations',forms).then(response => {
          console.log(response)
      })
          .catch(error => console.log(error));
}); 
