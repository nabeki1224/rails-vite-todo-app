import { createApp } from 'vue'
import ListContainer from '@/components/ListContainer.vue'

const listContainerDom = document.getElementById('list-container')
if (listContainerDom) {
    const lists = JSON.parse(listContainerDom.dataset.lists!)
    createApp(ListContainer, { lists }).mount(listContainerDom)
}
