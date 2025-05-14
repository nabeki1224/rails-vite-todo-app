<template>
  <NewList @created="addList" />
  <ListTable :lists="lists" />
</template>

<script setup lang="ts">
  import { ref, watch } from 'vue'
  import NewList from './NewList.vue'
  import ListTable from './ListTable.vue'

  interface ListItem {
    id: number
    title: string
    content: string
  }

  const lists = ref<

  const addList = (list: ListItem) => {
    lists.value.unshift(list)
  }

  watch(() => props.lists, (newVal) => {
    console.log('props.lists changed!', newVal) // ← ここ
    lists.value = [...newVal]
  })
</script>
