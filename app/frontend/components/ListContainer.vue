<template>
  <NewList :lists="props.lists" @add-lists="handleAdd" />
  <ListTable :lists="originLists" />
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
</script>
