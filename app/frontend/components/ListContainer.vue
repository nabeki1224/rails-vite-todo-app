<template>
  <NewList :lists="props.lists" @update-lists="handleUpdate" />
  <ListTable :lists="localLists" />
</template>

<script setup lang="ts">
  import NewList from './NewList.vue'
  import ListTable from './ListTable.vue'
  import { ref } from 'vue';

  const props = defineProps<{
    lists: { id: number; title: string; content: string }[]
  }>()

  const localLists = ref(props.lists)

  const handleUpdate = (newLists) => {
    localLists.value = [...newLists]
  }
</script>
