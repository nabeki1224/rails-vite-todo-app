<template>
  <NewList  />
  <ListTable :lists="props.lists" />
</template>

<script setup lang="ts">
  import NewList from './NewList.vue'
  import ListTable from './ListTable.vue'

  const props = defineProps<{
    lists: { id: number; title: string; content: string }[]
  }>()
</script>
