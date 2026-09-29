# Structure Rationale

## 1. AppHeader
* **Trigger:** Readability.
* **Owns:** Layout details (padding, typography, colors) for the top banner.
* **Reports upward:** Nothing (it is purely stateless and presentational).

## 2. CategoryChip
* **Trigger:** Reuse.
* **Owns:** Visual styling for a selectable category button.
* **Reports upward:** Triggers `onTap` when the user selects a category, passing the interaction to the parent so the parent can update the active filter state.

## 3. FoodTile
* **Trigger:** Reuse.
* **Owns:** The layout structure of a food item (title, price formatting, layout positioning).
* **Reports upward:** Triggers `onAdd` when the add button is pressed, telling the parent screen to increment the cart item count and total price.

## 4. CartSummaryBar
* **Trigger:** Readability.
* **Owns:** The layout and styling of the bottom checkout panel.
* **Reports upward:** It does not report upward directly, but it relies on reading the `totalItems` and `totalPrice` passed down from the parent to display the current cart state.