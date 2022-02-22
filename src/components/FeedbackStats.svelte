<script lang="ts">
  import { FeedbackStore } from "../stores";

  $: count = $FeedbackStore.length;
  $: average = $FeedbackStore.reduce((a, { rating }) => a + rating, 0) / count;
</script>

<div class="feedback-stats">
  <h4>{count} {count === 1 ? "Review" : "Reviews"}</h4>

  <h4>Ratings Average: {average ? average.toFixed(1) : 0}</h4>
</div>

<style lang="scss">
  .feedback-stats {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
</style>
