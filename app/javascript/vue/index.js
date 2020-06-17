import Vue from "vue/dist/vue.esm.js"

Vue.component("v-result", {
  props: {
		restaurants: Array
	},
	data() {
		return {
			randIndexes: [],
			restaurant: {}
		}
	},
	computed: {
		encodedAddress() {
			if (this.restaurant.address) {
				return `${this.restaurant.address}+${this.restaurant.city}+${this.restaurant.state}`
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
		getRandomNumArray() {
			let randArr = []
			let totalResults = this.restaurants.length
			while(randArr.length < totalResults) {
				let randNum = Math.floor(Math.random() *totalResults )
				if (!randArr.includes(randNum)) {
					randArr.push(randNum)
				}
			}
			return this.randIndexes = randArr
		},
		getRestaurant() {
			if (!this.randIndexes.length) {
				this.getRandomNumArray()
			}
			let index = this.randIndexes.pop()
			return this.restaurant = this.restaurants[index]
		}
	},
	created() {
		this.getRandomNumArray();
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
