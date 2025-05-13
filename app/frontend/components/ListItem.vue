<template>
  <template v-for="list in lists">
    <tr class="border-b border-gray-200">
      <td class="px-6 py-3 text-left"><input :value="list.title" /></td>
      <td class="px-6 py-3 text-left"><input :value="list.content" /></td>
    </tr>
  </template>
</template>

<script setup lang="ts">
  interface ListItem {
    id: number
    title: string
    content: string
  }

  const { lists } = defineProps<{ lists: ListItem[] }>()
</script>
