<template>this.results.derrotados
  <!-- Game Over Modal -->
<div id="myModal" class="GOZmodal">
  <div class="modal-content">
    <img v-bind:src="modalImg" alt="">
    <p>{{ this.modalMessage }}</p>
    <p>PUNTAJE: {{ this.results.puntaje }}</p>
    <p>ENEMIGOS DERROTADOS: {{ this.results.derrotados }}</p>
    <button v-on:click="Restart()" class="modal-button">Volver a Jugar</button>
  </div>
</div>

<div id="modalAction" class="modalAction">
  <div >
    <img v-bind:src="actionModal.modalImg" alt="">
  </div>
</div>
  <section class="placa">
    <div class="item item-1"></div>
    <div class="item item-3">
      <div id="personaje" v-bind:style="{ backgroundImage: 'url(' + imagenProta + ')' }" >
        <div class="invisible">  {{ auracolor.nombre }}</div>
      </div>
      <div class="ficha">
        <select class="selectProta" :disabled="!this.enablepj" name="pj" id="pj" v-model="pjactual">
          <option v-for="(item, key) in personajes" :value="item">
            {{item.nombre}}
        </option>
        </select>
        <div class="fichaDatos">
          <div class="ficha-item nombrepj"><b>  {{ pjactual.nombre }}</b></div>
          <div class="ficha-item extra">  Raza: {{ pjactual.raza }}</div>
          <div class="ficha-item extra">  Ki: {{ pjactual.ki }}</div>
          <div class="ficha-item">  Energia: {{ pjactual.energia }}</div>
        <transition name="slide-fade" mode="out-in">
              <div class="ficha-item poder" :key="this.poderactual">
                Poder Actual : {{ this.poderactual }} 
              </div>
        </transition>
        </div>
        <div class="selectContainer">
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
    <div class="puntaje">TU PUNTAJE ACTUAL ES DE {{ this.results.puntaje }} PUNTOS</div>
  <div class="contenedor">
        <aside className="sidebar"  v-on:click="luchar(this.poderactual,poderEnemy, $event)">
			    <h1>LUCHAR</h1>
		    </aside>
        <div className="enemigo">
          <div className="enemydata convertEnemy">
            <h3>{{ imgenemigo }}</h3>
            <p className="NvlPelea">Nivel de Pelea: {{poderEnemy}}</p>
            <p>{{ this.enemyDesc }}</p>
            <transition name="convertEnemy" mode="out-in">
                  <img v-bind:src="imagenEnemy" alt="" :key="imagenEnemy">
            </transition>
          </div>
        </div>
        <div className="widget-1" button v-on:click="empujar(this.poderactual,poderEnemy, $event)">
          <h3>EMPUJAR</h3>
        </div>
        <div className="widget-2" v-on:click="huir(this.poderactual,poderEnemy, $event)">
          <h3>HUIR</h3>
        </div>
      </div>
      <div class="item item-2" id="dialogo">{{ this.dialogo }}
      </div>
    </section>
<!-- Intro Modal -->
<div id="introModal" class="Intromodal">
  <div class="intro-modal-content">
    <img v-bind:src="introModal.modalImg" alt="">
    <p class="im1">{{ this.introModal.modalMessage }}</p>
    <p class="im2">COMO JUGAR:</p>
    <p class="im3">{{ this.introModal.modalHTPMessage }}</p>
    <button v-on:click="iniciar()" class="intro-modal-button">EMPECEMOS!</button>
  </div>

</div>
  </template>
  
  <style scoped>
:root {
  --black-color:#12203E;
}


*{
  font-family:"Lucida Console";
}
  .placa{
    position: relative;
    top: 0;
    right: 0;
    overflow-x: hidden;
    height: 100%;
    width: 100%;
    margin-top: 7.5rem;
    padding-bottom: 1rem;
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
   background: whitesmoke;
   -moz-border-radius: 10px; 
   -webkit-border-radius: 10px; 
   border-radius: 10px;
   transition: color 1s, all 1s ease-out;
   color:v-bind("actionModal.dialogColor");
   width:v-bind("actionModal.dialogWidth");
   height: 25vh; 
   min-height: 6.5rem; 
   margin-top: 1rem;
   grid-area: dialogo;

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

  .nombrepj{
    font-size:2rem;
  }
  .fichaDatos{
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
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    font-style: italic;
    font-size: 1.3rem;
    color:rgb(119, 30, 30);
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
    transition: all 2s cubic-bezier(1.0, 0.5, 0.8, 1.0);
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
    background-color: #000;
    font-weight: bold;
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
   transition: all 1s ease-in-out;
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
  display: v-bind("modal"); 
  position: absolute; 
  z-index: 10; /* Sit on top */
  right: 0;
  top: 0;
  height: 150%;
  padding-bottom: 1rem;
  width: v-bind("modalVH"); 
  height: v-bind("modalVH"); 
  opacity: v-bind("modalOpacity");
  overflow:hidden; 
  font-size:1.5rem;
}
.Intromodal{
  transition: width 0.1s, height 1.5s,opacity 0.5s linear 0.5s ;
  display: v-bind("introModal.modalDisplay"); 
  position: absolute; 
  z-index: 20; 
  right: 0;
  top: 0;
  width: v-bind("introModal.modalVH"); 
  height: v-bind("introModal.modalVH"); 
  opacity: v-bind("introModal.modalOpacity");
  overflow:hidden;
}

.intro-modal-content {
  transition: 10s all;
  background: rgb(247,162,33);
  background: linear-gradient(0deg, rgba(247,162,33,1) 0%, rgba(54,51,49,1) 100%);
  border: 1px solid #888;
  height: 100%;
  width: 100%; 
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.intro-modal-content p{
  padding: 0.5rem;
  text-shadow: 1px 0px #5a5a4a;
}


.intro-modal-content img,.modal-content img {
  width:30rem;
  height:15rem;
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
  transition: 10s all;
  background-color: #fefefe;
  color:v-bind("modaltext");
  padding: 2rem;
  border: 1px solid #888;
  height: 100%;
  width: 100%; 
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.modal-button {
  transition: 20s all;
  width: v-bind("modalVH");
  height: v-bind("modalVH"); 
  max-width: 6rem;
  max-height: 3rem;
  background: rgb(249,229,127);
  background: radial-gradient(circle, rgba(249,229,127,1) 0%, rgba(223,152,0,1) 100%);
  color:v-bind("modaltext");
}


.modalAction{
  transition: left 2s, width 0.5s, height 1.5s,opacity 0.3s ease-out; ;
  position: absolute; 
  z-index: 9; 
  left: v-bind("actionModal.modalWidth"); 
  top: calc(50vh - 5rem);;
  height: 10rem;
  width: 15rem;
  padding-bottom: 1rem;
  opacity: v-bind("actionModal.modalOpacity");
  overflow:hidden;
  display: flex;
  align-items: center;
  justify-content: center;
}
.modalAction img{
 width: 50%;
 height: 50%;
 padding: 3rem;
}


/*   
  @media (min-width: 1024px) {}
*/

/* Migrado de Grid Tournament */
.contenedor {
	width: 95%;
	height: 70%;
  padding-left: 2rem;
  padding-right: 2rem;
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
	background: var(--black-color);
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
	color: #fff;
	height: 50px;
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
}

.contenedor .widget-1 {
	grid-area: widget-1;
  background: #55a8fd;
}

.contenedor .widget-2 {
  background: v-bind("enablerun");
	grid-area: widget-2;
  transition: background 2s;
}
.contenedor .widget-1:hover,.contenedor .widget-2:hover {
	border: 1px solid;
	border-color: #000;
	padding: 15px;
	box-shadow: 2px 5px var(--black-color);
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
	background: var(--black-color);
	color: #fff;
	grid-area: footer;
	text-align:right;
}

.enemydata{
  display: flex;
  width: 100%;
  flex-direction: row-reverse;
  transition: all 1s ease-out;
  justify-content: center;
  align-content: center;

}
.enemydata p{
  padding: 0.5rem;
  margin-left: 0.5rem;
  height: max-content;

}
.enemydata .NvlPelea{
  border: 0.5em dotted v-bind("enemyColor");
  display: flex;
  align-items: center;
  justify-content: center;
}

/* notebook */
@media screen and (max-width: 992px){
  #dialogo{
    height: 6.5rem; 
  }

  .item-3{
    width: 100%;
  }
  .item-3 .selectForma{
    width: 10vh;
  }
  .item-3 .selectProta{
    width: 15vh;
  }

  .selectContainer{
    width: 15vh;
  }

  .contenedor .enemigo{
    height: 25vh;
    padding-bottom: 2vh;
    margin-bottom: 2vh;
  }

  .ficha{
    width: 70vh;
  }
  .fichaDatos{
    width: 25vh;
  }


	.contenedor {
		grid-template-areas: "header header header"
							 "protagonista protagonista protagonista "
							 "widget-1 widget-2 sidebar"
							 "enemigo enemigo enemigo"
	}
	.contenedor .enemigo img {
		width: 40%;
  
	}

  .Intromodal{
    height: 100vh;
    padding-bottom: 0;
    margin: 0;
  }
  .intro-modal-content{
    height:100vh;
    font-size: 0.8rem;
    padding: 0;
    margin: 0;
  }

  .intro-modal-content p{
  padding: 0.1rem;
}

.intro-modal-content img,.modal-content img {
  width:20rem;
  height:10rem;
}

.intro-modal-button {
  transition: 20s all;
  width: 20rem;
  height: 3rem;
  background: rgb(249,229,127);
  background: radial-gradient(circle, rgba(249,229,127,1) 0%, rgba(223,152,0,1) 100%);
  color:black;
}




}

/* laptop */
@media screen and (max-width: 768px){

  .item-1{
    display: none;
  }

  .item-3{
    width: 100%;
  }
  .item-3 #personaje{ 
    width: 10vh;
    height: 10vh;
    color: white;
  }
  .item-3 .selectForma{
    width: 10vh;
  }
  .item-3 .selectProta{
    width: 15vh;
  }

  .selectContainer{
    width: 20vh;
  }

  #zeno{
    width: 25vh;
    height: 15vh;
  }

  .contenedor .enemigo {
    height: 20vh;
    padding-bottom: 2vh;
}
  .contenedor .enemigo .enemydata img {
    width: 15vh;
}
 .enemydata{
  display: flex;
  align-items: center;
 }
 .enemydata .NvlPelea{
  margin-top: 0;
 }
 .enemydata .NvlPelea p{
  margin: 0;
 }


	.contenedor {
		grid-template-areas: "header header header"
              	"enemigo enemigo enemigo"
						 	 "widget-1 widget-2 sidebar"
	}


  .ficha{
        width: fit-content;
      }
      .item-3 .selectProta,.item-3 .selectContainer{
        width:13vh;
      }
      
      .fichaDatos{
        height: 10vh;
        width: 20vh;
      }

      #zeno{
        height: 10vh;
        width: 20vh;
      }
      


}

/* mobile */
@media screen and (max-width: 600px){
	.contenedor {
		grid-template-areas: "header header header"
             				 "enemigo enemigo enemigo"
						 	 "sidebar widget-1 widget-2"
	}
	.contenedor .enemigo {
		  height: auto;
		  grid-area: enemigo;
		  display:flex;
		  flex-direction: row;
		  justify-content:space-between;
		  overflow: hidden;
	  }

    .enemydata p{
    display: none;
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
			
			}
      
      .ficha{
        width: fit-content;
      }
      .item-3 .selectProta,.item-3 .selectContainer{
        width:7vh;
      }
      
      .fichaDatos{
        width: 10vh;
      }
      .fichaDatos .extra{
        display: none;
      }
    }

@media screen and (max-width: 425px){

.ficha{
width: fit-content;
}
.item-3 .selectProta,.item-3 .selectContainer{
  width:7vh;
}

.fichaDatos{
  width: 10vh;
}

.fichaDatos .extra{
  display: none;
}
#zeno{
  width: 10vh;
  height: 5vh;

}
.placa{
  height:80vh;
}

#dialogo{
  width:90%;
}
.contenedor{
  width:90%;
}

}




  </style>

<script>
import {personajes as pjs,formas,imgenemigo,options as tecnicas,enemies,enemyColors,descripcionesLuchadores as enemyDescs, Luchar,Empujar,Huir} from '../logic/Torneo'

export default {
  name: "Torneo",
  data () {
    return {
      personajesRst: JSON.parse(JSON.stringify(pjs)),
      personajes: JSON.parse(JSON.stringify(pjs)),
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
    enablerun:"#55a8fd",
      auracolor:"white",
      imagenProta:"/img/characters/enemies/Enemy2.jpg",
      imagenEnemy:"/img/characters/enemies/Enemy3.jpg",
      poderEnemy: 9000,
      enemyName:"Bonato",
      enemyDesc:"Un guerrero de clase baja pero mucho potencial.",
      enemyColor:"Black",
      tecnicaActual:"Sin Tecnica",
      energiaActual:1000,

      results:{
        derrotados:-1,
        puntaje:0,
        perfects:0
      },

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
        modalMessage:"Hace mucho tiempo, el Rey de Todo, quien tenía el control de los dieciocho universos existentes en ese entonces, borra de la existencia a seis de ellos, en un ataque de ira y furia, dejando solo doce universos en la actualidad. \n En la actualidad, Goku le dio la idea de organizar un TORNEO DE FUERZA. \n En la mayoria de las lineas temporales, Zeno no planeaba borrar ningun universo. Pero en esta linea temporal Zeno-Sama no ha quedado conforme con un simple torneo por diversion. En su lugar ha decidido que si el torneo no es lo suficiente interesante, lo interrumpira en cualquier momento... Y en ese mismisimo instante acabara con los 12 universos!!! Podran Goku y sus amigos entretenerlo lo suficiente para sobrevivir un dia mas?",
        modalHTPMessage:"En la parte superior se encuentra tu personaje. Empezas con Goku pero podes elegir entre varios. En el centro estan los datos de ese personaje y a la derecha podes elegir en que forma vas a pelear. Mientras mas poderosa la forma, mas aumenta tu poder y podes derrotar enemigos mas fuertes! Pero ojo que mientras mas poderosa la tranformacion mas costo energetico tiene!! \n Una vez elegido el setting de arriba, podes elegir la opcion que mas te convenga a traves de los botones 'LUCHAR','EMPUJAR' o 'HUIR'. LUCHAR es basicamente enfrentarte con el enemigo con sus poderes. EMPUJAR es para desechar a un enemigo sin pelear, cuando la diferencia es grande, pero hay que tener cuidado de que no haya mucha diferencia de poderes! HUIR es para cambiar de personaje y solo podras hacerlo si superas a un enemigo por al menos el doble de poder.",
        modalImg:"/img/events/intro.jpg",
        modalOpacity:1,
      },
      actionModal:{
        modalImg:"",
        modalWidth:"-100px",
        modalOpacity:0,
        modalDisplay:"none",
        dialogColor:"black",
        dialogWidth:"45%"
      },
      actionSound:{
        aura:new Audio('/sounds/aura.mp3'),
        surprise:new Audio('/sounds/surprise.mp3'),
        punch1:new Audio('/sounds/punch1.mp3'),
        punch2:new Audio('/sounds/punch2.mp3'),
        kiblast:new Audio('/sounds/kiblast.mp3'),
        fly:new Audio('/sounds/fly.mp3'),
      }
    }
  },

  computed: {
    // personaje(){
    // return personajes[0];
    // },
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
      todaslasformas = todaslasformas.sort((a, b) => a.id - b.id);
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
        if (this.formaactual.id  != 1 ){
          this.actionSound.aura.play();
        }
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
        this.modalImg = "/img/characters/Playables/chibigoku.png";
        this.pjactual = this.personajes[0];
        this.manageEnemy();
        this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
        this.enablepj = true;
        this.enablerun = "#55a8fd";
        setTimeout(() => {  this.introModal.modalDisplay = "none"; }, 2000);
        this.actionSound.surprise.play();
        
    },
    actuar:function (accion) {
      this.actionModal.modalDisplay = "block";
      this.actionModal.modalOpacity = "1";
      this.actionModal.modalWidth = "100vh";
      this.actionModal.modalImg = accion;
      this.actionModal.dialogColor = "whitesmoke";
      this.actionModal.dialogWidth = "30%";
      // El personaje gasta energia de acuerdo a la tranformacion que usa al pelear
    setTimeout(() => {  
      this.actionModal.modalDisplay = "none";
      this.actionModal.modalOpacity = "0";
      this.actionModal.modalWidth = "-100px";
      this.actionModal.dialogColor = "black";
      this.actionModal.dialogWidth = "95%";
   }, 2000);
    },
    luchar: function (p1,p2, event) {
    // El jugador gana puntos dependiendo la diferencia de poder entre el personaje actual y el enemigo que aparece
    // Si hay muchisima diferencia de poder y matas al rival, Zeno se enoja y mata al jugador.
    event.preventDefault();
    this.manageEnergy();
    this.enablerun = "#a5b6c8";
    this.actionSound.punch2.play();

    this.pjactual.energia = this.pjactual.energia - this.formaactual.id;
    if (this.tecnicaActual.nombre != "Sin Tecnica")
    {
      this.actuar("/img/events/luchar.png");
      this.pjactual.energia = this.pjactual.energia - ((this.tecnicaActual.porc/100) * (this.pjactual.max));
    }

    // Si no tiene energia suficiente se desmaya personaje gasta energia de acuerdo a la tranformacion que usa al pelear
    if (this.pjactual.energia < 0){
      this.actuar("/img/events/fallo.png");
      this.enablerun="#55a8fd";
      this.dialogo = "El participante " + this.pjactual.nombre + " comienza a luchar pero no puede mantener su transformacion!! Su cuerpo no lo resiste! Se ha desmayado... Zeno esta muy decepcionado de ese fallo.";
      this.manageProta();
      this.results.puntaje -=50;
    }

    else if (this.tecnicaActual.nombre === "MAFUBA"){
      // Si usas el MAFUBA ganas la pelea de una pero no lo podes usar mas
      this.actuar("/img/events/luchar.png");
      this.results.puntaje +=20;
      this.manageZeno(-1);
      this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.dialogo = "El participante " + this.pjactual.nombre + " utiliza una tecnica especial! Acaba de crear un gran remolino que envuelve a su oponente! Lo ha atrapado en un termo! Increible!";
      this.manageEnemy();
    }
    else if (this.diferenciadepoder > 20) {
      this.actuar("/img/events/lucharST.png");
      this.results.puntaje -=300;
      this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.manageZeno(1);
      this.dialogo = "El participante " + this.pjactual.nombre + " aplasta a " +this.enemyName + 
      " la diferencia de poderes era abismal! Zeno-Sama se muestra molesto...";
      this.manageEnemy();
    }
    else if (this.diferenciadepoder > 10) {
      this.actuar("/img/events/lucharST.png");
      this.results.puntaje +=10;
      this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.manageZeno(-1);
      this.manageEnemy();
      this.dialogo = "El participante " + this.pjactual.nombre + " derrota con facilidad a su oponente. Apenas si ha sido un espectaculo. Una pena.";
    }
    else if (this.diferenciadepoder > 5){
      this.actuar("/img/events/lucharST.png");
      this.results.puntaje +=50;
      this.manageZeno(-1);
      this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.manageEnemy();
      this.dialogo = "El participante " + this.pjactual.nombre + " y "+
      this.enemyName + " estan dando una tremenda batalla! Increible! La balanza se inclina hacia " + this.pjactual.nombre 
       + " con un increible golpe knoquea a su rival! Zeno se ve realmente emocionado!";

    }
    else if (p1 >=p2){
      this.actuar("/img/events/lucharST.png");
      this.results.puntaje +=100;
      this.manageZeno(-1);
      this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.dialogo = "El participante " + this.pjactual.nombre + " enfrenta a " +this.enemyName + 
      ". La batalla es muy pareja pero finalmente " +this.pjactual.nombre  + " se alza con la victoria!";
      this.manageEnemy();
      this.results.perfects +=1;
    }
    else if (this.diferenciadepoder > 0.5){
      this.actuar("/img/events/lucharST.png");
       // Si esta parejo y perdes, a Zeno le emociona y te da 50 puntos aunque pierdas
      this.results.puntaje +=50;
      this.manageZeno(-1);
      if (this.tecnicaActual === "ESCUDO"){
        // Si esta parejo y usas escudo, sobrevivis y ganas la pelea, a Zeno le emociona y te da 150 puntos extra
        this.results.puntaje +=150;
        this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
        this.dialogo = "El participante " + this.pjactual.nombre + " enfrenta a " +this.enemyName 
        + ". Ambos estan dando una increible batalla! Impresionante! Parece que la balanza se inclina hacia " + this.enemyName
       + "quien con un increible golpe ... Esperen! "+ this.pjactual.nombre + " utiliza un escudo... ha hecho un contrataque y..."
       + this.pjactual.nombre + "se alza con la victoria!!! Zeno se ve realmente emocionado!";
      }
      else {
        this.enablerun="#55a8fd";
        this.dialogo = "El participante " + this.pjactual.nombre + " enfrenta con todas sus fuerzas a " +this.enemyName 
        + ". Ambos estan dando una increible batalla! Esta muy parejo! Pero la balanza se inclina hacia " + this.enemyName
       + "quien con un increible golpe knoquea a su oponente!";
        this.manageZeno(1);
        this.manageProta();
      }
    }
    else{
      this.enablerun="#55a8fd";
      this.actuar("/img/events/fallo.png");
      // Si perdes la pelea, Zeno se enoja y te resta 10 puntos
      this.dialogo = "Vaya... el participante " + this.pjactual.nombre + " no tuvo oportunidad contra " +this.enemyName 
        + ". La diferencia de poderes simplemente era muy grande. Zeno no parece contento con este resultado.";
      this.results.puntaje -=10;
      this.manageZeno(1);
      this.manageProta();
    }
  },
     empujar: function (p1,p2, event) {
      event.preventDefault();
      this.pjactual.energia = this.pjactual.energia - (this.formaactual.id/2);
      if (this.tecnicaActual.nombre != "Sin Tecnica")
      {
        this.actuar("/img/events/luchar.png");
        this.pjactual.energia = this.pjactual.energia - ((this.tecnicaActual.porc/100) * (this.pjactual.max));
      }
      this.manageEnergy();
      this.actuar("/img/events/empujar.png");
      this.enablerun = "#a5b6c8";

    if (p1 >p2 && this.diferenciadepoder < 10) {
      this.results.puntaje +=50;
      this.actionSound.kiblast.play();
      this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.dialogo = "Sin ningun inconveniente, el participante " + this.pjactual.nombre + " ha empujado de la plataforma a " +this.enemyName 
        + ". La diferencia de poderes ha hecho que sea sencillo empujarlo. Zeno no parece contento con este resultado.";
      this.manageZeno(-1);
      this.manageEnemy();
    }
    else if (p1 >p2 && this.diferenciadepoder > 10) {
      this.results.puntaje -=50;
      this.actionSound.kiblast.play();
      this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.dialogo = "Vaya... el participante " + this.pjactual.nombre + " ha destrozado a " +this.enemyName 
        + " al tratar de empujarlo. La diferencia de poderes simplemente era muy grande. Zeno no parece contento con este resultado.";
      this.manageZeno(1);
      this.manageEnemy();
    }
    else if (this.tecnicaActual.nombre === "PARALISIS" && this.diferenciadepoder > 0.3){
      // Si usas el PARALISIS y lo empujas funciona barbaro y ganas muchos puntos aunque te gane por bastante
      this.results.puntaje +=50;
      this.manageZeno(-1);
      this.actionSound.punch1.play();
      // this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.dialogo = "El participante " + this.pjactual.nombre + " ha paralizado a " +this.enemyName 
        + " con esa tecnica ha sido muy facil empujarlo. Zeno esta contento con esta maniobra";
      this.manageEnemy();
     
    }
    else if (this.tecnicaActual.nombre === "TAIYOKEN" && this.diferenciadepoder > 0.5){
      // Si usas el TAIYOKEN y lo empujas funciona barbaro y ganas muchos puntos aunque te gane por bastante
      this.results.puntaje +=50;
      this.actionSound.punch1.play();
      this.manageZeno(-1);
      // this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.dialogo = "El participante " + this.pjactual.nombre + " ha cegado con su tecnica a " +this.enemyName 
        + " vaya que fue facil empujarlo de la plataforma. Zeno esta contento con esta tactica";
      this.manageEnemy();
      
    }
    else{
      this.actuar("/img/events/fallo.png");
      this.actionSound.punch2.play();
      this.results.puntaje -=10;
      this.manageZeno(1);
      this.manageProta();
      this.dialogo = "Vaya... el participante " + this.pjactual.nombre + " no ha podido ni mover a " +this.enemyName 
        + ". La diferencia de poderes simplemente era muy grande. Zeno no parece contento con este resultado.";
     
    }
  },
      huir: function (p1,p2, event) {
    event.preventDefault();
    this.manageEnergy();
    if (p1 >(p2 * 2)) {
      this.actuar("/img/events/huir.png");
      this.actionSound.fly.play();
      this.results.puntaje +=10;
      // this.poderEnemy = Math.round((Math.random(10000) * 100) *  (Math.random(10000) * 1000));
      this.enablepj = true;
      this.enablerun = "#55a8fd";
      this.dialogo = "El participante " + this.pjactual.nombre + " logra escapar de " +this.enemyName 
        + ". Esto no parece agradarle mucho a Zeno, pero esta a la expectativa de quien sera el proximo participante.";
        //Animacion de combo personajes?
    }
    else if ((this.tecnicaActual.nombre === "TAIYOKEN" || this.tecnicaActual.nombre === "PARALISIS") && this.diferenciadepoder > 0.5){
      // Si usas el TAIYOKEN y lo empujas funciona barbaro y ganas muchos puntos aunque te gane por bastante

      this.actuar("/img/events/luchar.png");
      this.actionSound.punch1.play();
      this.pjactual.energia = this.pjactual.energia - ((this.tecnicaActual.porc/100) * (this.pjactual.max));
      this.dialogo = "El participante " + this.pjactual.nombre + " usa una tecnica especial para tratar de escapar de " +this.enemyName 
        + ". Ha sido efectiva! Ha escapado con exito y Zeno se emociona con semejante tactica!.";
      this.enablepj = true;
      this.enablerun = "#55a8fd";
      this.results.puntaje +=50;
      this.manageZeno(-1);
    }
    else{
      this.actuar("/img/events/fallo.png");
      this.actionSound.punch2.play();
      this.results.puntaje -=10;
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
    this.results.derrotados +=1;
    },
    manageZeno: function(mod) {
        //GAMEOVER ZENO
      if (this.estadoZeno === 5 && mod === 1)
       { this.GOZ();}

      if (this.estadoZeno <= 5 && this.estadoZeno >= 1 ){
        if (this.estadoZeno === 1 && mod === -1) {mod = 0}
        if (this.estadoZeno === 5 && mod === 1) {mod = 0}
        this.imagenZeno = `/img/characters/Zeno/Zeno${this.estadoZeno + mod}.jpg`;
        this.estadoZeno += mod;
      }

      if (this.results.puntaje > 1000 ){
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
    manageEnergy: function() {
      let personajesbanca = this.personajes.filter(personaje => personaje.nombre != this.pjactual.nombre);
      personajesbanca.map((personaje) => {
        if (personaje.energia < personaje.max){
          personaje.energia += personaje.max/10;
          if (personaje.energia > personaje.max){
            personaje.energia = personaje.max;
          }
      }
    });

    },
    GOV:function() {
        this.modal = "block";
        this.modalVH = "100%";
        this.modalOpacity = 1;
        this.modaltext = "black";
        this.modalMessage = "Tu equipo ha entretenido lo suficiente al dios de todo! Gracias a tu esfuerzo el multiverso y todos los seres se han salvado! Felicidades Campeon!!";
        let modifier = Math.round(Math.random() * (4 - 1) + 1)
        this.modalImg = `/img/events/win${modifier}.jpg`;
      },
    GOL:function() {
        this.modal = "block";
        this.modalVH = "100%";
        this.modalOpacity = 1;
        this.modaltext = "black";
        this.modalMessage = "Tu equipo ha sido derrotado y tu universo  condenado a la destruccion... Los habitantes de tu mundo observan poco a poco como todo desaparece en grandes destellos resplandecientes.        Quizas tendras mas suerte en otra linea temporal.";
        this.modalImg = "/img/events/LoseEnding.jpg";
      },
    GOZ:function() {
        // this.enemyColor = "white";
        this.modal = "block";
        this.modalVH = "100%";
        this.modalOpacity = 1;
        this.modaltext = "black";
        this.modalMessage = "Zeno Sama ha tenido suficiente y el multiverso comienza a desaparecer en una espiral de desesperacion. Todo lo que conoces pronto no existe mas... Quizas tendras mas suerte en otra linea temporal. ";
        this.modalImg = "/img/events/ZenoEnding.jpg";
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
        this.results.puntaje = 0;
        this.results.derrotados =-1;
        this.results.perfects =0;
        // Uso esto tanto aca como en la asignacion inicial para evitar que asigne la referencia y no el valor
        this.personajes = JSON.parse(JSON.stringify(this.personajesRst));
        this.pjactual= this.personajes[0];
        this.manageEnemy();
        this.dialogo =  "Y la campana da inicio al torneo Taikai!";
        this.enablepj = true;
    }
},

}
</script>
  