<template>
  <table class="w-full my-5">
    <thead class="bg-gray-100">
      <tr>
        <th class="px-6 py-3 text-left">タイトル</th>
        <th class="px-6 py-3 text-left">詳細</th>
        <th class="px-6 py-3 text-left"></th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="(list, index) in localLists" :key="index">
        <td class="px-6 py-4">{{  list.title }}</td>
        <td class="px-6 py-4">{{ list.content }}</td>
        <td class="px-6 py-4"><ListDeleteBtn :listId="list.id" @deleted="handleDelete" /></td>
      </tr>
    </tbody>
  </table>
</template>

<script setup lang="ts">
  import { ref, watch } from 'vue'
  import ListDeleteBtn from './ListDeleteBtn.vue'

  const props = defineProps<{
    lists: { id: number; title: string; content: string }[]
  }>()

  const localLists = ref(props.lists)

  watch(() => props.lists, (newLists) => {
    localLists.value = [...newLists]
  }, { deep: true })

  const handleDelete = (id: number) => {
    localLists.value = localLists.value.filter(list => list.id !== id)
  }
</script>
