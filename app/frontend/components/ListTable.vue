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
      <tr v-for="(list, index) in props.lists" :key="index">
        <td class="px-6 py-4">{{  list.title }}</td>
        <td class="px-6 py-4">{{ list.content }}</td>
        <td class="px-6 py-4"><ListDeleteBtn :listId="list.id" @deleted="handleDelete" /></td>
      </tr>
    </tbody>
  </table>
</template>

<script setup lang="ts">
  import { ref } from 'vue'
  import ListDeleteBtn from './ListDeleteBtn.vue'

  const props = defineProps<{
    lists: { id: number; title: string; content: string }[]
  }>()
  console.log(props.lists)

  const locallists = ref(props.lists)

  const handleDelete = (id: number) => {
    locallists.value = locallists.value.filter(list => list.id !== id)
  }
</script>
