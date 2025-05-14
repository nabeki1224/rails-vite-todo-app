import { createApp } from 'vue'
import ListContainer from '@/components/ListContainer.vue'

const el = document.getElementById('list-container')
if (el) {
    const lists = JSON.parse(el.dataset.lists!)
    createApp(ListContainer, { lists }).mount(el)
}
