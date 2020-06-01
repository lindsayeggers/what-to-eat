import Vue from "vue/dist/vue.esm.js"

Vue.component("v-result", {
  props: {
		restaurants: Array
	},
	data() {
		return {
			restaurant: {}
		}
	},
	methods: {
		getRestaurant() {
			let numOfResults = this.restaurants.length
			let randomNum = Math.floor(Math.random() * numOfResults)
			return this.restaurant = this.restaurants[randomNum]
		}
	},
	created() {
		this.getRestaurant();
	}
})

function start() {
  new Vue({
    el: "#app"
  })
}

function ready(fn) {
  if (document.readyState != "loading"){
    fn()
  } else {
    document.addEventListener("DOMContentLoaded", fn)
  }
}

ready(start)

export default function () {}
