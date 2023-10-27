<template>
  <section class="placa">
    <div class="item item-1"></div>
    <div class="item item-3">
      <div id="personaje" v-bind:style="{ backgroundImage: 'url(' + imagenProta + ')' }" >
        <div class="invisible">  {{ auracolor.auracolor }}</div>
      </div>
      <div class="ficha">
        <select class="selectProta" name="pj" id="pj" v-model="pjactual">
          <option v-for="(item, key) in personajes" :value="item">
            {{item.nombre}}
        </option>
        </select>
        <div class="fichaDatos">
          <div class="ficha-item">  {{ pjactual.nombre }}</div>
          <div class="ficha-item">  Raza: {{ pjactual.raza }}</div>
          <div class="ficha-item">  Ki: {{ pjactual.ki }}</div>
          <!-- <div class="ficha-item">  {{ formaactual.modo }}</div> -->
        <transition name="slide-fade" mode="out-in">
              <div class="ficha-item poder" :key="this.poderactual">
                Poder Actual : {{ this.poderactual }} 
              </div>
      </transition>
        </div>
        Forma
        <select class="selectProta" name="forma" id="forma" v-model="formaactual">
          <option v-for="(item, key) in formaspj" :value="item">
            {{item.modo}}
          </option>
        </select>
      </div>
      <div id="zeno" v-bind:style="{ backgroundImage: 'url(' + imagenZeno + ')' }" ></div>
    </div>
  <div class="contenedor">
        <aside className="sidebar">
			    <h3>PELEAR</h3>
		    </aside>
        <div className="enemigo">
          <div className="enemydata">

          <h3>{{ imgenemigo }}</h3>
          <p> ENEMIGO ACTUAL</p>
          <p>Nivel de Pelea: {{poderEnemy}}</p>
          <!-- <img src="/chibigoku.png" alt=""> -->
          <img v-bind:src="imagenEnemy" alt="">
          
          <!-- <select name="select"  id='pjselect' 
          onChange={handleChange}
          // defaultValue={{ label: "Cambiar Personaje", value: 0 }}
          // value={enemigo}
          
          >
            {personajes.map(pj => <option key={pj.id} value={JSON.stringify(pj)}>{pj.nombre}</option> )}
          </select>
        

          <p>Forma Actual: {formaProta}</p>
          <div className="formas">
            
          {misformas.map(forma => 
            <button key={forma.id} type="button" style={{background:forma.aura}} onClick={() => changeForm(forma.modo,forma.aura)}>{forma.modo}</button>)}
          </div>
          </div>

          <img style={{borderColor:formaColor}} src={enemigo.img} 
          width="250" height="200" 
          alt="enemigo"/> -->

          </div>
        </div>
        <div className="widget-1">
          <h3>EMPUJAR</h3>
        </div>
        <div className="widget-2">
          <h3>HUIR</h3>
        </div>

      </div>
        <!-- <div class="item item-4">4</div>
        <div class="item item-5">5</div>
        <div class="item item-6">6</div>
        <div class="item item-7">7</div>
        <div class="item item-8">8</div> -->
      <div class="item item-2" id="dialogo">El participante Goku esquiva el primer golpe. Se transforma en Super Saiyayin! Golpea a su rival.
        Goku asesta el primer golpe. Su rival, Raspberry , apenas puede mantenerse en pie. Zeno-Sama comienza a aburrirse, por lo que Goku considera cambiar de forma para hacer la batalla mas interesante.

      </div>
      <!-- <div class="marginator">AHHHH</div> -->
    </section>
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
    margin-top: 10rem;
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
   height: 10rem; 
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
    background-color: cadetblue;
    top: 0px;
    width: 99%;
    height: 10rem;
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
    background-color:#55a8fd;
    height: 8rem;
    width: 20rem;
    display: flex;
    justify-content: space-around;
    flex-direction: column;
    transition: all 1s ease-out;
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
  


/*   
  @media (min-width: 1024px) {}
*/

/* Migrado de Grid Tournament */
.contenedor {
	width: 95%;
	/* max-width: 1000px; */
  padding: 2rem;
	margin: 20px auto;
	display: grid;
	grid-gap: 20px;
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
border: 10px;
/* border-color: #fAA43D; */
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
	grid-column: 3 / 4;
	background: #fAA43D;
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100px;
	grid-area: sidebar;
}

.contenedor .widget-1,
.contenedor .widget-2 {
	background: #55a8fd;
	color: #fff;
	height: 100px;
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
  /* align-items: cen; */
  justify-content: space-around;
}





  </style>

<script>
import {personajes,formas,imgenemigo,options as tecnicas,Luchar,Empujar,Huir} from '../logic/Torneo'

export default {
  name: "Torneo",
  data () {
    return {
      personajes: personajes,
      formas:formas,
      pjactual:		{
		  id: 90,
		  nombre: 'Goku',
		  raza:'saiyajin',
		  ki:'divino',
		  img:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfCQVP-lxNewrbhT5y2M0RdAHRg-aFxdSrpQ&usqp=CAU",
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
      auracolor:"white",
      imagenProta:"/img/characters/enemies/Enemy2.jpg",
      imagenEnemy:"/img/characters/enemies/Enemy3.jpg",
      imagenZeno:"/img/characters/Zeno/Zeno5.jpg",
      poderEnemy: 9000
      // options: personajes.map(pj => <option key={pj.id} value={JSON.stringify(pj)}>{pj.nombre}</option> )
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
      // const result = words.filter((word) => word.length > 6);
      console.log(this.pjactual.raza);
      // console.log(pjactual.raza);
      console.log(posiblesformas);
      console.log(formaspublicas);
      this.formaactual = formaspublicas[0];
      var todaslasformas = formaspublicas.concat(posiblesformas);
      console.log(todaslasformas);
      return todaslasformas;
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
        this.imagenProta = "/img/characters/enemies/Enemy4.jpg";
        return pjactual.id * this.formaactual.id;
      }

    }
  }
}
</script>
  