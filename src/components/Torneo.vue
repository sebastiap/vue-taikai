<template>
  <!-- Game Over Modal -->
<div id="myModal" class="GOZmodal">

<!-- Modal content -->
<div class="modal-content">
  <!-- <span class="close" v-on="Restart()">&times;</span> -->
  <img src="./img/events/chibigoku.png" alt="">
  <p>{{ this.modalMessage }}</p>
  <button v-on:click="Restart()" class="modal-button">Volver a Jugar</button>
</div>

</div>
  <section class="placa">
    <div class="item item-1"></div>
    <div class="item item-3">
      <div id="personaje" v-bind:style="{ backgroundImage: 'url(' + imagenProta + ')' }" >
        <div class="invisible">  {{ auracolor }}</div>
      </div>
      <div class="ficha">
        <!-- https://static.wikia.nocookie.net/dragonball/images/0/08/TB_Announcer.png/revision/latest?cb=20210930000456 -->
        <select class="selectProta" :disabled="!this.enablepj" name="pj" id="pj" v-model="pjactual">
          <option v-for="(item, key) in personajes" :value="item">
            {{item.nombre}}
        </option>
        </select>
        {{ this.tecnicaActual }}
        <div class="fichaDatos">
          <div class="ficha-item">  {{ pjactual.nombre }}</div>
          <div class="ficha-item">  Raza: {{ pjactual.raza }}</div>
          <div class="ficha-item">  Ki: {{ pjactual.ki }}</div>
          <div class="ficha-item">  Energia: {{ pjactual.energia }}</div>
          <!-- <div class="ficha-item">  {{ formaactual.modo }}</div> -->
        <transition name="slide-fade" mode="out-in">
              <div class="ficha-item poder" :key="this.poderactual">
                Poder Actual : {{ this.poderactual }} 
              </div>
        </transition>
        </div>
        <div class="selectContainer">
          <!-- {{ this.estadoZeno }} -->
          <select class="selectProta" name="forma" id="forma" v-model="formaactual">
            <option v-for="(item, key) in formaspj" :value="item">
              Forma {{item.modo}}
            </option>
          </select>
          <select v-show="tecnicaspj.length > 1" class="selectProta" name="tecnica" id="tecnica" v-model="tecnicaActual">
            <option v-for="(item, key) in tecnicaspj" :value="item">
              {{item.nombre}}
            </option>
          </select>
        </div>
      </div>
      <div id="zeno" v-bind:style="{ backgroundImage: 'url(' + imagenZeno + ')' }" ></div>
    </div>
    <div class="puntaje">TU PUNTAJE ACTUAL ES DE {{ this.puntaje }} PUNTOS</div>
  <div class="contenedor">
        <aside className="sidebar">
			    <h3><button v-on:click="luchar(this.poderactual,poderEnemy,null, $event)">LUCHAR</button></h3>
		    </aside>
        <div className="enemigo">
          <div className="enemydata convertEnemy">
            <h3>{{ imgenemigo }}</h3>
            <!-- <p> {{ this.enemyName }}</p> -->
            <p>Nivel de Pelea: {{poderEnemy}}</p>
            <!-- Estado Zeno: {{ this.estadoZeno }} -->
            <!-- <p>Diferencia de Poder: {{ this.diferenciadepoder }}</p> -->
            <p>{{ this.enemyDesc }}</p>
            <!-- <transition name="convertEnemy" mode="out-in"> -->
            <transition name="convertEnemy" mode="out-in">
                  <img v-bind:src="imagenEnemy" alt="" :key="imagenEnemy">
            </transition>
          </div>
        </div>
        <div className="widget-1">
          <h3><button v-on:click="empujar(this.poderactual,poderEnemy,null, $event)">EMPUJAR</button></h3>
        </div>
        <div className="widget-2">
          <h3><button v-on:click="huir(this.poderactual,poderEnemy,null, $event)">HUIR</button></h3>
        </div>
      </div>
      <div class="item item-2" id="dialogo">{{ this.dialogo }}
        <button v-on:click="GOZ()">Open Modal</button>
      </div>
      <!-- <div class="marginator">AHHHH</div> -->
    </section>
      <!-- Intro Modal -->
<div id="introModal" class="Intromodal">
<!-- Modal content -->
  <div class="intro-modal-content">
    <!-- <span class="close" v-on="Restart()">&times;</span> -->
    <img v-bind:src="introModal.modalImg" alt="">
    <p>{{ this.introModal.modalMessage }}</p>
    <p><b>COMO JUGAR:</b></p>
    <p>{{ this.introModal.modalHTPMessage }}</p>
    <button v-on:click="iniciar()" class="intro-modal-button">EMPECEMOS!</button>
  </div>

</div>
  </template>
  
  <style scoped>

  .marginator {
    margin-bottom: 100rem;
  }
  .placa{
    position: relative;
    top: 0;
    right: 0;
    overflow-x: hidden;
    height: 100%;
    width: 100%;
    margin-top: 9rem;
    padding-bottom: 1rem;
    /* margin-bottom: 1rem; */
    background-color: #E05263;
  }
  .container {
    display: grid;
    grid-template-columns: 25% 25% 25% 25%;
    gap: 1rem;
    background-color: rgb(42, 103, 155);
  }
  .item {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 10rem;
    width: 10rem;
    background-color: aquamarine;
    border-radius: 1rem;
    color: black;
    text-align: center;
  }

  .item-1{
    /* Este elemento es la esfera del dragon , Lo posiciono fixed para que siempre este arriba de todo y me siga al scrollear */
    position: fixed;
    height: 8rem;
    width: 8rem;
    top:-3rem;
    right: -3rem;
    z-index: 10;
    -webkit-clip-path: circle(33%);
    clip-path: circle(33%);
    background-image: url("/4stardb.png");
    background-size: cover;
    border: 0.2rem solid black;
  }
  .item-2{
    /* Este elemento es el dialogo , Lo posiciono static explicitamente para que siga el curso del documento */
    position: static;
    bottom: 0rem;
    display: flex;
    align-items: center;
    justify-content: flex-start;
  }

  #dialogo {
   margin-left: 2rem;
   width: 95%; 
   height: 6.5rem; 
   background: whitesmoke;
   -moz-border-radius: 10px; 
   -webkit-border-radius: 10px; 
   border-radius: 10px;

}
#dialogo:before {
   /* background-color: aqua; */
   content:"";
   position: absolute;
   width: 100;
   height: 0;
   border-top: 13px solid transparent;
   border-right: 26px solid whitesmoke;
   border-bottom: 13px solid transparent;
   margin: 0 0 0 -25px;
}

  .item-3{
    /* Este elemento es la ficha de personaje , Lo posiciono fixed para que siempre este arriba de todo y me siga al scrollear */
    position: fixed;
    /* background-color: #5f9ea0; */
    background: rgb(249,229,127);
    background: radial-gradient(circle, rgba(249,229,127,1) 0%, rgba(95,158,160,1) 100%);
    top: 0px;
    width: 99%;
    height: 9rem;
    display: flex;
    align-items: center;
    justify-content: flex-start;
  }

  .ficha{
    display: flex;
    align-items: center;
    justify-content: space-around;
    flex-direction: row;
    width: 50rem;
  }
  .fichaDatos{
    /* background-color:#aebccd; */
    background: rgb(249,229,127);
    background: radial-gradient(circle, rgba(249,229,127,1) 0%, rgba(223,152,0,1) 100%);
    border: 1px solid #70757b;
    height: 8rem;
    width: 20rem;
    display: flex;
    justify-content: space-around;
    flex-direction: column;
    transition: all 1s ease-out;
  }

  .puntaje{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
  }

    .slide-fade-enter-active {
    transition: all .3s ease;
    font-weight:normal;
    color: white;
  }

  .slide-fade-leave-active {
    transition: all .8s cubic-bezier(1.0, 0.5, 0.8, 1.0);
    color:gold;
  }

  .slide-fade-enter,
  .slide-fade-leave-to {
    transform: translateY(-10px);
    font-weight:normal;
    opacity: 0;
  }

  .convertEnemy{
    transition:
    width 1s,
    height 1s,
    background-color 1s,
    rotate 1s;
  }

  .convertEnemy-enter,
  .convertEnemy-leave-to {
    transform: translateY(10rem);
    font-weight:normal;
    transition: all .8s cubic-bezier(1.0, 0.5, 0.8, 1.0);
    color:gold;
    opacity: 0;
  }

  .convertEnemy-leave-active {
    transition: all .8s cubic-bezier(1.0, 0.5, 0.8, 1.0);
    color:black;
  }
  .convertEnemy-enter-active {
    transform: translateY(1rem);
    font-weight:normal;
    transition: all 0.1s cubic-bezier(1.0, 0.5, 0.8, 1.0);
    color:black;
    opacity: 0;
  }
  

  .poder{
    color: v-bind("auracolor");
    font-weight: bold;
  }

  .item-4{
    /* Este elemento es la ficha de personaje , Lo posiciono fixed para que siempre este arriba de todo y me siga al scrollear */
    position: sticky;
    background-color: palevioletred;
    bottom: 5rem;
    display: flex;
    align-items: center;
    justify-content: flex-start;
    z-index:2;
  }

  #personaje{
   width: 8rem;
   height: 8rem;
   margin-left: 1rem;
   background-image: v-bind("imagenProta");
   background-size: cover;
   -moz-border-radius: 50%; 
   -webkit-border-radius: 50%; 
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    border-color: v-bind("auracolor");
    border-width: 0.3rem;
    border-style: solid;
    transition: all 1s ease-out;
  }

  .invisible{
    z-index: -99;
  }

  #zeno{
   width: 16rem;
   height: 8rem;
   margin-left: 1rem;
   background-image: v-bind("imagenZeno");
   background-size:cover;
  }

.selectContainer{
  width: 10rem;
}
  
.selectProta {
    height: 3rem;
    position: relative;
    display: inline-block;
    margin-bottom: 15px;
    width: 10rem;
    background: #f7ffe0;
    border: 4px solid #659157;
}    .selectProta select {
        font-family: 'Arial';
        display: inline-block;
        width: 100%;
        cursor: pointer;
        padding: 17px 17px;
        outline: 0;
        border: 4px solid #659157;
        border-radius: 2px;
        background: #F7FFE0;
        color: #7b7b7b;
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
    }
        .selectProta::-ms-expand {
            display: none;
        }
        .selectProta:hover,
        .selectProta:focus {
            color: #f6f6f6;
            background: #659157;
        }
        .selectProta:disabled {
            opacity: 0.6;
            pointer-events: none;
        }
.selectProta_arrow {
    position: absolute;
    top: 27px;
    right: 15px;
    width: 0px;
    height: 0px;
    border: solid #FAA43D;
    border-width: 0 3px 3px 0;
    display: inline-block;
    padding: 3px;
    transform: rotate(45deg);
    -webkit-transform: rotate(45deg);
}
.selectProta:hover ~ .selectProta_arrow,
.selectProta:focus ~ .selectProta_arrow {
    border-color: #E05263;
}
.selectProta:disabled ~ .selectProta_arrow {
    border-top-color: #E05263;
}
  
.GOZmodal{
  transition: width 0.1s, height 1.5s,opacity 0.5s linear 0.5s ;
  display: v-bind("modal"); /* Hidden by default */
  position: absolute; /* Stay in place */
  z-index: 10; /* Sit on top */
  right: 0;
  top: 0;
  height: 150%;
  padding-bottom: 1rem;
  width: v-bind("modalVH"); /* Full width */
  height: v-bind("modalVH"); /* Full height */
  opacity: v-bind("modalOpacity");
  overflow:hidden; /* Enable scroll if needed */
}
.Intromodal{
  transition: width 0.1s, height 1.5s,opacity 0.5s linear 0.5s ;
  display: v-bind("introModal.modalDisplay"); /* Hidden by default */
  position: absolute; /* Stay in place */
  z-index: 20; /* Sit on top */
  right: 0;
  top: 0;
  height: 150%;
  padding-bottom: 1rem;
  width: v-bind("introModal.modalVH"); /* Full width */
  height: v-bind("introModal.modalVH"); /* Full height */
  opacity: v-bind("introModal.modalOpacity");
  overflow:hidden;
}

/* Modal Content/Box */
.intro-modal-content {
  /* transition: 20s all; */
  transition: 10s all;
  background-color: #fefefe;
  /* color:v-bind("modaltext"); */
  /* margin: 5% auto; */
   /* 15% from the top and centered */
  padding: 2rem;
  border: 1px solid #888;
  height: 100%; /* Could be more or less, depending on screen size */
  width: 100%; 
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.intro-modal-button {
  transition: 20s all;
  width: 10rem;
  height: 3rem;
  background: rgb(249,229,127);
  background: radial-gradient(circle, rgba(249,229,127,1) 0%, rgba(223,152,0,1) 100%);
  color:black;
}

.modal-content {
  /* transition: 20s all; */
  transition: 10s all;
  background-color: #fefefe;
  color:v-bind("modaltext");
  /* margin: 5% auto; */
   /* 15% from the top and centered */
  padding: 2rem;
  border: 1px solid #888;
  height: 100%; /* Could be more or less, depending on screen size */
  width: 100%; 
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.modal-button {
  transition: 20s all;
  width: v-bind("modalVH"); /* Full width */
  height: v-bind("modalVH"); /* Full height */
  max-width: 6rem;
  max-height: 3rem;
  background: rgb(249,229,127);
  background: radial-gradient(circle, rgba(249,229,127,1) 0%, rgba(223,152,0,1) 100%);
  color:v-bind("modaltext");
}

/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

/*   
  @media (min-width: 1024px) {}
*/

/* Migrado de Grid Tournament */
.contenedor {
	width: 95%;
	height: 70%;
  /* padding: 1rem; */
  padding-left: 2rem;
  padding-right: 2rem;
	/* margin: 20px auto; */
	display: grid;
	grid-gap: 0.5rem;
	grid-template-columns: repeat(3, 1fr);
	grid-template-rows: repeat(4, auto);
  background-color:#322a26;

	grid-template-areas: "header header header"
						 "protagonista protagonista protagonista "
             "enemigo enemigo sidebar"
						 "widget-1 widget-2 sidebar"
             "contenido contenido contenido"
						 "footer footer footer";
}

.contenedor > div,
.contenedor .header,
.contenedor .contenido,
.contenedor .sidebar,
.contenedor .protagonista,
.contenedor .enemigo,
.contenedor .footer {
	background: #fff;
	padding: 20px;
	border-radius: 4px;
}

.contenedor .header {
	background: #12203E;
	color: #fff;
	grid-area: header;
}

.contenedor .contenido {
	grid-area: contenido;
}
.contenedor .protagonista {
  padding: 10px;
  height: 100px;
  display:flex;
  flex-direction: row;
  align-items: space-around;
  justify-content: space-between;
  grid-area: protagonista;

}


.contenedor .enemigo {
  height: 200px;
	grid-area: enemigo;
	display:flex;
	flex-direction: row;
	justify-content:space-between;
	overflow: hidden;
}
.contenedor .enemigo img {
border: 0.3rem;
border-color: v-bind("enemyColor");
border-style: solid ;
border-radius: 10px;
transition: 1s;
  }

.contenedor .enemigo .formas{
	  display:flex;
	  flex-direction: row;
	  flex-wrap: wrap;
	  justify-content:space-between;
	  align-items:center;
	  width: 300px;
	  height: 80px;

  }
  .contenedor .enemigo .formas button{
width: 25%;
height: 50%;
border-radius: 4px;
border-color: #fff;
margin:0.5%;

}

.contenedor .sidebar {
	grid-column: 2 / 4;
	background: #fAA43D;
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 50px;
	grid-area: sidebar;
}

.contenedor .widget-1,
.contenedor .widget-2 {
	background: #55a8fd;
	color: #fff;
	height: 50px;
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
}

.contenedor .widget-1 {
	grid-area: widget-1;
}

.contenedor .widget-2 {
	grid-area: widget-2;
}
.contenedor .widget-1:hover,.contenedor .widget-2:hover {
	border: 1px solid;
	border-color: #000;
	padding: 15px;
	box-shadow: 2px 5px #12203E;
	transition:  0.5;
	transform: translateY(-7px);
	
}
.contenedor .sidebar:hover {
	border: 1px solid;
	border-color: #000;
	padding: 15px;
	box-shadow: 5px 5px #777777;
	transition:  0.5;
	transform: translateY(-7px);
	font-size:20px
	
}

.contenedor .footer {
	background: #12203E;
	color: #fff;
	grid-area: footer;
	text-align:right;
}

/* notebook */
@media screen and (max-width: 992px){
	.contenedor {
		grid-template-areas: "header header header"
							 "protagonista protagonista protagonista "
							 "widget-1 widget-2 sidebar"
							 "enemigo enemigo enemigo"
							 "contenido contenido contenido"
							 "footer footer footer";
	}
	.contenedor .enemigo img {
		width: 40%;
  
	}
	/* .contenedor .enemigo .formas button {
	width: 50%;
	height:auto;
	} */
}

/* laptop */
@media screen and (max-width: 768px){
	.contenedor {
		grid-template-areas: "header header header"
    						 "protagonista protagonista protagonista "
              	"enemigo enemigo enemigo"
			 				 "sidebar sidebar sidebar"
						 	 "widget-1 widget-1 widget-2"
						 	 "contenido contenido contenido"
						 	 "footer footer footer";
	}
}

/* mobile */
@media screen and (max-width: 600px){
	.contenedor {
		grid-template-areas: "header header header"
    						 "protagonista protagonista protagonista "
             				 "enemigo enemigo enemigo"
						 	 "sidebar widget-1 widget-2"
						 	 "contenido contenido contenido"
						 	 "footer footer footer";
	}
	.contenedor .enemigo {
		  height: auto;
		  grid-area: enemigo;
		  display:flex;
		  flex-direction: row;
		  justify-content:space-between;
		  overflow: hidden;
	  }

	  .contenedor .enemigo img {
				width: 45%;
		  }
	  .contenedor .enemigo p {
				margin-left: 1rem;
				margin-left: 1rem;
		  }
	  .contenedor .enemigo .formas{
			width: max-content;
			height: auto;
			display: flex;
			flex-wrap: wrap;
			flex-direction: column;
			align-items: center;
		}

		.contenedor .enemigo .formas button{
			width: 280%;
			height: auto;
			/* border-radius: 4px; */
			/* border-color: #fff; */
			/* align-self: center; */
			/* margin:0.5%; */
			
			}
}

.enemydata{
  display: flex;
  width: 100%;
  flex-direction: row-reverse;
  transition: all 1s ease-out;
  justify-content: space-between;

}





  </style>

<script>
import {personajes,formas,imgenemigo,options as tecnicas,enemies,enemyColors,descripcionesLuchadores as enemyDescs, Luchar,Empujar,Huir} from '../logic/Torneo'

export default {
  name: "Torneo",
  data () {
    return {
      personajesRst: personajes,
      personajes: personajes,
      enemies: enemies,
      enemyColors:enemyColors,
      formas:formas,
      tecnicas:tecnicas,
      pjactual:		{
		  id: 90,
		  nombre: 'Satan',
		  raza:'saiyajin',
		  ki:'divino',
		  img:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfCQVP-lxNewrbhT5y2M0RdAHRg-aFxdSrpQ&usqp=CAU",
      energia:0,
		  vivo: true
		  },
      formaactual:		{
		  id: 1,
		  modo: 'Base',
		  raza:'libre',
		  ki:'NO',
		  aura:"white",
		  user: 'TODOS' 
		},
    enablepj:true,
      auracolor:"white",
      imagenProta:"/img/characters/enemies/Enemy2.jpg",
      imagenEnemy:"/img/characters/enemies/Enemy3.jpg",
      poderEnemy: 9000,
      enemyName:"Bonato",
      enemyDesc:"Un guerrero de clase baja pero mucho potencial.",
      enemyColor:"Black",
      tecnicaActual:"Sin Tecnica",
      energiaActual:1000,
      puntaje:0,
      estadoZeno:3,
      imagenZeno:"/img/characters/Zeno/Zeno3.jpg",
      dialogo:"Y la campana da inicio al torneo Taikai!",
      modal:"block", //ver si lo sacamos
      modalVH:"0%",
      modaltext:"white",
      modalMessage:"",
      modalImg:"",
      modalOpacity:0,
      introModal: {
        modalDisplay:"block", //ver si lo sacamos
        modalVH:"100%",
        modaltext:"black",
        modalMessage:"Pero en esta linea temporal Zeno-Sama no ha quedado conforme con un simple torneo por eliminacion. En su lugar ha decidido que si el torneo no es lo suficiente interesante, lo interrumpira en cualquier momento... Y en ese mismisimo instante acabara con los 12 universos!!! Podran Goku y sus amigos entretenerlo lo suficiente para sobrevivir un dia mas?",
        modalHTPMessage:"En la parte superior se encuentra tu personaje. Empezas con Goku pero podes elegir entre varios. En el centro estan los datos de ese personaje y a la derecha podes elegir en que forma vas a pelear. Mientras mas poderosa la forma, mas aumenta tu poder y podes derrotar enemigos mas fuertes! Pero ojo que mientras mas poderosa la tranformacion mas costo energetico tiene!! \n Una vez elegido el setting de arriba, podes elegir la opcion que mas te convenga a traves de los botones 'LUCHAR','EMPUJAR' o 'HUIR'. LUCHAR es basicamente enfrentarte con el enemigo con sus poderes. EMPUJAR es para desechar a un enemigo sin pelear, cuando la diferencia es grande, pero hay que tener cuidado de que no haya mucha diferencia de poderes! HUIR es para cambiar de personaje y solo podras hacerlo si superas a un enemigo por al menos el doble de poder.",
        modalImg:"/img/characters/Playables/chibigoku.png",
        modalOpacity:1,
      }
      // luchar:Luchar
    }
  },

  computed: {
    personaje(){
    return personajes[0];
    },
    formaspj(){
      if (pjactual === undefined) {
        var pjactual = "saiyan";
      }
      var posiblesformas = formas.filter((forma) => forma.raza == this.pjactual.raza);
      var formaspublicas = formas.filter((forma) => forma.raza == "libre");
      var formasdivinas = formas.filter((forma) => forma.ki == "divino");
      var formaspersonales = formas.filter((forma) => forma.user == this.pjactual.nombre);

      var otrasformas = [];
      if (this.pjactual.ki == "divino"){
        otrasformas = otrasformas.concat(formasdivinas);
      }
      console.log(posiblesformas);
      console.log(formaspublicas);
      this.formaactual = formaspublicas[0];
      var todaslasformas = formaspublicas.concat(posiblesformas,formaspersonales,otrasformas);
      console.log(todaslasformas);
      return todaslasformas;
    },
    tecnicaspj(){
      if (pjactual === undefined) {
        var pjactual = "saiyan";
      }
      var tecnicaspublicas = formas.filter((tecnica) => tecnica.pj == "TODOS");
      var tecnicaspersonales = tecnicas.filter((tecnica) => tecnica.pj == this.pjactual.nombre);
      var tecnicas_pj =[];
      tecnicas_pj = tecnicaspublicas.concat([{nombre:"Sin Tecnica"}],tecnicaspersonales);
      this.tecnicaActual = tecnicas_pj[0];

      return tecnicas_pj;
    },
    auracolor(){
      this.auracolor = this.formaactual.aura;
      return {"auracolor":this.formaactual.aura}
    },
    poderactual() {
      let pjactual = this.pjactual;
      if (pjactual === undefined) {
        return 1
      }
      else{
        // this.imagenProta = `/img/characters/Playables/Enemy4.jpg`;
        this.imagenProta = this.pjactual.img;
        var techmodifier = 1;
        if (this.tecnicaActual.nombre === "KAME HAME HA"){
          techmodifier = 2;
        }
        else if (this.tecnicaActual.nombre === "EXPLOSION"){
          techmodifier = 5;
        }
        return pjactual.id * this.formaactual.id * techmodifier;
      }

    },
    diferenciadepoder(){
      return this.poderactual/this.poderEnemy;
    }
  },
  methods: {
    iniciar: function(){
        this.introModal.modalOpacity = "0%";
        this.modaltext = "white";
        this.modalMessage = "";
        this.introModal.modalImg = "/img/characters/Playables/chibigoku.png";
        this.pjactual = this.personajes[0];
        this.manageEnemy();
        this.enablepj = true;
        setTimeout(() => {  this.introModal.modalDisplay = "none"; }, 2000);
        
    },
    luchar: function (p1,p2,t, event) {
    // El jugador gana puntos dependiendo la diferencia de poder entre el personaje actual y el enemigo que aparece
    // Si hay muchisima diferencia de poder y matas al rival, Zeno se enoja y mata al jugador.
    event.preventDefault();

      // El personaje gasta energia de acuerdo a la tranformacion que usa al pelear

    this.pjactual.energia = this.pjactual.energia - this.formaactual.id;
    if (this.tecnicaActual.nombre != "Sin Tecnica")
    {
      this.pjactual.energia = this.pjactual.energia - ((this.tecnicaActual.porc/100) * (this.pjactual.max));
    }

    // Si no tiene energia suficiente se desmaya personaje gasta energia de acuerdo a la tranformacion que usa al pelear
    if (this.pjactual.energia < 0){
      this.dialogo = "El participante " + this.pjactual.nombre + " comienza a luchar pero no puede mantener su transformacion!! Su cuerpo no lo resiste! Se ha desmayado... Zeno esta muy decepcionado de ese fallo.";
      this.manageProta();
      this.puntaje -=50;
    }

    // if (p1 >p2 * 10000) {
    else if (this.tecnicaActual.nombre === "MAFUBA"){
      // Si usas el MAFUBA ganas la pelea de una pero no lo podes usar mas
      this.puntaje +=20;
      this.manageZeno(-1);
      this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.dialogo = "El participante " + this.pjactual.nombre + " utiliza una tecnica especial! Acaba de crear un gran remolino que envuelve a su oponente! Lo ha atrapado en un termo! Increible!";
      this.manageEnemy();
    }
    else if (this.diferenciadepoder > 20) {
      // Si hay mas de 10000 veces la diferencia, Zeno se calienta
      this.puntaje -=300;
      this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.manageZeno(1);
      this.dialogo = "El participante " + this.pjactual.nombre + " aplasta a " +this.enemyName + 
      " la diferencia de poderes era abismal! Zeno-Sama se muestra molesto...";
      this.manageEnemy();
    }
    else if (this.diferenciadepoder > 10) {
      // Si hay mas de 1000 veces la diferencia, a Zeno no le gusta pero te da un punto
      this.puntaje +=1;
      this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.manageZeno(-1);
      this.manageEnemy();
      this.dialogo = "El participante " + this.pjactual.nombre + " derrota con facilidad a su oponente. Apenas si ha sido un espectaculo. Una pena.";
    }
    else if (this.diferenciadepoder > 5){
      // Si hay mas de 10 veces la diferencia, a Zeno le gusta y te da 10 puntos
      this.puntaje +=10;
      this.manageZeno(-1);
      this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.manageEnemy();
      this.dialogo = "El participante " + this.pjactual.nombre + " y "+
      this.enemyName + "estan dando una tremenda batalla! Increible! La balanza se inclina hacia " + this.pjactual.nombre 
       + " con un increible golpe knoquea a su rival! Zeno se ve realmente emocionado!";

    }
    else if (p1 >=p2){
      // Si esta parejo y lo vences, a Zeno le encanta y te da 100 puntos
      this.puntaje +=100;
      this.manageZeno(-1);
      this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.dialogo = "El participante " + this.pjactual.nombre + " enfrenta a " +this.enemyName + 
      ". la batalla es muy pareja pero finalmente " +this.pjactual.nombre  + " se alza con la victoria!";
      this.manageEnemy();
    }
    else if (this.diferenciadepoder > 0.5){
       // Si esta parejo y perdes, a Zeno le emociona y te da 50 puntos aunque pierdas
      this.puntaje +=50;
      this.manageZeno(-1);
      if (this.tecnicaActual === "ESCUDO"){
        // Si esta parejo y usas escudo, sobrevivis y ganas la pelea, a Zeno le emociona y te da 150 puntos extra
        this.puntaje +=150;
        this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
        this.dialogo = "El participante " + this.pjactual.nombre + " enfrenta a " +this.enemyName 
        + ". Ambos estan dando una increible batalla! Increible! Pero la balanza se inclina hacia " + this.enemyName
       + "quien con un increible golpe ... Esperen! "+ + "utiliza un escudo... ha hecho un contrataque y..."
       + this.pjactual.nombre + "se alza con la victoria!!! Zeno se ve realmente emocionado!";
      }
      else {
        this.dialogo = "El participante " + this.pjactual.nombre + " enfrenta a " +this.enemyName 
        + ". Ambos estan dando una increible batalla! Esta muy parejo! Pero la balanza se inclina hacia " + this.enemyName
       + "quien con un increible golpe knoquea a su oponente!";
        this.manageZeno(1);
        this.manageProta();
      }
    }
    else{
      // Si perdes la pelea, Zeno se enoja y te resta 10 puntos
      this.dialogo = "Vaya... el participante " + this.pjactual.nombre + " no tuvo oportunidad contra " +this.enemyName 
        + ". La diferencia de poderes simplemente era muy grande. Zeno no parece contento con este resultado.";
      this.puntaje -=10;
      this.manageZeno(1);
      this.manageProta();
    }
  },
     empujar: function (p1,p2,t, event) {
      event.preventDefault();


    if (p1 >p2 && this.diferenciadepoder < 10) {
      this.puntaje +=50;
      this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.dialogo = "Sin ningun inconveniente, el participante " + this.pjactual.nombre + " ha empujado de la plataforma a " +this.enemyName 
        + ". La diferencia de poderes ha hecho que sea sencillo empujarlo. Zeno no parece contento con este resultado.";
      this.manageZeno(-1);
      this.manageEnemy();
    }
    else if (p1 >p2 && this.diferenciadepoder > 10) {
      this.puntaje -=50;
      this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.dialogo = "Vaya... el participante " + this.pjactual.nombre + " ha destrozado a " +this.enemyName 
        + " al tratar de empujarlo. La diferencia de poderes simplemente era muy grande. Zeno no parece contento con este resultado.";
      this.manageZeno(1);
      this.manageEnemy();
    }
    else if (this.tecnicaActual.nombre === "PARALISIS" && this.diferenciadepoder > 0.3){
      // Si usas el PARALISIS y lo empujas funciona barbaro y ganas muchos puntos aunque te gane por bastante
      this.puntaje +=50;
      this.manageZeno(-1);
      // this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.dialogo = "El participante " + this.pjactual.nombre + " a paralizado a " +this.enemyName 
        + " con esa tecnica ha sido muy facil empujarlo. Zeno esta contento con esta maniobra";
      this.manageEnemy();
     
    }
    else if (this.tecnicaActual.nombre === "TAIYOKEN" && this.diferenciadepoder > 0.5){
      // Si usas el TAIYOKEN y lo empujas funciona barbaro y ganas muchos puntos aunque te gane por bastante
      this.puntaje +=50;
      this.manageZeno(-1);
      // this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.dialogo = "El participante " + this.pjactual.nombre + " ha cegado con su tecnica a " +this.enemyName 
        + " vaya que fue facil empujarlo de la plataforma. Zeno esta contento con esta tactica";
      this.manageEnemy();
      
    }
    else{
      this.puntaje -=1;
      this.manageZeno(1);
      this.dialogo = "Vaya... el participante " + this.pjactual.nombre + " no ha podido ni mover a " +this.enemyName 
        + ". La diferencia de poderes simplemente era muy grande. Zeno no parece contento con este resultado.";
     
    }
  },
      huir: function (p1,p2,t, event) {
    // now we have access to the native event
    event.preventDefault();
    if (p1 >(p2 * 2)) {
      this.puntaje +=1;
      // this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.enablepj = true;
      this.mensa
      // this.manageZeno(-1);
      // this.manageEnemy();
      this.dialogo = "El participante " + this.pjactual.nombre + " logra escapar de " +this.enemyName 
        + ". Esto no parece agradarle mucho a Zeno, pero esta a la espectativa de quien sera el proximo participante.";
        //Animacion de combo personajes?
    }
    // else if ((this.tecnicaActual.nombre === "TAIYOKEN" || this.tecnicaActual.nombre === "PARALISIS") && this.diferenciadepoder > 0.5){
    //   // Si usas el TAIYOKEN y lo empujas funciona barbaro y ganas muchos puntos aunque te gane por bastante
    //   this.manageProta();
    // }
    else{
      this.puntaje -=10;
      this.manageZeno(1);
      this.dialogo = "El participante " + this.pjactual.nombre + " es empujado de la plataforma al tratar de escapar de " +this.enemyName 
        + ". Zeno esta decepcionado por este fallo, esperemos que el proximo participante cambie su humor.";
      this.manageProta();
    }
  }, 
  
  manageEnemy: function() {
    var max = 13;
    var min = 1;
    var alias = "";
    var aliases = ["","","","","XENO ","SUPER ","MAJIN ","OMEGA ","SHIN ", "MIRAI ","DARK ","Z-","CHIBI ","A-","X-"]
    var enemyNumber = Math.round(Math.random() * (max - min) + min);
    var alias = aliases[aliases.length * Math.random() | 0];
    this.imagenEnemy = `/img/characters/enemies/Enemy${enemyNumber}.jpg`;
    this.enemyName = alias + enemies[enemies.length * Math.random() | 0].toUpperCase();
    this.enemyDesc = this.enemyName + " - " + enemyDescs[enemyDescs.length * Math.random() | 0];
    this.enemyColor = enemyColors[enemyColors.length * Math.random() | 0];
    this.dialogo =  this.dialogo + " Un nuevo rival se acerca! El concursante " + this.enemyName + " se prepara desafiante frente al participante " + this.pjactual.nombre;
    this.enablepj = false;
    },
    manageZeno: function(mod) {
      if (this.estadoZeno < 5 && this.estadoZeno >= 1 ){
        if (this.estadoZeno === 1 && mod === -1) {mod = 0}
        this.imagenZeno = `/img/characters/Zeno/Zeno${this.estadoZeno + mod}.jpg`;
        this.estadoZeno += mod;
      }
      else {
        //GAMEOVER ZENO
      if (this.estadoZeno === 5)
       { this.GOZ();}
      }
      if (this.puntaje > 1000 ){
        this.GOV();
      }
    },
    manageProta: function() {
      // this.GOL();
      if (this.personajes.length > 1){
          this.personajes = this.personajes.filter(personaje => personaje.nombre != this.pjactual.nombre);
          this.pjactual = this.personajes[0];
          this.enablepj = true;
        }
        else{          
          this.GOL();
        }
      
    },
    GOV:function() {
      this.modal = "block";
        this.modalMessage = "Tu equipo ha entretenido lo suficiente al dios de todo! El multiverso y todos los seres se han salvado gracias a ti! Quieres jugar otra vez?";
    },
    GOL:function() {
        this.modal = "block";
        this.modalMessage = "Tu equipo ha sido derrotado y tu universo condenado a la destruccion... Quizas tendras mas suerte en otra linea temporal. Quieres jugar otra vez?";
    },
    GOZ:function() {
        // this.enemyColor = "white";
        this.modal = "block";
        this.modalVH = "100%";
        this.modalOpacity = 1;
        // transition custom ?
        // ver si se puede arreglar esto para que cuando aparezca el texto las letras blancas se vuelvan de color negro y aparezca el boton.
        this.modaltext = "black";
        this.modalMessage = "Zeno Sama se aburrio y ahora el multiverso no existe mas... Quizas tendras mas suerte en otra linea temporal. Quieres jugar otra vez?";
    },
    Restart:function() {
        // this.modal = "none";
        this.modalVH = "0%";
        this.modalOpacity = 0;
        this.modaltext = "white";
        this.modalMessage = "";
        this.modalImg = "";
        this.estadoZeno =3;
        this.imagenZeno = `/img/characters/Zeno/Zeno${this.estadoZeno}.jpg`;
        this.puntaje = 0;
        this.personajes = this.personajesRst;
        this.pjactual= this.personajes[0];
        this.manageEnemy();
        this.dialogo =  "Y la campana da inicio al torneo Taikai!";
        this.enablepj = true;
    }
},

}
</script>
  