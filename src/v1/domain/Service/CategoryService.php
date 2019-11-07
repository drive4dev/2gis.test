<?php
/**
 * Created by PhpStorm.
 * User: maggotik
 * Date: 11/6/19
 * Time: 11:36 PM
 */

namespace Domain\Service;


class CategoryService
{
    /**
     * @param array $categories
     * @return array
     */
    public function buildTrees(array $categories): array
    {
        $trees = array();

        if (count($categories) > 0) {
            // Node Stack. Used to help building the hierarchy
            $stack = array();

            foreach ($categories as $category) {
                $item = $category;
                $item->children = array();

                // Number of stack items
                $l = count($stack);

                // Check if we're dealing with different levels
                while ($l > 0 && $stack[$l - 1]->level >= $item->level) {
                    array_pop($stack);
                    $l--;
                }

                // Stack is empty (we are inspecting the root)
                if ($l == 0) {
                    // Assigning the root node
                    $i = count($trees);
                    $trees[$i] = $item;
                    $stack[] = &$trees[$i];
                } else {
                    // Add node to parent
                    $i = count($stack[$l - 1]->children);
                    $stack[$l - 1]->children[$i] = $item;
                    $stack[] = &$stack[$l - 1]->children[$i];
                }
            }
        }
        return $trees;
    }
}