<template>
  <NewList :lists="originLists" @add-lists="handleAdd" />
  <ListTable :lists="originLists" @lists-updated="handleListsUpdate" />
</template>

<script setup lang="ts">
  import NewList from './NewList.vue'
  import ListTable from './ListTable.vue'
  import { ref } from 'vue';

  const props = defineProps<{
    lists: { id: number; title: string; content: string }[]
  }>()

  const originLists = ref([...props.lists])

  const handleAdd = (newList) => {
    originLists.value = [...originLists.value, newList]
  }

  const handleListsUpdate = (updatedLists: {id: number; title: string; content: string}[]) => {
    originLists.value = updatedLists
  }
</script>
