import matplotlib.pyplot as plt
import matplotlib.patches as patches
from matplotlib.patches import FancyBboxPatch, ConnectionPatch
import numpy as np
from matplotlib.patches import Rectangle, Circle, FancyArrowPatch
import matplotlib.patches as mpatches
from matplotlib import image as mpimg

# Set up the figure
fig, ax = plt.subplots(1, 1, figsize=(12, 8))
ax.set_xlim(0, 12)
ax.set_ylim(0, 8)
ax.axis('off')

# Color scheme
primary_blue = '#1f4e79'
secondary_green = '#2e8b57'
accent_red = '#dc3545'
light_gray = '#f8f9fa'
dark_gray = '#343a40'

# Background
ax.add_patch(Rectangle((0, 0), 12, 8, facecolor=light_gray, edgecolor='none'))

# Title

# Sequential Decision Diagram
# Decision points (rectangles)
decision_points = [(2, 7), (5, 7), (8, 7)]
for i, (x, y) in enumerate(decision_points):
    rect = FancyBboxPatch((x-0.4, y-0.3), 0.8, 0.6, 
                          boxstyle="round,pad=0.1", 
                          facecolor=primary_blue, edgecolor='none')
    ax.add_patch(rect)
    ax.text(x, y, f't={i+1}', fontsize=12, fontweight='bold', 
            ha='center', va='center', color='white')

# Price observation points (circles)
price_points = [(3.5, 7), (6.5, 7)]
for i, (x, y) in enumerate(price_points):
    circle = Circle((x, y), 0.4, facecolor=secondary_green, edgecolor='none')
    ax.add_patch(circle)
    ax.text(x, y, f'price, x_{i+1}', fontsize=10, fontweight='bold', 
            ha='center', va='center', color='white')

# Arrows
# Continue arrows (green)
continue_arrows = [
    ((2.4, 7), (3.1, 7)),  # t=1 to price
    ((3.9, 7), (4.6, 7)),  # price to t=2
    ((5.4, 7), (6.1, 7)),  # t=2 to price
    ((6.9, 7), (7.6, 7)),  # price to t=3
    ((8.4, 7), (9.5, 7.5))  # t=3 continue
]

for start, end in continue_arrows:
    arrow = FancyArrowPatch(start, end, arrowstyle='->', 
                           mutation_scale=20, color=secondary_green, linewidth=2)
    ax.add_patch(arrow)

# Exercise arrows (red)
exercise_arrows = [
    ((2, 6.7), (2, 5.5)),  # t=1 exercise
    ((5, 6.7), (5, 5.5)),  # t=2 exercise
    ((8, 6.7), (8, 5.5))   # t=3 exercise
]

for start, end in exercise_arrows:
    arrow = FancyArrowPatch(start, end, arrowstyle='->', 
                           mutation_scale=20, color=accent_red, linewidth=2)
    ax.add_patch(arrow)

# Labels
# Exercise labels (below arrows)
ax.text(2, 5.2, 'Exercise', fontsize=14, fontweight='bold', 
        ha='center', va='center', color=accent_red)
ax.text(2, 4.8, 'max(K-x_0,0)', fontsize=10, fontweight='bold', 
        ha='center', va='center', color=accent_red)
ax.text(5, 5.2, 'Exercise', fontsize=14, fontweight='bold', 
        ha='center', va='center', color=accent_red)
ax.text(5, 4.8, 'max(K-x_1,0)', fontsize=10, fontweight='bold', 
        ha='center', va='center', color=accent_red)
ax.text(8, 5.2, 'Exercise', fontsize=14, fontweight='bold', 
        ha='center', va='center', color=accent_red)
ax.text(8, 4.8, 'max(K-x_2,0)', fontsize=10, fontweight='bold', 
        ha='center', va='center', color=accent_red)

# Continue labels (above arrows) - positioned at arrow midpoints
ax.text(3.00, 7.50, 'Continue', fontsize=14, fontweight='bold', 
        ha='center', va='center', color=secondary_green)
#ax.text(4.25, 4.3, 'Continue', fontsize=10, fontweight='bold', 
#        ha='center', va='center', color=secondary_green)
ax.text(6.00, 7.5, 'Continue', fontsize=14, fontweight='bold', 
        ha='center', va='center', color=secondary_green)
#ax.text(7.25, 4.3, 'Continue', fontsize=10, fontweight='bold', 
#        ha='center', va='center', color=secondary_green)
ax.text(9.5, 7.75, 'Continue', fontsize=14, fontweight='bold', 
        ha='center', va='center', color=secondary_green)

# Mathematical elements in background

# RL elements

# Python code snippet (stylized)

# Add stock paths image at the bottom
stock_img = mpimg.imread('blog/rl_for_option/stock_paths_test.png')
# Calculate position to place the image at the bottom
img_height = 4  # Height of the image in figure coordinates
img_width = 8     # Width of the image in figure coordinates
img_x = (12 - img_width) / 2  # Center horizontally
img_y = 0.2       # Position at the bottom

# Create a rectangle to place the image
img_rect = Rectangle((img_x, img_y), img_width, img_height, 
                     facecolor='white', edgecolor=primary_blue, linewidth=2)
ax.add_patch(img_rect)

# Add the image
ax.imshow(stock_img, extent=[img_x, img_x + img_width, img_y, img_y + img_height], 
          aspect='auto', zorder=1)

plt.tight_layout()
plt.savefig('blog/rl_for_option/cover_image.png', dpi=300, bbox_inches='tight', 
            facecolor=light_gray, edgecolor='none', pad_inches=0.1)
plt.show()

print("Cover image created as 'cover_image.png'") 


