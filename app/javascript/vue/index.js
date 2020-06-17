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
	computed: {
		encodedAddress() {
			if (this.restaurant.address) {
				return encodeURI(`${this.restaurant.address} ${this.restaurant.city} ${this.restaurant.state}`)
			}
			return encodeURI(this.restaurant.name)
		},
		directionsURL() {
			return `https://www.google.com/maps/dir/?api=1&destination=${this.encodedAddress}`
		},
		imgSrc() {
			return `${this.restaurant.photo.prefix}250x250${this.restaurant.photo.suffix}`
		},
		getReview() {
			if (this.restaurant.review) {
				return `${this.restaurant.review.object.text} -${this.restaurant.review.object.user.firstName}`
			}
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
