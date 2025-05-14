import { createApp } from 'vue'
import ListItem from '@/components/ListItem.vue'

const el = document.getElementById('list-item')
if (el) {
  const lists = JSON.parse(el.dataset.lists!)
  createApp(ListItem, { lists }).mount(el)
}
