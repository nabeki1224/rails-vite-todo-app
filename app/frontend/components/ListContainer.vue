<template>
  <NewList :lists="props.lists" @update-lists="handleUpdate" />
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

  const handleUpdate = (newList) => {
    originLists.value = [...originLists.value, newList]
  }
</script>
