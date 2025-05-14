<template>
  <NewList />
  <ListTable :lists="lists" />
</template>

<script setup lang="ts">
  import { ref } from 'vue'
  import NewList from './NewList.vue'
  import ListTable from './ListTable.vue'

  interface ListItem {
    id: number
    title: string
    content: string
  }

  const props = defineProps<{ lists: ListItem[] }>()
  const lists = ref<ListItem[]>([...props.lists])
</script>
