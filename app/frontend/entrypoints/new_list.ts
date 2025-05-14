import { createApp } from 'vue'
import NewList from '@/components/NewList.vue'

const el = document.getElementById('new-list')
if (el) {
  createApp(NewList).mount(el)
}
