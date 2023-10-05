import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faGithub, faLinkedin } from '@fortawesome/free-brands-svg-icons'
import { faEnvelope } from '@fortawesome/free-regular-svg-icons'
import { faLocationDot, faMobileScreenButton, faHouse, faCode, faLaptopCode, faPhone } from '@fortawesome/free-solid-svg-icons'
library.add(faGithub, faLinkedin, faEnvelope, faLocationDot, faMobileScreenButton, faHouse, faCode, faLaptopCode, faPhone)

import axios from 'axios'
axios.defaults.baseURL = 'http://localhost:3000';

const app = createApp(App)

app.use(router)
app.component('font-awesome-icon', FontAwesomeIcon)
app.mount('#app')