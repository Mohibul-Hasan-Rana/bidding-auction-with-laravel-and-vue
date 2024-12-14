import { createRouter, createWebHistory } from 'vue-router';
import App from '../App.vue';


const routes = [
  { path: '/', name: 'App', component: '' },  
];

export default createRouter({
  history: createWebHistory(),
  routes,
});